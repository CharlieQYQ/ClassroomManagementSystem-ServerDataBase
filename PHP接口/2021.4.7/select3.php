<?php

/*
2021.4.7 测试成功，微信小程序端可以收到格式化的数据。后续语言设计应以此为模板。
*/

//0.获取输入数据
//$Name=$_Get["Name"];

//1.设置变量
$mysql_server_name='localhost';
$mysql_username='Project';
$mysql_password='woaiqiaoyi.0827';
$mysql_database='project';

//2.建立连接
$conn=new MySQLi($mysql_server_name,$mysql_username,$mysql_password,$mysql_database,3306);
if($conn->connect_errno){
    die('Connect ERROR!!!'.$conn->connect_error);
}

//3.数据库设置
$conn->set_charset('utf8'); //设置字符集

//4.执行查询
$sql="SELECT * FROM Student";   //SQL语句
$res=$conn->query($sql);    //SQL查询

//5.定义学生类
class Student{
    public $StudentID;
    public $StudentName;
    public $StudentPassword;
}

//6.建立数据数组
$data=array();

//7.读取记录并加入数组
while($row=$res->fetch_array()){
    $stu=new Student();
    $stu->StudentID=$row["StudentID"];
    $stu->StudentName=$row["StudentName"];
    $stu->StudentPassword=$row["StudentPassword"];
    //加入数组
    array_push($data,$stu);
}

//8.JSON格式化输出
$json=json_encode($data,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
echo $json;

//9.关闭连接
$res->free();
$conn->close();

?>