<?php

/*
教师登陆接口
输入数据：教师工号、教师密码
*/

//1.获取输入数据
$Teacher_ID=$_GET["TeacherID"];
$Teacher_Password=$_GET["TeacherPassword"];

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

//5.执行查询
$sql="SELECT TeacherPassword FROM Teacher WHERE TeacherID=$Teacher_ID";
$res=$conn->query($sql);

//6.判断语句
if($res->num_rows==0){
    echo "Wrong TeacherID";     //SELECT行数为0代表数据库表中没有该学生信息
}
else{
    $row=$res->fetch_array();
    $Correct_Password=$row["TeacherPassword"];

    if($Correct_Password==$Teacher_Password){
        echo "Password Correct";    //密码正确
    }
    else{
        echo "Password Incorrect";  //密码错误
    }
}

//7.关闭连接
$res->free();
$conn->close();

?>