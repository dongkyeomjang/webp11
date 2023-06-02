<?php header("Content-Type:text/html;charset=utf-8"); ?>
<?php
    $userid = $_POST['userid'];
    //$password = $_POST['password'];
    $password=hash("sha256",$_POST['password']);
    $email = $_POST['email'];
    $username = $_POST['username'];
    $sex = $_POST['sex'];
    $phonenum = $_POST['phonenum'];
    $birthyear = $_POST['birthyear'];
    $birthmonth = $_POST['birthmonth'];
    $birthday = $_POST['birthday'];
    $nickname = $_POST['nickname'];
    $introduction = $_POST['introduction'];
    $interest = $_POST['interest'];


    $host = 'localhost';
    $user = 'planit2022';
    $password = 'planitSE2022';
    $dbName = 'planit2022';

    $conn = new mysqli($host, $user, $password, $dbName);

    if ($conn -> connect_errno) {
      echo "Failed to connect to MySQL: " . $conn -> connect_error;
      exit();
    }
        
    //최종 출력할 결과
    $outputFrame = new stdClass;
    $outputFrame -> result = 0;             //오류 코드: 0 -> 정상, 나머지 오류는 임의배정
    $outputFrame -> message = "success";    //오류 메세지: 각 오류 상황에서 재설정

    $sql='CALL REGISTER(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @resultM, @resultI)'; 
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(1,$userid,PDO::PARAM_STR,4000);
    $stmt->bind_param(2,$password,PDO::PARAM_STR,4000);
    $stmt->bind_param(3,$email,PDO::PARAM_STR,4000);
    $stmt->bind_param(4,$username,PDO::PARAM_STR,4000);
    $stmt->bind_param(5,$sex,PDO::PARAM_STR,4000);
    $stmt->bind_param(6,$phonenum,PDO::PARAM_STR,4000);
    $stmt->bind_param(7,$birthyear,PDO::PARAM_STR,4000);
    $stmt->bind_param(8,$birthmonth,PDO::PARAM_STR,4000);
    $stmt->bind_param(9,$birthday,PDO::PARAM_STR,4000);
    $stmt->bind_param(10,$nickname,PDO::PARAM_STR,4000);
    $stmt->bind_param(11,$introduction,PDO::PARAM_STR,4000);
    $stmt->bind_param(12,$interest,PDO::PARAM_STR,4000);
    $stmt->execute();

    $stmt=$conn->query('SELECT @resultM, @resultI');
    $result=$stmt->fetch(PDO::FETCH_ASSOC);
    //$result=$mysqli_query($conn,$sql2)->fetch(PDO::FETCH_ASSOC);
    
    if($result){
        $outputFrame -> message = $result['@resultM']; //예외 메세지
        $outputFrame -> result = $result['@resultI']; //1:아이디중복, 2:이메일중복, 3:전화번호중복, 4:닉네임중복, 5:이메일형식오류
    
    }
    
    $stmt->close();

    
    mysqli_close($conn);
    echo json_encode($outputFrame);
?>
