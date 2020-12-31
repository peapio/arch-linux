#include <cstdio>
#include <string>
#include <iostream>
using namespace std;
typedef struct {
	string name;
	string ID;
}Stu;

int main(){
	int n,min = 101,max = -1;
	string ID,name;
	int grade;
	scanf("%d",&n);
	Stu stu[101];
	for(int i=0;i<n;i++){
		cin>>name>>ID>>grade;
		stu[grade].ID = ID;
		stu[grade].name = name;
		if(grade>max){
			max = grade;
		}
		if(grade<min){
			min = grade;
		}
	}
	cout<<stu[max].name<<" "<<stu[max].ID<<endl;
	cout<<stu[min].name<<" "<<stu[min].ID<<endl;
	return 0;
}
