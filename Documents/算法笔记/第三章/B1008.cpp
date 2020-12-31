#include <cstdio>
int main(){
	int m,n;
	scanf("%d%d",&n,&m);
	int a[n];
	int i=m,j=0;
	while(j<n){
		if(i>=n) i=i%n;
		scanf("%d",&a[i]);
		i++;
		j++;
	}
	for(int i=0;i<n;i++){
		if(i!=0)printf(" ");
		printf("%d",a[i]); 
	}
}
