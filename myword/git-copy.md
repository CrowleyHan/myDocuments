### 1：查看分支
	# 1.查看所有分支
	> git branch -a
	 2.查看当前使用分支(结果列表中前面标*号的表示当前使用分支)
	> git branch
	3.切换分支
	> git checkout 分支名

### 创建分支
	创建新分支 dev
 	git branch dev
	切换到该分支
	 git checkout dev[[Linux git\]Linux下git 命令 免输密码设置](https://segmentfault.com/a/1190000016079686)

[linux](https://segmentfault.com/t/linux)[git](https://segmentfault.com/t/git)

 阅读约 1 分钟

### 1. 在~/目录下， touch创建文件 .Git-credentials

```
touch .git-credentials
vim .git-credentials
```

点击 “i” 进入编辑文件模式

```
https://{username}:{password}@github.com
例如 
https://zhang3:12345@github.com
```

点击“ESC” 然后输入“:wq”退出编辑并保存

### 2. 在终端下执行

```
git config --global credential.helper store
```

### 3. 可以看到~/.gitconfig文件，会多了一项：

vi .gitconfig 进入
可以看到
[credential]

```
helper = store
```

### 3. 再次执行 git命令

只需要输入1次 正确的账号和密码 以后可以直接跳过输入账号密码了
