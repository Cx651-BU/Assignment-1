#include <stdio.h>

extern int mystery(int a, int b);

typedef struct operation {
    char type;
    int a;
    int b;
} op;

/*
Takes as input a pointer to the starting element of an array of operations and
an integer length of the array.

Calc returns the final value of performing all the operations, in order, assuming the starting value is `0`.
If the operation "type" == ?, the final value should increment by the result of a call to "mystery" on a,b.
If the operation "type" == +, the final value should increment by the result of a + b.
If the operation "type" == -, the final value should increment by the result of a - b.
*/
int calc(op* ops, int op_len) {
    
}

int main(void) {
    op cmd[] = {{'?',12,123}, {'+', 10,30}, {'-', 10,30}};
    printf("%d\n", calc(cmd, 3));
}