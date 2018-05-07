#include <stdio.h>

int main()
{
	for(int i=0;i<100;i++)
	{
		for(int j=0;j<100;j++)
		{
			for(int k=0;k<100;k++)
			{
				for(int l=0;l<100;l++)
				{
					printf("%d  ", i*1000000+j*10000+k*100+l);
				}
			}
		}
	}
	printf("\n");
}