#include <stdio.h>

int main()
{
	int i=0, j=0, k=0, l=0, m=0;
	while(i<100)
	{
		while(j<100)
		{
			while(k<100)
			{
				while(l<100)
				{
					printf("%d  ", i*1000000+j*10000+k*100+l);
				}
			}
			while(l<100)
			{
				printf("%d  ", i*1000000+j*10000+l);
			}
		}
		while(l<100)
		{
			printf("%d  ", i*1000000+j*10000+l);
		}
	}
	printf("\n");
}