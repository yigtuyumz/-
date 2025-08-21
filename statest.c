#include "generic.h"

char *get_next_line(int fd, char *debug);

int
main(int argc _U, char *argv[]_U, char *envp[]_U)
{
    char *line;

    line = get_next_line(0, (char *) &line);
    if (line)
        fprintf(stdout, "%s", line);
    else
        fprintf(stderr, "get_next_line returns NULL!\n");
    free(line);
    return (0);
}

char *
get_next_line(int fd _U, char *debug)
{
    static char *remain;
    char *ret;

    ret = MALLOC(char, 100);

    if (!ret) {
        fprintf(stderr, "malloc for ret failed!\n");
        return (NULL);
    }
    if (debug) {
        fprintf(stdout, "static pointer points to %p\n", remain);
        remain = debug;
    }
    bzero(ret, 100);
    return (ret);
}
