#include <iostream>
#include <string>
#include <algorithm>
#include <map>
#include <vector>
using namespace std;
int main(){
    string num;
    cin>>num;
    num = "0"+num;
    vector<int> res;
    int hashmap[20] = {0};
    int hash[20] = {0};
    for(int i=num.length();i>=1;i--){
        hashmap[num[i]-'0']++;
        num[i] = (num[i]-'0')*2+'0';
    }
    int t=0;
    for(int i=num.length();i>=0;i--){
        if(num[i]-'0'>=10){
            res.push_back(num[i]-'0'-10+t);
            t=1;
        }else{
            res.push_back(num[i]-'0'+t);
            t=0;
        }
    }
    for(int i=res.size()-1;i>0;i--){
        if(i==res.size()-1&&res[i]==0)continue;
        hash[res[i]]++;
    }
    int i;
    for(i=0;i<20;i++){
        if(hash[i]!=hashmap[i]){
            cout<<"No"<<endl;
            break;
        }
    }
    if(i==20){
        cout<<"Yes"<<endl;
    for(int i=res.size()-1;i>0;i--){
        if(i==res.size()-1&&res[i]==0)continue;
        cout<<res[i];
    }
    }
    return 0;
}
