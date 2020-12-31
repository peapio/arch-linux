#include <cstdio>
int main(){
	int N,failA=0,failB=0;
	int a1,b1,a2,b2;
	scanf("%d",&N);
	while(N--){
		scanf("%d%d%d%d",&a1,&a2,&b1,&b2);
		if(a1+b1==a2&&a1+a2!=b2){
			failB++;
		} else if(a1+b1==b2&&a1+b1!=a2){
			failA++;
		}
	}
	printf("%d %d\n",failA,failB);
}
