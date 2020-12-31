# mysql笔记

## mysql的安装

> [mysql下载](https://dev.mysql.com/downloads/mysql/)
>
> [mysql安装](https://www.runoob.com/mysql/mysql-install.html)

**mysql8忘记密码**

```mysql
关掉mysql服务
net stop mysql					(windows)
sudo systemctl start mysqld		(linux)
进入mysql安装目录,以管理员形式运行cmd,然后运行如下命令,实现无密码登录.
mysqld --console --skip-grant-tables --shared-memory

```

