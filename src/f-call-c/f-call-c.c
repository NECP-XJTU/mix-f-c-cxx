#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_array_1d(int *a, int n) {
  int i;
  for (i = 0; i < n; i ++) {
    printf("%i-th val=%i\n", i, a[i]);
  }
}

void print_array_1d_1(int n, int a[n]) {
  int i;
  for (i = 0; i < n; i ++) {
    printf("%i-th val=%i\n", i, a[i]);
  }
}

int sum_array_1d(int *a, int n) {
  int sum = 0;
  int i;
  for (i = 0; i < n; i++)
    sum += a[i];
  return sum;
}

void change_val(int *a, int n, int *b) {
  int i;
  for (i = 0; i < n; i++)
    a[i] += 1;
  *b += 1 ;
}

void print_array_2d(int n0, int n1, int a[n0][n1]) {
  int i0, i1;
  for (i0 = 0; i0 < n0; i0++) {
    for (i1 = 0; i1 < n1; i1++) {
      printf("%i\n", a[i0][i1]);
    }
  }
}

void get_3_chars(char *str0, char *str1) {
  int i;
  for (i = 0; i < 3; i++)
    str1[i] = str0[i];
  str1[3] = '\0';
}
