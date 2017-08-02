#include <stdio.h>
#ifdef _OPENMP
#include <omp.h>
#endif

#define NUM_THREADS 8
static long num_steps = 100000000;
double step;

int main() {
  double x;
  double pi = 0.0;
  step = 1.0/(double)num_steps;
  
  for (int i=0; i < num_steps; i = i+ 1) {
      x = (i+0.5)*step;
      pi = pi + 4/(1.0+x*x); //sum F(x)
    }
    printf("pi = %f", pi);
}