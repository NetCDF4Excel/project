I got errors resulting from the definition

typedef long _off_t

in <sys/types.h>. This issue was previously dicussed on the list. I resolved it 
by adding the lines:

#ifndef _OFF_T_DEFINED
typedef long _off_t;                    /* file offset value */
#define _OFF_T_DEFINED
#endif

before #include <sys/types.h> in nc.h.

------------------------------------------------