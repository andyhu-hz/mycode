#include "dtls.h"
#include <unistd.h>

int connect_dtls_socket()
{
    return 0;
}

int dtls_reconnect(int* dtls_fd)
{
    dtls_close(dtls_fd);
    return connect_dtls_socket();
}


int main(int argc, char* argv[])
{
    printf("hello, dtls server\n");
    struct sockaddr_in dtls_addr;
    //socklen_t addrlen = 0;
    SSL* dtls_ssl = NULL;
    int dtls_fd = 0;
    int dtls_bind_addrlen = 0;
    int dtls_local_port = 5000;
    int fd_width = 0;
    fd_set wfd;
    int ret = 0;
    int sndbuf = 0;
    int bufsize = 1024;
    char *buf = NULL;
    int len = 0;
    int error = 0;
    struct timeval timeout;
    
    buf = OPENSSL_malloc(bufsize);
    if(NULL == buf) {
        printf("out of memory\n");
    }

    dtls_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (dtls_fd < 0) {
        printf("Open UDP socket for DTLS failed\n");
        return -1;
    }

    sndbuf = 1500* 2;
    setsockopt(dtls_fd, SOL_SOCKET, SO_SNDBUF, (void *)&sndbuf, sizeof(sndbuf));
    dtls_bind_addrlen = sizeof(dtls_addr);
    dtls_addr.sin_family = AF_INET;
    dtls_addr.sin_port = htons(dtls_local_port);
    dtls_addr.sin_addr.s_addr = INADDR_ANY;

    if (-1 == bind(dtls_fd, (struct sockaddr *)&dtls_addr, dtls_bind_addrlen)) {
        printf("Error: failed to bind UDP socket on port %d\n", dtls_local_port);
        close(dtls_fd);
        return -2;  
    } 

    fcntl(dtls_fd, F_SETFL, fcntl(dtls_fd, F_GETFL) | O_NONBLOCK);
    fcntl(dtls_fd, F_SETFD, fcntl(dtls_fd, F_GETFD) | FD_CLOEXEC);
    fcntl(dtls_fd, F_SETFL, fcntl(dtls_fd, F_GETFL) | O_NDELAY);
    
    ret = start_dtls_handshake(0, &dtls_ssl, dtls_fd);
    if (ret) {
        close(dtls_fd);
        return ret;
    }
    
    printf("Dtls server bind socket (fd %d) on port %d\n", dtls_fd, dtls_local_port);
    
    fd_width = dtls_fd + 1;
    FD_ZERO (&wfd);
    FD_SET (dtls_fd, &wfd);
    
    timeout.tv_sec = 10;
    timeout.tv_usec = 0;
    
    ret = SSL_do_handshake(dtls_ssl);
	printf("SSL_do_handshake return value = %d\n", ret);
	
    print_status("after SSL_do_handshake", dtls_ssl);
    struct sockaddr_in addr;
    /*
    addrlen = sizeof(struct sockaddr_in);
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(server_port);
    */

	/*
    while(1) {
        
		print_status("before DTLSv1_listen", dtls_ssl);
		int ret = DTLSv1_listen(dtls_ssl, (struct sockaddr *)&addr);
        if(1 == ret) {
			print_status("after DTLSv1_listen", dtls_ssl);
            printf("A clinet connect to dtls server, client address is %u\n", addr.sin_addr.s_addr);
            break;
        }
    }
	*/
	
    
    while(1) {
		print_status("before SSL_accept", dtls_ssl);
        int ret = SSL_accept(dtls_ssl);
        if(1 == ret) {
			print_status("after SSL_accept", dtls_ssl);
            printf("Server accept connection successfully, client address is %u.\n", addr.sin_addr.s_addr);
            break;
        }
    }
    
    while(1) {
        ret = select (fd_width, &wfd, NULL, NULL, &timeout);
        if (ret > 0 && FD_ISSET(dtls_fd, &wfd))
        {
            /*printf("select return code is %d\n", ret);
            recv_byte = SSL_pending(dtls_ssl);
            if(0 == recv_byte) {
                //printf("pending, len equare 0, can't read data from socket fd\n");
                continue;
            }
            */
			print_status("before DTLS_RECV", dtls_ssl);
            len = DTLS_RECV(dtls_ssl, buf, bufsize);
			print_status("after SSL_accept", dtls_ssl);
            if(len < 0) {
                //sprintf("Received data length less than 0, len=%d\n", len);
                sleep(2);
                continue;
            } else {
                printf("Received data:[%s], len is %d\n", buf, len);
            }
        }    
    }

    close(dtls_fd);
    return 0;
}
