## 桥接模式（Bridged）
桥接模式就是将主机网卡与虚拟机虚拟的网卡利用虚拟网桥进行通信。在桥接的作用下，类似于把物理主机虚拟为一个交换机，所有桥接设置的虚拟机连接到这个交换机的一个接口上，物理主机也同样插在这个交换机当中，所以所有桥接下的网卡与网卡都是交换模式的，相互可以访问而不干扰。在桥接模式下，虚拟机ip地址需要与主机在同一个网段，如果需要联网，则网关与DNS需要与主机网卡一致。其网络结构如下图所示：

![](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1573697442300.png)

选择桥接模式（Bridged）。使用VMnet0。在此模式下，虚拟机和主机就好比插在同一台交换机上的两台电脑。如果主机连接在开启了DHCP服务的（无线）路由器上，这时虚拟机能够自动获得IP地址。如果局域网内没有提供DHCP服务的设备，那就需要手动配置 IP地址，只需仿照主机网卡的IP地址，设置一个同网段的不同的IP地址即可，一般只需修改IP地址的最后第四位数字不同就行了，其它的照搬。只要IP地址在同一网段内，那么局域网内的所有同网段的电脑都能互访。这样虚拟机和主机一样能够上网了。

![1573697486007](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1573697486007.png)


在桥接模式下，如果电脑主机安装有多块网卡的话，应该手动指定要桥接的那块网卡。点击VMware软件的“编辑”，选“编辑虚拟网路”，点击VMnet0，在“ 已桥接到” 的地方指定那块用来上网的网卡。如果只有一块上网的网卡，可以不用修改，默认自动连接这块网卡。

![img](https://img-blog.csdn.net/20180601164651480?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![img](https://img-blog.csdn.net/2018060117320724?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

接下来我们需要在linux中配置网卡配置文件。

我们先来看看本地连接网络的无线网卡的连接的ip地址、网关、DNS等信息。



![这里写图片描述](https://img-blog.csdn.net/20180601220636668?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

查看当前linux的网卡配置：

![这里写图片描述](https://img-blog.csdn.net/2018060117375449?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

然后，进入Linux系统编辑网卡配置文件，命令为vi /etc/sysconfig/network-scripts/ifcfg-eth0

![这里写图片描述](https://img-blog.csdn.net/20180602121821903?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)


保存退出之后，重启虚拟机网卡：/etc/init.d/network restart

或者使用service network restart

![这里写图片描述](https://img-blog.csdn.net/20180601174938414?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

虚拟网卡配置文件说明：

#BOOTPROTO=static   静态IP
#BOOTPROTO=dhcp   动态IP
BOOTPROTO=none   #无（不指定）
#通常情况下是dhcp或者static
ONBOOT="yes" #在系统启动时是否激活网卡
IPADDR="192.168.0.105" #设置虚拟机ip地址，与主机地址在同一网段
NETMASK="255.255.255.0" #设置子网掩码
GATEMAY="192.168.0.1" #设置虚拟机网关，与主机的默认网关相同
DNS1="192.168.0.1" #设置虚拟机DNS,可以设置与主机相同的DNS，或者可以设置主机的默认网关，这里我们直接设置主机的默认网关
现在查看网卡配置：

![这里写图片描述](https://img-blog.csdn.net/20180602121909625?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

现在可以试试ping一下百度：


现在再试试ping下主机：

ping不通是因为主机的防火墙，我们尝试把主机的防火墙关掉就可以ping通了：

现在我们在主机试试ping一下虚拟机：

ps: 如果在win中使用ping提示 ：ping 不是内部或外部命令。
解决方法：右键单击我的的脑->属性->高级->环境变量->在系统变量中选中名字为path或者是PATH->编辑->在变量值中添加上c:\windows\system32。

ps:如果在linux中设置网卡的时候发现，你不管设置了什么ip地址的值，结果在使用ifconfig命令查看的时候都显示一个ip地址，无法进行修改。这可能是因为你设置了BOOTPROTO=dhcp，DHCP服务器提供了为客户端自动分配IP地址的功能。所以这个时候你不管在网卡中配置了什么IP地址都是DHCP服务器自动为你的Linux配置的IP地址。所以你可以设置BOOTPROTO=static或者BOOTPROTO=none试试看。

## 网络地址转换模式（NAT）
桥接模式配置简单，但如果你的网络环境是ip资源很缺少或对ip管理比较严格的话，那桥接模式就不太适用了。如果真是这种情况的话，我们该如何解决呢？接下来，我们就来认识vmware的另一种网络模式：NAT模式。

![这里写图片描述](https://img-blog.csdn.net/20180601231828849?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)


在NAT模式中，主机网卡直接与虚拟NAT设备相连，然后虚拟NAT设备与虚拟DHCP服务器一起连接在虚拟交换机VMnet8上，这样就实现了虚拟机联网。那么我们会觉得很奇怪，为什么需要虚拟网卡VMware Network Adapter VMnet8呢？原来我们的VMware Network Adapter VMnet8虚拟网卡主要是为了实现主机与虚拟机之间的通信。在之后的设置步骤中，我们可以加以验证。

首先设置虚拟机中NAT模式的选项，打开vmware，点击“编辑”下的“虚拟网络编辑器”，设置NAT参数及DHCP参数。

![这里写图片描述](https://img-blog.csdn.net/20180601235358463?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![![这里写图片描述](https://img-blog.csdn.net/20180602000716445?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)](https://img-blog.csdn.net/20180601235452238?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

将虚拟机的网络连接模式修改成NAT模式，点击“编辑虚拟机设置”，然后点击“网络适配器”，选择“NAT模式”。

![这里写图片描述](https://img-blog.csdn.net/20180602123043968?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

然后开机启动系统，编辑网卡配置文件，命令为vi /etc/sysconfig/network-scripts/ifcfg-eth0

![这里写图片描述](https://img-blog.csdn.net/2018060212360021?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

虚拟机网卡配置文件说明：

BOOTPROTO="dhcp" #动态获取IP地址，如果此处设置为静态，则下面手动设置IP需要在DHCP地址范围内
#NAT模式也可以设置静态IP，但需要在DHCP地址范围内
#由于这里设置了dhcp分配动态IP，所以下面的可以注释掉
#IPADDR="192.168.0.105" 
#NETMASK="255.255.255.0" 
#GATEWAY="192.168.0.1"
#DNS1="192.168.0.1"
编辑完成，保存退出，然后重启虚拟机网卡，动态获取ip地址，使用ping命令ping外网ip，测试能否联网。

![这里写图片描述](https://img-blog.csdn.net/20180602124043958?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)



然后我们在使用主机去ping虚拟机:

使用虚拟机去ping主机：

我们可以发现我们现在能联网并且主机和虚拟机之间也能相互ping通。

所以VMware Network Adapter VMnet8虚拟网卡的作用是什么？，那我们现在就来测试一下。

我们把VMware Network Adapter VMnet8虚拟网卡禁用掉。


我们发现禁用掉之后依然可以ping的通外网。
我们现在试试主机和虚拟机之间能不能ping通。

我们可以发现主机是无法ping通虚拟机的。
所以这就是NAT模式，利用虚拟的NAT设备以及虚拟DHCP服务器来使虚拟机连接外网，而VMware Network Adapter VMnet8虚拟网卡是用来与虚拟机通信的。

## 主机模式（Host-Only）
Host-Only模式其实就是NAT模式去除了虚拟NAT设备，然后使用VMware Network Adapter VMnet1虚拟网卡连接VMnet1虚拟交换机来与虚拟机通信的，Host-Only模式将虚拟机与外网隔开，使得虚拟机成为一个独立的系统，只与主机相互通讯。其网络结构如下图所示：

![这里写图片描述](https://img-blog.csdn.net/20180602125923984?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)


通过上图，我们可以发现，如果要使得虚拟机能联网，我们可以将主机网卡共享给VMware Network Adapter VMnet1网卡，从而达到虚拟机联网的目的。接下来，我们就来测试一下。

首先设置“虚拟网络编辑器”，可以设置DHCP的起始范围。

![这里写图片描述](https://img-blog.csdn.net/20180602135131418?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180602135205923?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

设置虚拟机为Host-Only模式。

![这里写图片描述](https://img-blog.csdn.net/20180602135257860?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

开机启动系统，然后设置网卡文件。

![这里写图片描述](https://img-blog.csdn.net/20180602135628154?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

保存退出，然后重启网卡。

![这里写图片描述](https://img-blog.csdn.net/20180602135705530?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

虚拟机网卡配置文件说明：

BOOTPROTO="dhcp" #动态获取IP地址，如果此处设置为静态，则下面手动设置IP需要在DHCP地址范围内
#NAT模式也可以设置静态IP，但需要在DHCP地址范围内
#由于这里设置了dhcp分配动态IP，所以下面的可以注释掉
#IPADDR="192.168.0.105" 
#NETMASK="255.255.255.0" 
#GATEWAY="192.168.0.1"
#DNS1="192.168.0.1"
#此为Host-Only模式网卡配置文件，若为静态，需要设置BOOTPROTO="none"

现在我们可以看看我们的主机能不能ping通我们的虚拟机。

主机与虚拟机之间可以通信，现在设置虚拟机联通外网。

![这里写图片描述](https://img-blog.csdn.net/20180602140147526?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

然后我们现在看看VMware Network Adapter VMnet1的IP：

![这里写图片描述](https://img-blog.csdn.net/20180602141245934?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

VMware Network Adapter VMnet1的IP被强制设置为了192.168.137.1。
那么接下来，我们就要将虚拟机的DHCP的子网和起始地址进行修改，点击“虚拟网络编辑器”

![这里写图片描述](https://img-blog.csdn.net/20180602141430654?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![这里写图片描述](https://img-blog.csdn.net/20180602141436448?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

重新配置网卡，将VMware Network Adapter VMnet1虚拟网卡作为虚拟机的路由。

![这里写图片描述](https://img-blog.csdn.net/20180602141657265?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)


然后重启网卡。

![这里写图片描述](https://img-blog.csdn.net/20180602141736440?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

![img](https://img-blog.csdn.net/20180602141759786?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nja2V2aW5jeWg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

现在我们可以试试ping下外网。


然后在用主机去ping虚拟机：

现在就可以实现主机和虚拟机之间和外网的连通了。

最后感谢如下链接的参考：
https://www.linuxidc.com/Linux/2016-09/135521.htm
https://www.linuxidc.com/Linux/2016-09/135521p2.htm
https://www.linuxidc.com/Linux/2016-09/135521p3.htm

————————————————
版权声明：本文为CSDN博主「c.」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/cckevincyh/article/details/80543510



## yum语句问题

