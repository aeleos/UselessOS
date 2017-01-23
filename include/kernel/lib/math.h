#ifndef MATH_H
#define MATH_H

#define MIN(x, y) ({typeof(x) x_ = (x); typeof(y) y_ = (y); (x_ < y_) ? x_ : y_;})
#define MAX(a,b) \
  ({ __typeof__ (a) _a = (a); \
      __typeof__ (b) _b = (b); \
    _a > _b ? _a : _b; })

double pow(double x, double pow);
unsigned long factorial(unsigned long x);

double sin(double val);
double arcsin(double val);
double cos(double val);
double arccos(double val);

int abs(int val);

double sqrt(double x);

#define RAND_MAX 32767
int rand();
void srand(unsigned int seed);

#endif
