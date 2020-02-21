# linux服务器环境相关的安装说明

## 1：安装环境

安装前应该是i属于配置好了网络环境的如

## 安装yum指令

 apt-get install +yum） 

安装redis数据库需要先安装gcc编译器，否则redis不能正常安装
安装指令：（推荐yum）
yum -y install gcc gcc-c++ kernel-devel

手动安装（尚未尝试）
从CentOS7的系统安装镜像中取出需要的rpm包（也可以通过别的方式获取）：解压镜像文件，进入"Packages"目录，里面很多rpm包，取出如下几个：
mpfr-3.1.1-4.el7.x86_64.rpm
libmpc-1.0.1-3.el7.x86_64.rpm
kernel-headers-3.10.0-123.el7.x86_64.rpm
glibc-headers-2.17-55.el7.x86_64.rpm
glibc-devel-2.17-55.el7.x86_64.rpm
cpp-4.8.2-16.el7.x86_64.rpm
gcc-4.8.2-16.el7.x86_64.rpm
2.将这些包上传到待安装的系统中【可安装Xftp进行上传】，按如下顺序执行安装命令：

rpm -ivh mpfr-3.1.1-4.el7.x86_64.rpm
rpm -ivh libmpc-1.0.1-3.el7.x86_64.rpm
rpm -ivh kernel-headers-3.10.0-123.el7.x86_64.rpm
rpm -ivh glibc-headers-2.17-55.el7.x86_64.rpm
rpm -ivh glibc-devel-2.17-55.el7.x86_64.rpm
rpm -ivh cpp-4.8.2-16.el7.x86_64.rpm
rpm -ivh gcc-4.8.2-16.el7.x86_64.rpm
也可以使用如下命令统一安装：

rpm -Uvh *.rpm --nodeps --force
都安装成功后，验证
gcc -v

![image-20191206141548824](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20191206141548824.png)

【图片内容】警告：/var/cache/yum/x86_64/7/mysql57-community/packages/mysql-community-common-5.7.28-1.el7.x86_64.rpm: 头V3 DSA/SHA1 Signature, 密钥 ID 5072e1f5: NOKEY
mysql-community-common-5.7.28-1.el7.x86_64.rpm 的公钥尚未安装