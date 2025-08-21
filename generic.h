#ifndef GENERIC_DEPS
# define GENERIC_DEPS
# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <strings.h>
# include <string.h>
# include <fcntl.h>
# include <string.h>
# include <inttypes.h>
# include <stdint.h>

# define _U					__attribute__((unused))
# define MALLOC(TYPE, X)	((TYPE *) malloc(sizeof(TYPE) * X))

#endif // GENERIC_DEPS