
#include "dtls.h"

SSL_CTX *dtls_ctx = NULL;
//SSL *dtls_ssl = NULL;
SSL_SESSION *dtls_session = NULL;

int dtls_state;
//struct keepalive_info dtls_times;
unsigned char dtls_session_id[32];
unsigned char dtls_secret[48];

#define COOKIE_SECRET_LENGTH 16
int verbose = 0;
int veryverbose = 0;
unsigned char cookie_secret[COOKIE_SECRET_LENGTH];
int cookie_initialized=0;
static int s_server_session_id_context = 1; /* anything will do */

int ssl_init()
{
    SSL_library_init();
    OpenSSL_add_all_algorithms();
    return 0;
}

int dtls_verify_callback (int ok, X509_STORE_CTX *ctx) {
	/* This function should ask the user
	 * if he trusts the received certificate.
	 * Here we always trust.
	 */
	return 1;
}

int generate_cookie(SSL *ssl, unsigned char *cookie, unsigned int *cookie_len)
	{
	unsigned char *buffer, result[EVP_MAX_MD_SIZE];
	unsigned int length = 0, resultlength;
	union {
		struct sockaddr_storage ss;
		struct sockaddr_in6 s6;
		struct sockaddr_in s4;
	} peer;

	/* Initialize a random secret */
	if (!cookie_initialized){
	    if (!RAND_bytes(cookie_secret, COOKIE_SECRET_LENGTH)){
		printf("error setting random cookie secret\n");
		return 0;
	    }
	    cookie_initialized = 1;
	}

	/* Read peer information */
	(void) BIO_dgram_get_peer(SSL_get_rbio(ssl), &peer);
	
	//printf("AF_INET=%d\n", AF_INET);
	//printf("AF_INET6=%d\n", AF_INET6);
	//printf("peer.ss.ss_family=%d\n", peer.ss.ss_family);

	/* Create buffer with peer's address and port */
	length = 0;
	switch (peer.ss.ss_family) {
	    case AF_INET:
		    length += sizeof(struct in_addr);
		    break;
	    case AF_INET6:
		    length += sizeof(struct in6_addr);
		    break;
	    default:
		    OPENSSL_assert(0);
		    break;
	}
	length += sizeof(in_port_t);
	buffer = (unsigned char*) OPENSSL_malloc(length);

	if (buffer == NULL)
	{
	    printf("out of memory\n");
	    return 0;
	}

	switch (peer.ss.ss_family) {
	    case AF_INET:
		memcpy(buffer,
		       &peer.s4.sin_port,
		       sizeof(in_port_t));
		memcpy(buffer + sizeof(peer.s4.sin_port),
		       &peer.s4.sin_addr,
		       sizeof(struct in_addr));
		break;
	    case AF_INET6:
		memcpy(buffer,
		       &peer.s6.sin6_port,
		       sizeof(in_port_t));
		memcpy(buffer + sizeof(in_port_t),
		       &peer.s6.sin6_addr,
		       sizeof(struct in6_addr));
		break;
	    default:
		OPENSSL_assert(0);
		break;
	}

	/* Calculate HMAC of buffer using the secret */
	HMAC(EVP_sha1(), (const void*) cookie_secret, COOKIE_SECRET_LENGTH,
	     (const unsigned char*) buffer, length, result, &resultlength);
	OPENSSL_free(buffer);

	memcpy(cookie, result, resultlength);
	*cookie_len = resultlength;

	return 1;
}

int verify_cookie(SSL *ssl, unsigned char *cookie, unsigned int cookie_len)
{
	unsigned char *buffer, result[EVP_MAX_MD_SIZE];
	unsigned int length = 0, resultlength;
	union {
		struct sockaddr_storage ss;
		struct sockaddr_in6 s6;
		struct sockaddr_in s4;
	} peer;

	/* If secret isn't initialized yet, the cookie can't be valid */
	if (!cookie_initialized)
		return 0;

	/* Read peer information */
	(void) BIO_dgram_get_peer(SSL_get_rbio(ssl), &peer);

	/* Create buffer with peer's address and port */
	length = 0;
	switch (peer.ss.ss_family) {
		case AF_INET:
			length += sizeof(struct in_addr);
			break;
		case AF_INET6:
			length += sizeof(struct in6_addr);
			break;
		default:
			OPENSSL_assert(0);
			break;
	}
	length += sizeof(in_port_t);
	buffer = (unsigned char*) OPENSSL_malloc(length);

	if (buffer == NULL)
		{
		printf("out of memory\n");
		return 0;
		}

	switch (peer.ss.ss_family) {
		case AF_INET:
			memcpy(buffer,
			       &peer.s4.sin_port,
			       sizeof(in_port_t));
			memcpy(buffer + sizeof(in_port_t),
			       &peer.s4.sin_addr,
			       sizeof(struct in_addr));
			break;
		case AF_INET6:
			memcpy(buffer,
			       &peer.s6.sin6_port,
			       sizeof(in_port_t));
			memcpy(buffer + sizeof(in_port_t),
			       &peer.s6.sin6_addr,
			       sizeof(struct in6_addr));
			break;
		default:
			OPENSSL_assert(0);
			break;
	}

	/* Calculate HMAC of buffer using the secret */
	HMAC(EVP_sha1(), (const void*) cookie_secret, COOKIE_SECRET_LENGTH,
	     (const unsigned char*) buffer, length, result, &resultlength);
	OPENSSL_free(buffer);

	if (cookie_len == resultlength && memcmp(result, cookie, resultlength) == 0){
	    printf("verify cookie successfully!\n");
	    return 1;
	}

	return 0;
}

struct pass_info {
	union {
		struct sockaddr_storage ss;
		struct sockaddr_in6 s6;
		struct sockaddr_in s4;
	} server_addr, client_addr;
	SSL *ssl;
};


/*type: 0 for server, 1 for client*/
int start_dtls_handshake(int type, SSL** dtls_ssl, int dtls_fd)
{
    ssl_init();
    STACK_OF(SSL_CIPHER) *ciphers;
    const SSL_METHOD *dtls_method;
    SSL_CIPHER *dtls_cipher;
    //char* cipher_suites = "AES128-SHA:AES256-SHA";
    char* cipher_suites = "AES128-SHA";
    BIO *dtls_bio;
    
    if(0 == type) {
	dtls_method = DTLSv1_server_method();
    } else {
	dtls_method = DTLSv1_client_method();
    }

    if (!dtls_ctx) {
        dtls_ctx = SSL_CTX_new(dtls_method);
        if (!dtls_ctx) {
	    printf("Initialise DTLSv1 CTX failed\n");
	    return 101;
        }
        SSL_CTX_set_read_ahead(dtls_ctx, 1);
        if (!SSL_CTX_set_cipher_list(dtls_ctx, cipher_suites)) {
	    printf("Set DTLS cipher list failed\n");
	    SSL_CTX_free(dtls_ctx);
	    dtls_ctx = NULL;
	    return 102;
        }
	SSL_CTX_set_session_cache_mode(dtls_ctx, SSL_SESS_CACHE_OFF);
    }
    
    if(0 == type) {
	dtls_method = DTLSv1_server_method();
	if (!SSL_CTX_use_certificate_file(dtls_ctx, "./server.pem", SSL_FILETYPE_PEM)){
            printf("SSL_CTX_use_certificate_file() failed \n");
	    return 1001;
	}

	 if (!SSL_CTX_use_PrivateKey_file(dtls_ctx, "./server.pem", SSL_FILETYPE_PEM)) {
	    printf("SSL_CTX_use_PrivateKey_file() failed \n");
	    return 1002;
	}

	SSL_CTX_set_verify(dtls_ctx, SSL_VERIFY_PEER | SSL_VERIFY_CLIENT_ONCE, dtls_verify_callback);
	SSL_CTX_set_read_ahead(dtls_ctx, 1);
	SSL_CTX_set_cookie_generate_cb(dtls_ctx, generate_cookie);
	SSL_CTX_set_cookie_verify_cb(dtls_ctx, verify_cookie);
	SSL_CTX_set_session_id_context(dtls_ctx,(void*)&s_server_session_id_context,
		sizeof s_server_session_id_context);

    }

    if (!dtls_session) {
	/* We're going to "resume" a session which never existed. Fake it... */
	dtls_session = SSL_SESSION_new();
	if (!dtls_session) {
	    printf("Initialise DTLSv1 session failed\n");
	    return 103;
	}
	dtls_session->ssl_version = 0xFEFF; /* DTLS1_VERSION */
    }

    /* Do this every time; it may have changed due to a rekey */
    RAND_bytes(dtls_secret, sizeof(dtls_secret));
    dtls_session->master_key_length = sizeof(dtls_secret);
    memcpy(dtls_session->master_key, dtls_secret, sizeof(dtls_secret));

    dtls_session->session_id_length = sizeof(dtls_session_id);
    memcpy(dtls_session->session_id, dtls_session_id, sizeof(dtls_session_id));

    *dtls_ssl = SSL_new(dtls_ctx);

    ciphers = SSL_get_ciphers(*dtls_ssl);
    if (sk_SSL_CIPHER_num(ciphers) != 1) {
            printf("Not precisely one DTLS cipher\n");
            SSL_CTX_free(dtls_ctx);
            SSL_free(*dtls_ssl);
            SSL_SESSION_free(dtls_session);
            dtls_ctx = NULL;
            dtls_session = NULL;
            return 104;
    }
    dtls_cipher = sk_SSL_CIPHER_value(ciphers, 0);

    /* Set the appropriate cipher on our session to be resumed */
    dtls_session->cipher = dtls_cipher;
    dtls_session->cipher_id = dtls_cipher->id;

    /* Add the generated session to the SSL */
    if (!SSL_set_session(*dtls_ssl, dtls_session)) {
	printf("SSL_set_session() failed with old protocol version 0x%x\n", 
	    dtls_session->ssl_version);
	return 105;
    }
    
    if(0 == type) {
	dtls_bio = BIO_new_dgram(dtls_fd, BIO_NOCLOSE);
    } else {
	dtls_bio = BIO_new_socket(dtls_fd, BIO_NOCLOSE);
    }
    
    //dtls_bio = BIO_new_dgram(dtls_fd, BIO_NOCLOSE);
    //dtls_bio = BIO_new_socket(dtls_fd, BIO_NOCLOSE);
    
    struct timeval timeout;
    timeout.tv_sec = 5;
    timeout.tv_usec = 0;
    BIO_ctrl(dtls_bio, BIO_CTRL_DGRAM_SET_SEND_TIMEOUT, 0, &timeout);
    BIO_ctrl(dtls_bio, BIO_CTRL_DGRAM_SET_RECV_TIMEOUT, 0, &timeout);
    
    /* Set 0:blocking 1:non-blocking  */
    BIO_set_nbio(dtls_bio, 1);
    SSL_set_bio(*dtls_ssl, dtls_bio, dtls_bio);
    SSL_set_options(*dtls_ssl, SSL_OP_COOKIE_EXCHANGE);

    if(0 == type) {
	SSL_set_accept_state(*dtls_ssl);
    } else {
	SSL_set_connect_state(*dtls_ssl);
    }
    
    //SSL_set_options(dtls_ssl, SSL_OP_CISCO_ANYCONNECT);
    return 0;
}

int dtls_try_handshake()
{
    /*
    int ret = SSL_do_handshake(dtls_ssl);
    if (ret == 1) {
	    printf("Established DTLS connection (using OpenSSL). Ciphersuite.\n");
	    return 0;
    }

    ret = SSL_get_error(dtls_ssl, ret);
    printf("DTLS handshake failed: %d\n", ret);
    */
    return -1;
}

void dtls_shutdown()
{
    SSL_CTX_free(dtls_ctx);
    SSL_SESSION_free(dtls_session);
}

void dtls_close(SSL **dtls_ssl, int* dtls_fd)
{
    if (*dtls_ssl) {
        DTLS_FREE(*dtls_ssl);
        close(*dtls_fd);
        *dtls_ssl = NULL;
	*dtls_fd = -1;
    }
}

int last_status = 0;
void print_status(char prefix[], SSL* ssl) 
{
	int status = SSL_state(ssl);
	if(last_status != status)
	{
		printf("%s -- Dtls status is 0x%X\n", prefix, status);
        last_status = status;
	}
	
}


