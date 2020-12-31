#include <cstdio>
typedef struct {
	long ID;
	int examSeat;
}Stu;
int main(){
	int n,m;
	int seat,examSeat;
	long ID;
	scanf("%d",&n);
	Stu stu[n];
	for(int i=0;i<n;i++){
		scanf("%ld %d %d",&ID,&seat,&examSeat);
		stu[seat].ID = ID;
		stu[seat].examSeat = examSeat;
	}
	scanf("%d",&m);
	for(int i=0;i<m;i++){
		scanf("%d",&seat);
		printf("%ld %d\n",stu[seat].ID,stu[seat].examSeat);
	}
	return 0;
} 
