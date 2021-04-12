# PHP接口使用指南
> 本文件为程序设计实践 服务器端PHP接口使用说明
> 乔毅 2019210472

## 服务器地址
- https://abc.charlieqyq.top:29999/xxxxx.php
- xxxxx.php 为下列某一PHP接口具体名称

## PHP接口说明
> 内容：接口功能，输入数据，返回数据

### 1.学生登陆接口
- 功能：验证学生学号和登录密码是否正确
- 接口名：StudentLogin.php
- 地址:https://abc.charlieqyq.top:29999/StudentLogin.php
- 输入数据
    - 学生学号
        - StudentID
        - 字符串类型
    - 学生密码
        - StudentPassword
        - 字符串类型
- 返回数据
    - 学号不正确
        - "Wrong StudentID"
    - 密码不正确
        - "Password Incorrect"
    - 密码正确
        - "Password Correct"

### 2.教师登陆接口
- 功能：验证教师工号和登录密码是否正确
- 接口名：TeacherLogin.php
- 地址:https://abc.charlieqyq.top:29999/TeacherLogin.php
- 输入数据
    - 教师工号
        - TeacherID
        - 字符串类型
    - 教师密码
        - TeacherPassword
        - 字符串类型
- 返回数据
    - 学号不正确
        - "Wrong TeacherID"
    - 密码不正确
        - "Password Incorrect"
    - 密码正确
        - "Password Correct"

### 3.空余教室查询接口
- 功能：查询所选节次、星期、周次可用的教室
- 接口名：RoomQuery.php
- 地址:https://abc.charlieqyq.top:29999/RoomQuery.php
- 输入数据
    - 节次代码
        - Times
        - 字符串类型（测试可用）
        - 需要按照MySQL中set类型的数据代码传递
		|节次/周次|代码|
		|:---:|:---:|
		|1|1|
		|2|2|
		|3|4|
		|4|8|
		|5|16|
		|6|32|
		|7|64|
		|8|128|
		|9|256|
		|10|512|
		|11|1024|
		|12|2048|
		|13|4096|
		|14|8192|
		|15（周次）|16384|
		|16（周次）|32768|
		- 如果需要查询'1,2'两节课，则Times='3' （3=1+2）
    - 星期
        - Weekdays
        - 字符串类型（测试可用）
    - 周次代码
    	- Weeks
    	- 字符串类型（测试可用）
    	- 其余同节次代码
- 返回数据
    - 没有查询到数据
    	- "NO OUTPUT"
    	- 可能是没有空教室或传递信息错误
    - 查询到空教室
    	- 教室名称
    		- "RoomName"
    		- 字符串类型
    	- 教室所在建筑
    		- "Building"
    		- 字符串类型
    	- 教室容量
    		- "Capacity"
    		- 字符串类型（理应为INT，但PHP返回转为字符串）

### 4.申请信息提交接口
- 功能：提交申请信息，教师提交和学生提交为同一接口
	- 如果是学生，默认状态为WAIT
	- 如果是老师，默认状态为PASS
- 接口名：ApplicationUpload.php
- 地址:https://abc.charlieqyq.top:29999/ApplicationUpload.php
- 输入数据
	- 申请人ID
		- ID
		- 字符串类型
	- 教室名称
		- RoomName
		- 字符串类型
	- 周次
		- Weeks
		- 字符串类型
	- 星期
		- Weekdays
		- 字符串类型
	- 节次
		- Times
		- 字符串类型 '1,2' 
	- 申请原因
		- Reason
		- 字符串类型
	- 审批教师
		- TeacherID
		- 字符串类型
- 返回数据
	- 成功插入
		- "INSERT Success"
	- 发生错误
		- "INSERT ERROR:". "\<br\>" . \$sql . "\<br\>" . "ERROR Num: " . \$conn->errno

### 5.申请信息查询接口
- 功能：查询申请ID对应的所有申请记录
- 接口名：AppliQuery.php
- 地址:https://abc.charlieqyq.top:29999/AppliQuery.php
- 输入数据
	- 申请人信息
		- ID
		- 字符串类型
- 返回数据
	- 没有查询结果或查询失败
		- "No Application or ERROR"
	- 查询成功
		- 申请编号
			- AppNo
			- 字符串类型
			- **唯一标识**
		- 申请时间
			- AppTime
			- 字符串类型 时间格式为："%Y-%M-%D %H:%M:%S"
		- 房间名称
			- RoomName
			- 字符串类型
		- 申请人ID
			- AppID
			- 字符串类型
		- 周次
			- Weeks
			- 字符串类型
		- 星期
			- Weekdays
			- 字符串类型
		- 节次
			- Times
			- 字符串类型 '1,2' 
		- 申请原因
			- AppReason
			- 字符串类型
		- 审批教师ID
			- AppTeacherID
			- 字符串类型
		- 申请状态
			- AppStatus
			- 字符串类型

### 6.教师申请查询接口
- 功能：查询所有审批教师为ID的所有申请记录
- 接口名：TeacherQuery.php
- 地址:https://abc.charlieqyq.top:29999/TeacherQuery.php
- 输入数据
	- 教师工号
		- TeacherID
		- 字符串类型
- 返回数据
	- 没有查询结果或查询失败
		- "No Application or ERROR"
	- 查询成功
		- 申请编号
			- AppNo
			- 字符串类型
			- **唯一标识**
		- 申请时间
			- AppTime
			- 字符串类型 时间格式为："%Y-%M-%D %H:%M:%S"
		- 房间名称
			- RoomName
			- 字符串类型
		- 申请人ID
			- AppID
			- 字符串类型
		- 周次
			- Weeks
			- 字符串类型
		- 星期
			- Weekdays
			- 字符串类型
		- 节次
			- Times
			- 字符串类型 '1,2' 
		- 申请原因
			- AppReason
			- 字符串类型
		- 审批教师ID
			- AppTeacherID
			- 字符串类型
		- 申请状态
			- AppStatus
			- 字符串类型

### 7.教师审批接口
- 功能：审批对应申请编号的申请记录（改变申请状态）
- 接口名：Approval.php
- 地址:https://abc.charlieqyq.top:29999/Approval.php
- 输入数据
	- 申请编号（可用申请信息查询接口获取）
		- No
		- 字符串类型
	- 审批结果
		- Status
		- 字符串类型
		- "PASS" / "FAIL"
- 返回数据
	- 更新失败
		- "UPDATE ERROR:". "\<br\>" . \$sql . "\<br\>" . "ERROR Num: " . \$conn->errno;
	- 更新成功
		- "UPDATE Success" . "\<br\>"
		- 申请编号
			- AppNo
			- 字符串类型
		- 申请时间
			- AppTime
			- 字符串类型 时间格式为："%Y-%M-%D %H:%M:%S"
		- 房间名称
			- RoomName
			- 字符串类型
		- 申请人ID
			- AppID
			- 字符串类型
		- 周次
			- Weeks
			- 字符串类型
		- 星期
			- Weekdays
			- 字符串类型
		- 节次
			- Times
			- 字符串类型 '1,2' 
		- 申请原因
			- AppReason
			- 字符串类型
		- 审批教师ID
			- AppTeacherID
			- 字符串类型
		- 申请状态
			- AppStatus
			- 字符串类型

### 8.申请修改接口
- 功能：修改对应申请编号的申请记录
- 接口名：Update.php
- 地址:https://abc.charlieqyq.top:29999/Update.php
- 输入数据
	- 申请编号（可用申请信息查询接口获取）
		- No
		- 字符串类型
	- 房间名称
		- RoomName
		- 字符串类型
	- 周次
		- Weeks
		- 字符串类型
	- 星期
		- Weekdays
		- 字符串类型
	- 节次
		- Times
		- 字符串类型 '1,2' 
	- 申请原因
		- Reason
		- 字符串类型
	- 审批教师ID
		- TeacherID
		- 字符串类型
	- 申请状态
		- Status
		- 字符串类型
		- 只能为'WAIT'或'CANCEL'
- 返回数据
	- 申请状态不正确
		- "ERROR! Status Should be 'WAIT' or 'CANCEL'!"
	- 更新失败
		- "UPDATE ERROR:". "\<br\>" . \$sql . "\<br\>" . "ERROR Num: " . \$conn->errno;
	- 更新成功
		- "UPDATE Success" . "\<br\>"
		- 申请编号
			- AppNo
			- 字符串类型
		- 申请时间
			- AppTime
			- 字符串类型 时间格式为："%Y-%M-%D %H:%M:%S"
		- 房间名称
			- RoomName
			- 字符串类型
		- 申请人ID
			- AppID
			- 字符串类型
		- 周次
			- Weeks
			- 字符串类型
		- 星期
			- Weekdays
			- 字符串类型
		- 节次
			- Times
			- 字符串类型 '1,2'
		- 申请原因
			- AppReason
			- 字符串类型
		- 审批教师ID
			- AppTeacherID
			- 字符串类型
		- 申请状态
			- AppStatus
			- 字符串类型