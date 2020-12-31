#include <stdio.h>
int main(){
    int N,schID,score;
    int school[N];//¥¢¥Ê—ß–£±‡∫≈
    int Max=-1,k=0;
    scanf("%d",&N);
    for(int i=0;i<N;i++){
        scanf("%d%d",&schID,&score);
        school[schID]+=score;
    }
    for(int i=1;i<N;i++){
        if(school[i]>Max){
           Max = school[i]; 
           k = i;
        }
    }
    printf("%d %d\n",k,Max);
}
