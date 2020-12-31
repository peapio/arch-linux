#include <stdio.h>
int main(){
    int n,k,x;
    int a[n];
    scanf("%d",&n);
    for(int i=0;i<n;i++){
        scanf("%d",&a[i]);
    }
    scanf("%d",&x);
    for(int i=0;i<n;i++){
        if(a[i]==x){
            k = i;
            break;
        }
    }
    printf("%d",k);
}
