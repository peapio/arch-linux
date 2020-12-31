#include <cstdio>
int change(char c){
	if(c=='B')return 0;
	if(c=='C')return 1;
	if(c=='J')return 2;
}
int main() {
	char mp[3] = {'B','C','J'};
	int n;
	scanf("%d",&n);
	int tA[3] = {0},tB[3] = {0};
	int hA[3] = {0},hB[3] = {0};
	char c1,c2;
	int k1,k2;
	for(int i=0;i<n;i++){
		getchar();
		scanf("%c %c",&c1,&c2);
		k1 = change(c1);
		k2 = change(c2);
		if((k1+1)%3==k2){
			tA[0]++;
			tB[2]++;
			hA[k1]++;
		} else if (k1==k2){
			tA[1]++;
			tB[1]++;
		} else{
			tA[2]++;
			tB[0]++;
			hB[k2]++;
		}
	}
	printf("%d %d %d\n",tA[0],tA[1],tA[2]);
	printf("%d %d %d\n",tB[0],tB[1],tB[2]);
	int id1 = 0,id2 = 0;
	for(int i=0;i<3;i++){
		if(hA[i]>hA[id1]) id1 = i;
		if(hB[i]>hB[id2]) id2 = i;
	}
	printf("%c %c\n",mp[id1],mp[id2]);
	return 0;
}
