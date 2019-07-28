#include <iostream>

extern "C" {
  void print_1d(int n, int *a);
}

int main() {

  int *a;
  a = NULL;
  a = new int[3];
  a[0] = 0;
  a[1] = 1;
  a[2] = 2;
  print_1d(3, a);

  return 0;
}
