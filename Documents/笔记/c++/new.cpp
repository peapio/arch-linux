#include <iostream>
#include <string>
#include <algorithm>
#include <map>
#include <vector>
using namespace std;
const int maxn = 100;

void Selection_Sort(int *a,int n){
    for(int i=0;i<n;i++){ //每次找出第i位置的最小值
        for(int j=i+1;j<n;j++){
            if(a[j]<a[i]){
                swap(a[i],a[j]);
            }
        }
    }
}

void Bubble_Sort(int *a,int n){
    for(int i=0;i<n-1;i++){
        for(int j=0;j<n-1-i;j++){
            if(a[j]>a[j+1]){
                swap(a[j],a[j+1]);
            }
        }
    }
}

void Insertion_Sort(int *a,int n){
    int tmp=0;
    int j;
    for(int i=1;i<n;i++){
        tmp = a[i];
        for(j=i-1;j>=0&&a[j]>tmp;j--){
                a[j+1] = a[j];
        }
        a[j+1] = tmp;
    }
}

void merge(int *a,int l1,int r1,int l2,int r2){
    int i = l1;
    int j = l2;
    int temp[maxn],index=0;
    while(i<=r1&&j<=r2){
        if(a[i]<=a[j]){
            temp[index++] = a[i++];
        }else{
            temp[index++] = a[j++];
        }
    }
    while(i<=r1) temp[index++] = a[i++];
    while(j<=r2) temp[index++] = a[j++];
    for(int i=0;i<index;i++){
        a[l1+i] = temp[i];
    }
}

void Merge_Sort(int *a,int left,int right){
    if(left<right){
        int mid = (left+right)/2;
        Merge_Sort(a, left, mid);
        Merge_Sort(a, mid+1, right);
        merge(a, left, mid, mid+1, right);
    }
}

void merge_sort(int *a,int n){
    for(int step=2;step/2<=n;step*=2){
        for(int i=0;i<=n;i+=step){
            int mid = i+step/2-1;
            if(mid+1<=n){
                merge(a, i, mid, mid+1, min(i+step-1,n));
                // sort(a+i,a+min(i+step,n+1));
            }
        }
    }
}

int Partition(int *a,int left,int right){
    int tmp = a[left];
    while(left<right){
        while(a[right]>tmp)right--;
        swap(a[right],a[left]);
        while(a[left]<tmp)left++;
        swap(a[left],a[right]);
    }
    return left;
}

void Quick_Sort(int *a,int left,int right){
    if(left<right){
        int index = Partition(a, left, right);
        Quick_Sort(a,left,index-1);
        Quick_Sort(a,index+1,right);
    }
}

void Shell_sort(int *a,int n){
    int h=1;
    while(h<n/3) h = 3*h+1;
    while(h>=1){
        for(int i=h;i<n;i++){
            for(int j=i;j>=h&&a[j]<a[j-h];j-=h){
                swap(a[j],a[j-h]);
            }
        }
        h = h/3;
    }
}

void Print(int *a,int n){
    for(int i=0;i<n;i++){
        if(i!=0) cout<<" ";
        cout<<a[i];
    }
}

int main(){
    int a[10] = {72,6,57,88,60,42,83,73,48,85};
    Shell_sort(a, 10);
    Print(a, 10);
    return 0;
}
