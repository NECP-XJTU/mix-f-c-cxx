void print_array_1d_c(int n, int *a);

int main() {
  int n=10;
  int a[n];
  int i;

  for (i=0; i<n; i++)
    a[i] = i;
  print_array_1d_c(n, a);

  return 0;
}
