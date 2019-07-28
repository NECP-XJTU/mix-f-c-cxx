#include <iostream>
#include "f-call-cxx.hpp"

using namespace std;

void print_array_1d(int n, int *a) {
  int i;
  for (i=0; i<n; i++)
    std::cout << a[i] << std::endl;
}

void TwoDArray::print() {
  int i;
  int j;
  for (i = 0; i < n0_; i++)
    for (j = 0; j < n1_; j++) {
      std::cout << array_[i][j] << std::endl;
    }
}

TwoDArray::TwoDArray(int n0, int n1) {
  int i;
  n0_ = n0;
  n1_ = n1;
  array_ = NULL;
  array_ = new int*[n0];
  for (i = 0; i < n0; i++) {
    array_[i] = new int[n1];
  }
}

extern "C" {
  void print_array_1d_c(int n, int *a) {
    print_array_1d(n, a);
  }

  TwoDArray* new_TwoDArray(int n0, int n1) {
    return new TwoDArray(n0, n1);
  }

  void set_TwoDArray(TwoDArray *a, int i, int *array) {
    int j;
    for (j = 0; j < a->n1_; j++) {
      a->array_[i-1][j] = array[j];
    }
  }

  void print_TwoDArray(TwoDArray *a) {
    a->print();
  }
}
