<?php

/*
申请上传接口
输入数据：申请人ID，教室名称，周次，星期，节次，申请原因，审批教师
返回数据：成功/失败
*/

//1.获取输入数据
$ID=$_GET["ID"];                //申请人ID
$RoomName=$_GET["RoomName"];    //教室名称
$Weeks=$_GET["Weeks"];          //周次
$Weekdays=$_GET["Weekdays"];    //星期
$Times=$_GET["Times"];          //节次
$Reason=$_GET["Reason"];        //申请原因
$TeacherID=$_GET["TeacherID"];  //审批教师

//2.设置变量
$mysql_server_name='localhost';
$mysql_username='Project';
$mysql_password='woaiqiaoyi.0827';
$mysql_database='project';

//3.建立连接
$conn=new MySQLi($mysql_server_name,$mysql_username,$mysql_password,$mysql_database,3306);
if($conn->connect_errno){
    die('Connect ERROR!!!'.$conn->connect_error);
}

//4.数据库设置
$conn->set_charset('utf8'); //设置字符集

//5.执行插入
$sql="INSERT INTO Room_Application SET
ApplicationTime=current_timestamp,
RoomName=$RoomName,
ApplicantID=$ID,
Weeks=$Weeks,
Weekdays=$Weekdays,
Times=$Times,
AppliedReason=$Reason,
AppliedTeacherID=$TeacherID
";
if($conn->query($sql)){
    echo "INSERT Success";
}
else{
    echo "INSERT ERROR:" . $sql . "<br>" . $conn->info;
}

//6.关闭连接
$res->free();
$conn->close();

?>