1���鿴��֧
	# 1.�鿴���з�֧
	> git branch -a
	 2.�鿴��ǰʹ�÷�֧(����б���ǰ���*�ŵı�ʾ��ǰʹ�÷�֧)
	> git branch
	3.�л���֧
	> git checkout ��֧��

������֧
	�����·�֧ dev
 	git branch dev
	�л����÷�֧
	 git checkout dev[[Linux git\]Linux��git ���� ������������](https://segmentfault.com/a/1190000016079686)

[linux](https://segmentfault.com/t/linux)[git](https://segmentfault.com/t/git)

 �Ķ�Լ 1 ����

### 1. ��~/Ŀ¼�£� touch�����ļ� .Git-credentials

```
touch .git-credentials
vim .git-credentials
```

��� ��i�� ����༭�ļ�ģʽ

```
https://{username}:{password}@github.com
���� 
https://zhang3:12345@github.com
```

�����ESC�� Ȼ�����롰:wq���˳��༭������

### 2. ���ն���ִ��

```
git config --global credential.helper store
```

### 3. ���Կ���~/.gitconfig�ļ��������һ�

vi .gitconfig ����
���Կ���
[credential]

```
helper = store
```

### 3. �ٴ�ִ�� git����

ֻ��Ҫ����1�� ��ȷ���˺ź����� �Ժ����ֱ�����������˺�������