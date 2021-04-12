<?php

/*
申请查询
输入数据：申请人ID
返回数据：申请编号、申请时间、申请人ID、房间名、周次、星期、节次、申请原因、审批教师ID、申请状态
*/

//1.获取输入数据
$ID=$_GET["ID"];     //申请ID

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
$sql="SELECT * FROM Room_Application WHERE ApplicantID=$ID";
$res=$conn->query($sql);

if($res->num_rows==0){
    echo "No Applicaton or ERROR";
}
else{
    //定义申请类
    class Application{
        public $AppNo;
        public $AppTime;
        public $RoomName;
        public $AppID;
        public $Weeks;
        public $Weekdays;
        public $Times;
        public $AppReason;
        public $AppTeacherID;
        public $AppStatus;
    }
    //建立数据数组
    $data=array();
    //读取元组并加入数组
    while($row=$res->fetch_array()){
        $app=new Application;
        $app->AppNo=$row["No"];
        $app->AppTime=$row["ApplicationTime"];
        $app->RoomName=$row["RoomName"];
        $app->AppID=$row["ApplicantID"];
        $app->Weeks=$row["Weeks"];
        $app->Weekdays=$row["Weekdays"];
        $app->Times=$row["Times"];
        $app->AppReason=$row["AppliedReason"];
        $app->AppTeacherID=$row["AppliedTeacherID"];
        $app->AppStatus=$row["ApplicationStatus"];
        //加入数组
        array_push($data,$app);
    }
    //新建JSON格式
    $json=json_encode($data,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
    //返回JSON
    echo $json;
}

//6.关闭连接
if($res->num_rows!=0){
    $res->free();
}
$conn->close();

?>