#include "dtls.h"
#include <string.h>
#include <sys/select.h>

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
    printf("hello, dtls client\n");
    socklen_t addrlen = 0;
    SSL *dtls_ssl = NULL;
    int dtls_fd = 0;
    int server_port = 5000;
    int ret = 0, sndbuf = 0;

    int fd_width = 0;
    //int error = 0;
    struct timeval timeout;
    char* str = "Hello, DTLS client";
    int send_len = strlen(str);
    fd_set wfd;

    int bufsize = 10240;
    char *buf = NULL;

    buf = OPENSSL_malloc(bufsize);
    if(NULL == buf) {
        printf("out of memory\n");
    }
    memset(buf, 0, bufsize);
    sprintf(buf, "%s", str);

    dtls_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (dtls_fd < 0) {
        printf("Open UDP socket for DTLS failed\n");
        return -1;
    } else {
        printf("Dtls client bind socket on fd: %d\n", dtls_fd);
    }

    fd_width = dtls_fd + 1;
    FD_ZERO (&wfd);
    FD_SET (dtls_fd, &wfd);
    
    timeout.tv_sec = 10;
    timeout.tv_usec = 0;
    sndbuf = 1500* 2;
    setsockopt(dtls_fd, SOL_SOCKET, SO_SNDBUF, (void *)&sndbuf, sizeof(sndbuf));

    struct sockaddr_in addr;
    addrlen = sizeof(struct sockaddr_in);
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(server_port);

    if (connect(dtls_fd, (struct sockaddr *)&addr, addrlen)) {
        printf("UDP (DTLS) connect failed\n");
        close(dtls_fd);
        return -3;
    }

    fcntl(dtls_fd, F_SETFL, fcntl(dtls_fd, F_GETFL) | O_NONBLOCK);
    fcntl(dtls_fd, F_SETFD, fcntl(dtls_fd, F_GETFD) | FD_CLOEXEC);

    ret = start_dtls_handshake(1, &dtls_ssl, dtls_fd);
	printf("SSL_do_handshake return value = %d\n", ret);
	print_status("start_dtls_handshake", dtls_ssl);
    if (ret) {
        close(dtls_fd);
        printf("start_dtls_handershake failed!\n");
        return ret;
    }
    
    SSL_do_handshake(dtls_ssl);
    
    while(1) {   
        //int len = 1500;
        ret = select(fd_width, NULL, &wfd, NULL, &timeout);
        if (ret > 0 && FD_ISSET(dtls_fd, &wfd))
        {
            //printf("select return code is %d\n", ret);
			print_status("after SSL_do_handshake", dtls_ssl);
            ret = DTLS_SEND(dtls_ssl, buf, send_len);
			print_status("after DTLS_SEND", dtls_ssl);
            if(ret > 0) {
                printf("Client send a string to server via DTLS\nThe return code is %d\n", ret);
                break;
            } else {
                //printf("DTLS send message failed, return code is %d\n", ret);
                //error = SSL_get_error(dtls_ssl, ret);
                //printf("Error: %d\n", error);
            }
        }
        
        /*
        len = DTLS_RECV(dtls_ssl, buf, bufsize);
        if(len < 0) {
            printf("len less than 0\n");
            break;
        } else {
            printf("len is %d\n", len);
        }
        */
    }
    return 0;
}