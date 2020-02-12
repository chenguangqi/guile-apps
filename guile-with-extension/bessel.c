#include <math.h>
#include <libguile.h>

SCM j0_wrapper(SCM x) {
  return scm_from_double(j0(scm_to_double(x)));
}

void init_bessel() {
  scm_c_define_gsubr("j0", 1, 0, 0, j0_wrapper);
}


// gcc -shared -o libguile-bessel.so -fPIC $(guile-config compile) $(guile-config link) bessel.c
