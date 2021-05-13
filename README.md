# ClassroomManagementSystem-ServerDataBase
北邮信通院大二下学期，《程序设计实践》作业。服务器数据库侧设计

## 服务器
- 家里搭建的服务器，运行PVE系统
    - 内核版本：Linux 5.4.73-1-pve #1 SMP PVE 5.4.73-1
    - PVE管理器：pve-manager/6.3-2/22f57405
    - CPU：16x Intel(R) Xeon(R) CPU E5-2630L v3
    - 内存：16G（8Gx2）
- 虚拟机分配：2 Core，2048M RAM，10GB 硬盘

## 系统&&平台
- 操作系统：Ubuntu 20.04.2 LTS(Py3.7.9)
- 平台：宝塔面板 免费版 7.5.1
- 软件信息
    - Apache 2.4.46
    - MySQL 5.7.33
    - PHP-5.6
    - phpMyAdmin 4.4 （其实没用上）

## 使用软件
- 数据库连接
    - Navicat Premium v15
    - SQLyog
- PHP编写
    - Visual Studio Code
    - PhpStorm
- 连接测试
    - Chrome浏览器
- MarkDown编写
    - Typora
    - Visual Studio Code

## 更新记录
- 2021.4.1
    - 创建目录和Github仓库
    - 上传测试用的select.php
    - 上传数据库设计
- 2021.4.7
    - 上传调试好的测试select3.php
- 2021.4.8
    - 删除select.php系列
    - 新建上传php接口
        - StudentLogin.php
        - TeacherLogin.php
        - RoomQuery.php
        - ApplicationUpload.php (仍在编写)
    - 上传修改的数据库设计
    - 新建Guide.md，用于说明php接口
- 2021.4.9
    - 完成ApplicationUpload.php的编写和自身调试，未与前端联合调试
    - 更新Guide.md
    - 上传修改的数据库设计
- 2021.4.11
	- 编写完成申请查询接口AppliQuery.php
	- 完成ApplicationUpload.php的编写和自身调试，未与前端联合调试
	- 更新Guide.md
- 2021.4.12
	- 编写完成教师审批接口Approval.php
	- 编写完成教师审批查询接口TeacherQuery.php
	- 编写完成申请信息修改接口Update.php
	- 修改RoomQuery.php、AppliQuery.php和TeacherQuery
	- 更新Guide.md
- 2021.5.13
    - 编写完成由申请编号查询申请信息的接口AppliNoQuery.php
    - 更新Guide.md

## 其他
- 域名是自己在腾讯云上购买的
- 使用腾讯DNSPOD解析域名
- SSL证书由腾讯云免费申请
