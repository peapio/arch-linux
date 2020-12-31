#include <cstdio>

int main(){
	int A,B,D;
	int a[100];
	scanf("%d%d%d",&A,&B,&D);
	int S = A+B;
	int result;
	int l,i=0;
	while(S/D){
		l = S%D;
		S = S/D;
		a[i] = l;
		i++;
	}
	a[i] = S;
	for(int j=i;j>=0;j--){
		printf("%d",a[j]);
	}
}
