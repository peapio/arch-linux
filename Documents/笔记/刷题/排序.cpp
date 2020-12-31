#include <cstdio>
int A[5] = {5,1,4,2,3};
int n=5;
//—°‘Ò≈≈–Ú
 void selectSort(){
 	
 	for(int i=0;i<n;i++){
 		int k=i;
 		for(int j=i+1;j<n;j++){
 			if(A[j]<A[k])
 				k = j;
		 }
		 int temp = A[i];
		 A[i] = A[k];
		 A[k] = temp;
	 }
 }
//≤Â»Î≈≈–Ú
void insertSort(){
	for(int i=1;i<n;i++){
		int temp = A[i],j=i;
		while(j>0&&temp<A[j-1]){
			A[j] = A[j-1];
			j--;
		}
		A[j] = temp;
	}
}
int main(){
	
//	selectSort();
	insertSort();
	for(int i=0;i<5;i++){
		printf("%d",A[i]);
	}
}
