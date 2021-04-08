<?php

/*
教室查询接口
输入数据：节次代号，星期，周次
返回数据：教室名称，所在楼，容量
*/

//1.获取输入数据
$Times=$_GET["Times"];          //上课节次，以MySQL中'Set'数据类型编号传递
$Weekdays=$_GET["Weekdays"];    //上课星期
$Weeks=$_GET["Weeks"];          //上课周次

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
$sql="SELECT RoomName,Building,Capacity
FROM Classroom
WHERE RoomName NOT IN(
SELECT RoomName
FROM Course_Arrangement
WHERE Times&$Times AND Weeks&$Weeks AND Weekdays=$Weekdays
UNION
SELECT RoomName
FROM Room_Application
WHERE Times&$Times AND Weeks&$Weeks AND Weekdays=$Weekdays AND ApplicationStatus NOT LIKE'FAIL'
)";
$res=$conn->query($sql);

//6.判断语句
if($res->num_rows==0){
    echo "NO OUTPUT";
}
else{
    //定义教室类
    class Classroom{
        public $RoomName;
        public $Building;
        public $Capacity;
    }
    //建立数据数组
    $data=array();
    //读取元组并加入数组
    while($row=$res->fetch_array()){
        $cla=new Classroom;
        $cla->RoomName=$row["RoomName"];
        $cla->Building=$row["Building"];
        $cla->Capacity=$row["Capacity"];
        //加入数组
        array_push($data,$cla);
    }
    //新建JSON格式
    $json=json_encode($data,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
    //返回JSON
    echo $json;
}

//7.关闭连接
$res->free();
$conn->close();

?>