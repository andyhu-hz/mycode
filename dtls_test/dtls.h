
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
//#include <netinet/in.h>
#include <arpa/inet.h>
#include <openssl/ssl.h>
#include <openssl/dtls1.h>
#include <openssl/rand.h>

#define DTLS_SEND SSL_write
#define DTLS_RECV SSL_read
#define DTLS_FREE SSL_free

int start_dtls_handshake(int type, SSL** dtls_ssl, int dtls_fd);
int dtls_try_handshake();
void dtls_shutdown();
int connect_dtls_socket();
void dtls_close();

void print_status(char prefix[], SSL* ssl);