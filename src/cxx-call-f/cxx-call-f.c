#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_1d(int n, int *a);

int main() {
  int *a;
  int n = 3;

  a = (int *) malloc(sizeof(int) * n);
  a[0] = 0;
  a[1] = 1;
  a[2] = 2;
  print_1d(n, a);

  return 0;
}
