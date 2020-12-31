#include <stdio.h>
int main(){
	int n;
	char c;
	scanf("%d %c",&n,&c);
	int col = n,row;
	if(col%2==0)
		row = col/2;
	else
		row = col/2+1;
	for(int i=0;i<row;i++){
		for(int j=0;j<col;j++){
			if(i==0||i==row-1){
				printf("%c",c);
			}else{
				if(j==0||j==col-1){
					printf("%c",c);
				}else{
					printf(" ");
				}
			}
		}
		printf("\n");
	}
} 
