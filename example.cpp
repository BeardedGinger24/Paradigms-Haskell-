#include <iostream.h>
using namespace std

int x = 12;
int myFunction(int &i){
	i = 15;
}

myFunction(x);
