#include <cstdio>

int main(){
	int n,m,i=2;
	int a[3] = {0};
	scanf("%d",&n);
	while(n/10){
		m = n%10;
		n=n/10;
		a[i] = m;
		i--;
	}
	a[i] = n;
	for(int j=0;j<a[0];j++)
		printf("B");
	for(int j=0;j<a[1];j++)
		printf("S");
	for(int j=1;j<=a[2];j++)
		printf("%d",j);
}
