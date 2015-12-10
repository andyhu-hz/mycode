#include "common.h"

/* For sockaddr_in */
#include <netinet/in.h>
/* For socket functions */
#include <sys/socket.h>
/* For fcntl */
#include <fcntl.h>

#include <event2/event.h>
#include <event2/buffer.h>
#include <event2/bufferevent.h>

#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

void
readcb(struct bufferevent *bev, void *ctx)
{
    struct evbuffer *input, *output;
    char *line;
    size_t n;
    input = bufferevent_get_input(bev);
    output = bufferevent_get_output(bev);

    while ((line = evbuffer_readln(input, &n, EVBUFFER_EOL_LF))) {
        printf("%s\n", line);
        free(line);
    }
}

static void eventcb(struct bufferevent *bev, short events, void *ptr)
{
  if (events & BEV_EVENT_CONNECTED) {
    evutil_socket_t fd = bufferevent_getfd(bev);
	evutil_make_socket_nonblocking(fd);
  } else if (events & BEV_EVENT_ERROR) {
    printf("NOT Connected\n");
  }
}

int main(int argc, char* argv[])
{
    printf("Start a libevent client\n");
    struct sockaddr_in sin;
    struct event_base *base;

    base = event_base_new();
	
    if (!base)
        return -1; /*XXXerr*/
	
	char* message = "Hello, Libevent! 12345678910!\n";
	
    sin.sin_family = AF_INET;
    //sin.sin_addr.s_addr =  inet_addr ("127.0.0.1");
	sin.sin_addr.s_addr = htonl(0x7f000001);
    sin.sin_port = htons(10001);
	
	struct bufferevent* bev = bufferevent_socket_new(base, -1, BEV_OPT_CLOSE_ON_FREE);
	bufferevent_setcb(bev, readcb, NULL, eventcb, NULL);
	bufferevent_enable(bev, EV_READ|EV_WRITE);
	evbuffer_add(bufferevent_get_output(bev), message, strlen(message));
	
	if (bufferevent_socket_connect(bev, (struct sockaddr *)&sin, sizeof(sin)) < 0) {
	      bufferevent_free(bev);
	      puts("error connect");
	      return -1;
	}

	event_base_dispatch(base);
	printf("After dispatch event.");
	bufferevent_free(bev);
    return 0;
}


