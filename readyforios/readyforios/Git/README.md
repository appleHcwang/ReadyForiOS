#  git 异常操作

git commit的时候可能commit了不想上传的文件，这个时候可以回退到某次commit。

1. 首先git log查看commit历史：

commit b217e94539a8143d0c1ca323d1d28b7299abb61e
Merge: c2b3f7c 8bc8990
Author: yuanjiang <932625974@qq.com>
Date:   Mon May 23 14:42:31 2016 +0800

    continue

commit c2b3f7c0c481d5f38e4f547499a0b66a0b39ec8e
Author: yuanjiang <932625974@qq.com>
Date:   Mon May 23 14:39:44 2016 +0800

    continue

找到要撤回到的那次commit id，然后执行如下命令：


git reset --mixed：此为默认方式，不带任何参数的git reset，即时这种方式，它回退到某个版本，只保留源码，回退commit和index信息
git reset --soft：回退到某个版本，只回退了commit的信息，不会恢复到index file一级。如果还要提交，直接commit即可
git reset --hard：彻底回退到某个版本，本地的源码也会变为上一个版本的内容
 
 
 一般使用git reset --soft 命令，git reset --hard要慎用，因为这会将本地代码也退回到历史的commit id；如果要把远程Git的commit记录也一并删除（比如错误地提交了账号、密码、服务器等信息），可以执行以下命令删除：

当git reset --hard错误地将本地代码退回到历史commit后，也可以使用如下方法恢复。

首先执行git reflog（reflog会记录所有HEAD的历史，也就是说当你做 reset，checkout等操作的时候，都会被记录在reflog中）：
