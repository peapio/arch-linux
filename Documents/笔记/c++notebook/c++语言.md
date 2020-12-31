# c++语言

1.c++语言自带bool类型

```c++
bool flag = true
```

2.



## 命名空间(Namespace)

**目的**:解决多人开发命名冲突问题

```c++
namespace Li{		//小李声明的变量
	int flag = 1;
}
namespace Han{		//小韩声明的变量
    bool flag = 1;
}
//使用
//法1
Li::flag = 0;
Han::flag = false;
//法2
//使用using
using namespace Li;
flag = 0;
Han::flag = false;
//using声明后，若未出现具体指定命名空间的命名冲突变量，则默认采用Li命名空间的变量
```





