# 安装准备

1：进入官网下载镜像

> 找到中国的源进行下载
>
> https://www.archlinux.org/download/

2：准备磁盘烧录工具或者虚拟机

> 如：win32diskimager-1.0.0-install.exe
>
> 或者：UltraISO



## U盘格式化

格式化U盘后，将官网下载的启动镜像烧录到U盘中



## 安装步骤

重启电脑，设置U盘启动

进入archlinux的界面

>  输入指令 : wifi-menu  连接wifi  如果接入网线则不需要该步骤

正式开始

### 下列指令顺序执行

1：查看磁盘：

> 指令一：fidsk -l
>
> 指令二：lsblk

**两个指令均可查看安当前电脑的所接入的磁盘**

只要目的是找打要装系统的盘的名字

### 2：找到要安装的U盘或者磁盘

如名字：sdb

### 3： 格式化磁盘

fdisk /dev/sdb 

此时进入格式化工具fdisk的程序中，对sdb这个U盘进行格式化和分区

分别输入如下指令

1：o   # 创建DOS分区表

2：n				# 新建分区

3：可以输入p也可直接回车

4：可以输入1也可直接回车

5：直接回车

6：+256M  # EFI分区的大小

7：如果提示确认则输入y，否则忽略这一条

8：n					# 新建分区

9：可以输入p也可直接回车

10：可以输入3   # 为了设置一个大概1G的swap分区，当做虚拟缓存

11：直接回车

12：+1G  # 虚拟缓存分区的大小

13：直接回车

14：n					# 新建分区

15：可以输入p也可直接回车

16：可以输入2也可直接回车

17：直接回车

18 ：分区结束，

19：w				# 输入w保存之前的设置并退出，执行完这一步，U盘已经被分成了三个区域

**执行到这一步的时候，磁盘已经被格式好了此时输入fdisk -l或者lsblk可以看到sdb已经被分出了sdb1、sdb2、sdb3三个区域，其中：sdb1大小为256M，sdb3为1G，sdb2为U盘剩余大小，此时可以进行下一步**

### 4：格式化结束后的设置分区的属性



> 1：格式化引导区：EFI区
>
> mkfs.fat -F 32 /dev/sdb1

> 2：格式化虚拟缓存：swap分区
>
> mkswap /dev/sdb3  		#设置格式
>
> swapon /dev/sdb3 		 #启用

> 3：格式化主分区：有两种选择：如果使用U盘建议第二种，如果是硬盘则随意,第二种是不带系统日志的ext4
>
> 3.1：mkfs.vfat /dev/sdb2
>
> 3.2：mkfs.ext4 -O "^has_journal" /dev/sdb2    
>
> 3.3: 还有一种方法结果和第一种一样，记不清了，好像是mkfs.ext4的指令

**此时三个盘的区域已经完全设置完毕了**

另外swap分区是可以选择没有的，只有EFI和主分区也是可以i的。

### 5：挂载分区

5.1：挂载分区

>  mount /dev/sdb2 /mnt

5.2：创建EFI目录（用于UEFI引导）

> mkdir -p /mnt/boot/efi

5.3：将efi挂载到sdb1

> mount /dev/sdb1 /mnt/boot/efi

**挂载完成后开始安装前的设置，看下系统有没vim编辑器，如果没有请输入pacman -S vim 进行安装，会使用其他编辑器也可以**

### 6：安装前设置



6.1：软件源设置：屏蔽掉所有的外国的源，只用国内的，不同的源，软件下载速度不一样，可以自己百度一下当下时间下载速度的最快源是哪个，建议保留两个左右。

> 先备份一份下载源的文件，
>
> cd /etc/pacman.d    #进入这个目录
>
> cp mirrorlist mirrorlist.bk		# 复制一份
>
> cat mirrorlist.bk |grep Chinal -A 1 | grep -V '-' > mirrorlist 		#将所有国内的源写入到mirrorlist
>
> vim mirrorlist 			#进入mirrorlist文件进行编辑，吧多余的源注释掉，或者不操作也行。

### 7：安装系统

> 7.1：pacstarp -i /mnt base base-devel			#安装这一步需要一段时间

> 7.2：pacstarp /mnt linux linux-firmware

> 7.3 ： genfstab -U -p /mnt > /mnt/etc/fstab		# 生成文件系统列表
>
> 7.4：arch-chroot /mnt				# jin进入新系统 
>
> 7.5： pacman -S vim 	#新系统默认没有vim只有nano，需要安装vim
>
> 7.6： vim /etc/locale.gen  		##编辑这个文件选择文字编码
>
> 7.6.1：找到en_US.UTF-8和zh_CN.UTF-8 ,并去掉注释
>
> 7.7： locale-gen 			#生成新的locale
>
> 7.8：vim /etc/locale.conf 		#编辑默认语言
>
> 7.8.1：写入：LANG=en_US.UTF-8 			#使默认语言为英文，也可以加上LANG=zh_CN.UTF-8 
>
> 7.9：rm /etc/localtime  		#删除原来的系统时区
>
> 7.9.1：ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 			#设置时区为上海(北京时间)
>
> 7.9.2：hwclock --systohc --localtime  		#设置硬件时间为本地时间
>
> 7.10：echo  pc-name > /etc/hostname  		## s更改主机名字 可以自己设定名字
>
> 7.11：vim /etc/mkinitcpio.conf 		## 编辑文件吧block移动到udev之后，让usb先加载
>
> 7.11.1：翻到文件最下面，找到“HOOOKS=（base udev autodetect......）”这一行，将这一行里的的block移动到udev之后，autodetect之前的位置即可
>
> 7.12：mkinitcpio -p linux 			#	生成启动镜像--这一步需要事假多几秒，过程和之前也不一样，会有==>符号开头，
>
> 7.13： pacman -S grub  		#安装grub引导程序
>
> 7.14：grub-install --target=i386-pc /dev/sdb  				#安装BIOS引导
>
> 7.15：grub-mkconfig -o /boot/grub/grub.cfg 				#生成grub配置文件
>
> 7.16.1：cp -v /usr/share/grub/{unicode.pf2,ascii.pf2}  /boot/grub/
>
> 7.16.2：cp -v /usr/share/grub/ /boot/grub/ 				#我按照视频输入的是上面一条7.16.1，视频字幕提示是这一条7.16.2
>
> 7.17： cp -v /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
>
> 7.18 ：pacman -S efibootmgr 			#安装efibootmgr 用于配置UEFI
>
> 7.19：exit
>
> shutdown -h now 关机
>
> 7.20：如果退出需要重新挂载一遍两个盘：确认连接wifi或者网络后，执行5.1和5.3然后执行7.4
>
> 7.21：grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable  		#安装UEFi启动项
>
> 7.22：其他设置
>
> passwd root 			#s设置root用户 密码
>
> 7.23：至此已经结束，剩下的是安装联网的工具得待补充
>
> 联网包：安装如下两个包即可使用wifi-menu指令连接wifi
>
> entctl    dialog 
>
> 
>
> 









 







## 其他指令：



```
pacman -S 驱动包

驱动包有
通用       xf86-video-vesa
intel显卡 xf86-video-intel
n卡         xf86-video-nouveau
a卡         xf86-video-amdgpu
              xf86-video-ati
```

三.笔记本安装触摸板驱动

```
pacman -S xf86-input-synaptics
```

四.安装中文字体

我使用的是文泉驿微米黑，你也可以使用其他字体。

```
pacman -S wqy-microhei
```

```
pacman -S ttf-dejavu wqy-microhei  # 同样字体，没试过该指令
```





> chmod +x filename   #赋予可执行权限 

clear或者Ctrl+l清屏

另一种联网方式：联wifi网需要的工具：（初次安装不成功）

~~~txt
pacman -S iw  wpa_supplicant dialog
~~~

烧录的启动盘：按：e进行设置：编辑启动时选项：

nomodeset video=800*450		#sh设置像素和长宽比例

setfont  /use/shar/kbd/consolefonts/***	##具体的不记得了，设置字体大小

loadkeys +键盘 #设置键盘布局

**联网大概流程**

> 1： #查看网卡设备
>
> ip link	 
>
> 2： #开启网卡的设备 【示例：设备名：wlan0】
>
> ip link set 设备名 up 
>
> 3：	#使用刚刚开启的设备扫描附近的wifi
>
> iwlist 设备名 scan 	
>
> 4： #扫描 wifi，并且只展示wifi的名字
>
> iwlist 设备名 scan | grep ESSID 
>
> 5：#用wpa生成一个配置文件，文件里包含wifi的名字【wifiname】和wifi【password】最后生成的文件名任意
>
> wpa_passphrase wifiname password  > filename.cof
>
> 6：#通过wpa_supplicant -c 【文件名】 -i 【设备名】进行联网，  “&” 是后台运行的意思
>
> wpa_supplicant -c filename.cof -i wlan0 &
>
> #分配一个动态1d
>
> dhcpcd &
>
> #到此应该是可以联网了的
>
> #然后，看下系统时间
>
> timedatectl set-ntp true 
>
> #同步时间
>
> 7.9.1：ln -sf/usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
>
> hwclock --systohc
>
> #安装联网工具
>
> pacman -S wpa_supplicant dhcpcd
>
> #g关闭进程
>
> killall wap_supplicant dhcpcd 
>
> 其他联网方式：
>
> 查看ip： ip addr
>
> 在安装环境

## 图形化安装



> 1：依赖：xorg，xorg-init具体参见官方文档
>
> dwm的使用，因为其他图形化安装可以直接在网上找到一站式教程不多赘述
>
> dwm：用git进行clone下来源码，
>
> 进入到dwm目录下，
>
> 输入 make进行编译
>
> 编译并安装-输入：sudo install make clean
>
> 编译安装完成还要修改配置文件如下
>
> 配置文件在：、etc/X11/xinit/xinitrc
>
> 内容：
>
> 在最后一行：if【-d  /etc/X11/xinit/xinitrc.x】的配置栏 下面
>
> 注释掉twm，，，注释掉：xclock-gxxxx注释掉xterm -gxxxxx*2，注释掉exec xterm -gxxxx【大概注释掉三四行】
>
> 使文件最下面一行是那么
>
> ~~~txt
> if
> 	exec dwm
> 	
> ~~~
>
> 
>
> dwm配合dmenu使用，安装方式一样

**dwm相关操作**

win+ctrl+1+2【同时显示多个标签的内容】win+0显示所有标签的内容【标签相当于虚拟桌面】

一个标签下：

win+123456：切换到某个标签桌面

win+shift+123456：将当前标窗口移动到某个桌面

win+m：全屏

win+t ：退出全屏

win+shift+q关闭当前窗口

win+e、u：切换到，选中当前窗口

win+shift+e、u：提拔/挪动当前窗口

win+k/K隐藏恢复隐藏









【更改壁纸】
dwm 似乎并不支持直接加载壁纸，
可以用其他工具辅助，使用安装feh并使用

> ## 安装
>
> feh 可从[官方源](https://wiki.archlinux.org/index.php/Official_repositories_(简体中文))安装：
>
> ```
> # pacman -S feh
> ```
>
> ## 用法
>
> feh具有很高的可配置性。运行**feh --help**可以得到详细的选项列表。
>
> ### 图像浏览
>
> 要快速的浏览指定目录里的图像，你可以用以下参数启动feh：
>
> ```
> $ feh -g 640x480 -d -S filename /path/to/directory
> ```
>
> - -g 选项强制图像的显示大小不大于640x480
> - -S filename 选项按文件名排列图像
>
> 这只是一个小例子，它还有其他大量选项可供你灵活使用。
>
> #### 文件浏览器图片启动器
>
> 下面的脚本原来贴在 [这里](https://bbs.archlinux.org/viewtopic.php?pid=884635#p884635)，对于文件管理器很有用。它会先在 feh 中显示你选中的图片，但是它同时也允许你浏览该目录中的其他图片(按照默认顺序，也就是说，与你直接运行 "feh *" 的顺序相同)。
>
> 该脚本假设第一个参数是文件名。
>
> ```
> #!/bin/bash
> 
> shopt -s nullglob
> 
> if [[ ! -f $1 ]]; then
> 	echo "$0: first argument is not a file" >&2
> 	exit 1
> fi
> 
> file=$(basename -- "$1")
> dir=$(dirname -- "$1")
> arr=()
> shift
> 
> cd -- "$dir"
> 
> for i in *; do
> 	[[ -f $i ]] || continue
> 	arr+=("$i")
> 	[[ $i == $file ]] && c=$((${#arr[@]} - 1))
> done
> 
> exec feh "$@" -- "${arr[@]:c}" "${arr[@]:0:c}"
> ```
>
> 使用选中的路径调用该脚本，接着是可选的传递给 feh 的参数。这是一个你可以在文件浏览器中调用的例子：
>
> ```
>  /path/to/script %f -F -Z
> ```
>
> `-F` 和 `-Z` 是 feh 的参数。 `-F` 用全屏模式打开图片，`-Z` 自动缩放图片。添加 `-q` 标志 (quiet) 抑制终端中的当 feh 视图打开当前文件夹中的非图片文件时的错误输出。
>
> ### 桌面壁纸
>
> feh也适合缺少管理桌面壁纸特性的独立窗口管理器，例如[Openbox](https://wiki.archlinux.org/index.php/Openbox)和[Fluxbox](https://wiki.archlinux.org/index.php/Fluxbox)。以下命令是一个设置初始背景的例子：
>
> ```shell
> $ feh --bg-scale /path/to/image.file
> ```

### 终端工具

st【Simple Terminal】

dwm一样的安装方法，从Git下载编译安装



### 安装终端文件管理器

> ranger
>
> ranger插件的其他相关：
>
> 【https://github.com/ranger/ranger】
>
> ranger美化：图标【https://github.com/ryanoasis/nerd-fonts】
>
> 插件：



#### 音频管理：

> alsa-utitilts
>
> pacman -S alsa-utilits
>
> 拼写错了，回头看官方文档

> 安装alsa-utitilts
> 运行alsamixer
> 保存设置好的音量等：alsactl store
> 要点：一定要记得，音轨下面的M表示静音。通过按m取消静音。
>
> 若还没有声音参照官方文档



### Git安装

### **1、简介：**

git是一款免费、开源的分布式版本控制系统

### **2、特点：**

(1) Git是一个开源的分布式版本控制系统，可以有效，高速的处理从很小到非常大的项目版本管理

### **3、Git安装**

(1) 从github官网下载或从其它网站下载
 `wget https://codeload.github.com/git/git/archive/v2.8.0.tar.gz`
 `wget http://learning.happymmall.com/git/git-v2.8.0.tar.gz`

(2) 安装依赖
 `sudo yum -y install zlib-devel openssl-devel cpio expat-devel gettext-devel curl-devel perl-ExtUtils-CBuilder perl-ExtUtils-MakeMaker`



![img](https:////upload-images.jianshu.io/upload_images/3125377-31f452fa004cd4bd.png?imageMogr2/auto-orient/strip|imageView2/2/w/554/format/webp)

image.png

(3) 解压安装包
 `tar -zxvf git-v2.8.0.tar.gz`

(4) 为了方便使用，创建一个软链接
 `ln -s /usr/local/bin/* /usr/bin/`

(5) 编译
 `cd git-2.8.0/`
 `sudo make prefix=/usr/local all`

(6) 执行安装命令
 `sudo make prefix=/usr/local install`

### 5、**git基础配置** 

(1) 配置用户名（提交时会引用）
 `git config --global user.name “cnj666”`
 \#请把cnj替换成自己的用户名

(2) 配置邮箱（提交时会引用）
 `git config --global user.email "cnj666@qq.com"`

(3) 其他配置
 `git config --global merge.tool “kdiff3”`
 \#要是没安装KDiff3就不用设这一行

`git config --global core.autocrlf false`
 \#让Git不要管windows/Unix换行符转换的事

(4) 编码配置
 `git config --global gui.encoding utf-8`
 \#避免git gui中的中文乱码

`git config --global core.quotepath off`
 \#避免git status显示的中文文件名乱码

Windows上还需要配置：
 `git config --global core.ignorecase false`

### 2、**Git ssh key pair配置** 

1、在Linux的命令行下输入以下命令：
 `ssh-keygen -t rsa -C “cnjcode@qq.com”`

2、然后一路回车，不要输入任何密码之类，生成ssh key pair

3、`ssh-add ~/.ssh/id_rsa`

4、`cat ~/.ssh/id_rsa.pub`

执行ssh-add时出现Could not open a connection to your authentication agent

执行ssh-add ~/.ssh/id_rsa报标题上的错误先执行 eval `ssh-agent`(是~键上的那个`)

再执行`ssh-add ~/.ssh/id_rsa`成功ssh-add -l就有新加的rsa了

查看私钥：cat ssh-add ~/ .ssh/id_rsa

查看公钥：cat ~/ .ssh/id_rsa.pu

## 其他工具

### 录屏工具

pacman -S simplescreenrecorder

### 窗口管理



> i3的参考指令

> alt+t # 全屏

> win+q #退出当前窗口
>
>  
>
> pacman -S feh   # g更换桌面壁纸程序[https://wiki.archlinux.org/index.php/Feh_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#%E6%A1%8C%E9%9D%A2%E5%A3%81%E7%BA%B8](https://wiki.archlinux.org/index.php/Feh_(简体中文)#桌面壁纸)
>
> pacman -S variety #好像是壁纸库，具体的我也不知道 
>
>  

### 输入法等软件

**pacman -Rs xxx (卸载：未测试待定)**

pacman -S fcitx   fcitx-im fcitx-configtool

pacman -S fcitx-sougou

pacman -S chromium #谷歌浏览器

pacman -S kdenlive #视频剪辑软件

pacman -S gimp #修图软件

pacman -S libreoffice #office软件或者安装wps

pacman -S vlc #视频播放软件

pacman -S virtualbox #虚拟机

pacman -S deppin.com.qq  #QQ

pacman -S electronic-wechat #微信还有其他版本要百度

pacman -S transmission-xxx  #下载软件或者 -S qbittorrent

pacman -S ranger  #文件管理器（终端下的文件浏览）

















