#include <cstdio>
int main(){
	int n;
	char c;
	scanf("%d",&n);
	getchar();
	c = getchar();
	/*
		1.ѭ��ȷ��k��˳��ȷ��ʣ����� 
		2. ͨ��k��ӡ�ϰ벿��
		3.���k==1��������ӡ�°벿�� 
	*/
	int k=1;
	while(k*k*2-1<n){
		k++;
	}
	k--;
	int s = 2*k-1;
	int m = k;
	int flag = 0;
	int r = n - (2*k*k-1);		//ʣ����ַ����� 
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
