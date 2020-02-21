# MySQL的Root账户密码找回

## 1：知道root密码

直接修改  

## 2： 忘记Root密码

### 1：[mySQL官方文档](https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html)

在Windows上，使用以下过程重置MySQL `'root'@'localhost'` 帐户的密码。要更改`root`具有不同主机名部分的帐户的密码 ，请修改使用该主机名的说明。

1. 以管理员身份登录系统。

2. 如果MySQL服务器正在运行，请将其停止。对于作为Windows服务运行的服务器，请转到服务管理器：从“ **开始”**菜单中选择“ **控制面板”**，然后 选择“ **管理工具”**，再选择“ **服务”**。在列表中找到MySQL服务并停止它。

   如果您的服务器未作为服务运行，则可能需要使用任务管理器强制它停止。

3. 在一行上创建一个包含密码赋值语句的文本文件。将密码替换为您要使用的密码。

   ```sql
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
   ```

4. 保存文件。此示例假定您为该文件命名`C:\mysql-init.txt`。

5. 打开控制台窗口以进入命令提示符：从“ **开始”**菜单中选择 **“运行”**，然后输入 **cmd**作为要运行的命令。

6. 启动MySQL服务器，并将 [`init_file`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_init_file)系统变量设置为命名文件（注意选项值中的反斜杠加倍）：

   ```terminal
   C:\> cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"
   C:\> mysqld --init-file=C:\\mysql-init.txt
   ```

   如果您将MySQL安装到其他位置，请相应地调整**cd**命令。

   服务器[`init_file`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_init_file)在启动时执行系统变量命名的文件内容，更改 `'root'@'localhost'`帐户密码。

   要使服务器输出显示在控制台窗口而不是日志文件中，请将该[`--console`](https://dev.mysql.com/doc/refman/8.0/en/server-options.html#option_mysqld_console)选项添加 到 [**mysqld**](https://dev.mysql.com/doc/refman/8.0/en/mysqld.html)命令。

   如果使用MySQL安装向导安装MySQL，则可能需要指定 [`--defaults-file`](https://dev.mysql.com/doc/refman/8.0/en/option-file-options.html#option_general_defaults-file)选项。例如：

   ```terminal
   C:\> mysqld
            --defaults-file="C:\\ProgramData\\MySQL\\MySQL Server 8.0\\my.ini"
            --init-file=C:\\mysql-init.txt
   ```

   [`--defaults-file`](https://dev.mysql.com/doc/refman/8.0/en/option-file-options.html#option_general_defaults-file)可以使用服务管理器找到 相应的 设置：从“ **开始”**菜单中选择“ **控制面板”**，然后 选择“ **管理工具”**，再选择“ **服务”**。在列表中找到MySQL服务，右键单击它，然后选择该 `Properties`选项。该`Path to executable`字段包含 [`--defaults-file`](https://dev.mysql.com/doc/refman/8.0/en/option-file-options.html#option_general_defaults-file)设置。

7. 服务器成功启动后，删除 `C:\mysql-init.txt`。

您现在应该能够`root`使用新密码连接到MySQL服务器 。停止MySQL服务器并正常重启。如果将服务器作为服务运行，请从Windows服务窗口启动它。如果手动启动服务器，请使用通常使用的任何命令。

### 2：按照文档执行时候报错

执行C:\> mysqld --init-file=C:\\mysql-init.txt 语句 报错内容如下

2019-10-13T03:29:24.205939Z 1 [ERROR] [MY-011011] [Server] Failed to find valid data directory.
2019-10-13T03:29:24.207560Z 0 [ERROR] [MY-010020] [Server] Data Dictionary initialization failed.
2019-10-13T03:29:24.209780Z 0 [ERROR] [MY-010119] [Server] Aborting

此时需要先关闭服务，

手动删掉自己创建的data文件夹
2、然后再管理员cmd下进入 bin 目录，移除自己的mysqld服务

```
D:\Program Files\MySQL\bin>mysqld -remove MySQL
Service successfully removed.
```

> 由于当时我安装后服务中显示的是MySQL80所以我当时是mysqld -remove MySQL80

3、在cmd的bin目录执行 mysqld --initialize-insecure
程序会在动MySQL文件夹下创建data文件夹以及对应的文件
4、bin目录下执行，mysqld --install ，安装mysqld服务
5、重新打开新的cmd，输入mysql -uroot -p回车输入文本里编辑的密码即可登陆；

6重启MySQL服务，此时我启动的服务已经从MySQL80变成了Mysql。



[解决的原链接--CSDN](https://blog.csdn.net/mukouping82/article/details/81105831)