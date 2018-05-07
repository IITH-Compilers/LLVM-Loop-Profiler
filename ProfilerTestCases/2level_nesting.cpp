#include <stdio.h>

int main()
{
	for(int i=0;i<100;i++)
	{
		for(int j=0;j<100;j++)
		{
			printf("%d  ", i*100+j);
		}
	}
	printf("\n");
}
