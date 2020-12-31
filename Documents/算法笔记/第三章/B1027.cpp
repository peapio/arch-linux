#include <cstdio>
int main(){
	int n;
	char c;
	scanf("%d",&n);
	getchar();
	c = getchar();
	/*
		1.循环确定k，顺便确定剩余个数 
		2. 通过k打印上半部分
		3.如果k==1反过来打印下半部分 
	*/
	int k=1;
	while(k*k*2-1<n){
		k++;
	}
	k--;
	int s = 2*k-1;
	int m = k;
	int flag = 0;
	int r = n - (2*k*k-1);		//剩余的字符个数 
	while(s){
		for(int i=k;i<m;i++){
			printf(" ");
		}
		for(int i=0;i<2*k-1;i++){
			printf("%c",c);
		}
		if(flag){
			k++;
		}else{
			k--;
		}
		if(k==1){
			flag = 1;
		}
		s--;
		printf("\n");
	}
	printf("%d",r);
	return 0;
	
} 
