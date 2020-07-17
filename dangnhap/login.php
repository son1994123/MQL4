<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="login.php" method="POST">
   Tên đăng nhập: <input type="text" name="username" > </br>
    Mật khẩu: <input type="pass" name="pass"></br>
    <button type="submit" name="tsm">Đăng nhập</button>
</form>



</body>
</html>
<?php 
    session_start();
   if(isset($_POST["tsm"])) {
    if

   }
?>