# arch linux安装及配置指南 

[toc]

## 1. 启动盘的制作

### *<u>下载镜像文件</u>*

除了在arch linux官网上下载镜像，更推荐在镜像网站上下载，速度更快，但是注意日期

http://mirrors.163.com/

https://mirrors.tuna.tsinghua.edu.cn/

### *<u>制作启动盘</u>*

推荐rufus可随身携带，不需要安装

*Pattition scheme选择GPT* 

### *<u>window下分配磁盘空间</u>*

用于安装新系统，压缩卷，我选择40G，不用分配

## 2.arch linux安装

https://www.bilibili.com/video/BV11J411a7Tp?from=search&seid=16738506679399330893

制作完启动盘并且压缩空间后，插上u盘重启电脑，按F12(各电脑有所不同)选择从u盘启动

### *<u>连接网络</u>*

```shell
setfont /usr/share/kbd/consolefonts/LatGrkCyr-12×22.psfu.gz
```

先设置一个稍微大一点的字体，避免眼瞎

```shell
ip link
```

查看wifi设备

```shell
ip link set wlan0 up
```

wlan0是当前wifi设备，启用后<>中会有一个UP

```shell
iwlist wlan0 scan | grep ESSID
```

查看目前你家周围的wifi

```shell
wpa_passphrase 网络 密码 > 文件名（internet.conf）
```

生成连接wifi的配置文件

```shell
wpa_supplicant -c internet.conf -i wlan0 &
```

连接互联网

如果连接不上，动态分配ip地址

```shell
dhcpcd &
#最后ping www.baidu.com看一下好不好使ctrl-c停止
```

设置当前的时间

```shell
timedatectl set-ntp true
#可以用date命令查看当前时间
```

### *<u>分区</u>*

https://www.bilibili.com/video/BV14z4y1X7eh?from=search&seid=8598778633488337677

```shell
fdisk -l 
```

查看硬盘

```shell
gdisk /dev/sda #你安装的那块磁盘
```

首先确定你是BIOS 模式还是EFI 模式

如果是BIOS 只需要分一个分区用于安装系统

如果如果是EFI 需要分一个系统引导，一个系统安装

具体大小相见arch linux 官网

一下以UEFI 为例

```shell
#gisk /dev/sda
n	#新建一个分区
询问Partition number（分区编号）
First sector硬盘起始位置，回车默认
Last sector结尾部分，输入+512MB
再输入n	#新建系统分区
直接都回车，把剩下的都分给系统
```

```shell
p	#打印下当前的分区情况
没有问题
```



