#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_1d_f(int n, int *a);

void print_2d_f_right1(int n0, int n1, int a[n1][n0]);

void print_2d_f_right2(int n0, int n1, int *a);

void print_2d_f_wrong(int n0, int n1, int **a);

int main() {
  int i;
  int j;

  // 1d array
  int n = 3;
  int *b;

  b = (int *) malloc(sizeof(int) * n);
  for (i = 0; i < n; i++)
    b[i] = i;
  printf("print 1d array\n");

  // int n = 3;
  // int *b;
  print_1d_f(n, b);

  // 2d array
  int n0 = 2;
  int n1 = 3;
  int c[n1][n0];
  int **a;

  a = (int**) malloc(sizeof(int*) * n1);
  for (i = 0; i < n1; i++) {
    a[i] = (int*) malloc(sizeof(int) * n0);
    for (j = 0; j < n0; j++) {
      a[i][j] = i+j;
      c[i][j] = i+j;
    }
  }

  printf("the values are wrong\n");
  printf("print 2d array\n");
  print_2d_f_wrong(n0, n1, a);

  printf("the values are right1\n");
  // int n0 = 2;
  // int n1 = 3;
  // int c[n1][n0];
  print_2d_f_right1(n0, n1, c);

  printf("the values are right2\n");
  print_2d_f_right2(n0, n1, &c[0][0]);
  return 0;
}
