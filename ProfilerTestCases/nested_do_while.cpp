#include <stdio.h>

int main()
{
	int i=0, j=0, k=0, l=0, m=0;
	do {
		do {
			do {
				do {
					printf("%d  ", i*1000000+j*10000+k*100+l);
				}while(l<100);
			}while(k<100);
			do {
				printf("%d  ", i*1000000+j*10000+l);
			}while(k<100);
		}while(l<100);
		do {
			printf("%d  ", i*1000000+j*10000+l);
		}while(j<100);
	}while(i<100);
	printf("\n");
}