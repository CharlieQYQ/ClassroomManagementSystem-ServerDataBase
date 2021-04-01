<?php
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
echo'<pre>';

//5.结果输出
//object
//while($row=$res->fetch_object()){
//    var_dump($row);
//}

//array
while($row=$res->fetch_array()){
    var_dump($row);
}

//6.关闭连接
$res->free();
$conn->close();

?>