<?php
    session_start();
    if(isset($_SESSION["user"])){
        header("Location: index.php");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
    <!-- bootstrap navbar/header -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- bootstrap navbar/header -->

    <link rel="stylesheet" href="login.css">
</head>
<body>
    
<!-- Image and text -->
    <nav class="navbar navbar-light bg-light">
        <div id="logo">
            <a class="navbar-brand" href="#">
                <img src="https://www.smsupermalls.com/themes/revamp2022/assets/img/logo.svg" class="d-inline-block align-top" alt="">
            </a>
        </div>
    </nav>
    <!-- Image and text -->

    <div class="container">
        <?php

            if(isset($_POST["login"])){
                $email=$_POST["email"];
                $password=$_POST["password"];
                    require_once "database.php";
                    $sql="SELECT * FROM tbl_online_account WHERE email='$email'";
                    $result=mysqli_query($conn, $sql);
                    $user=mysqli_fetch_array($result, MYSQLI_ASSOC);
                    if ($user) {
                        if (password_verify($password, $user["password"])) {
                            $_SESSION["user"]="yes";
                            header("Location: index.php");
                            die();
                        } else {
                            echo "<div class='alert alert-danger'> Password does not match</div>";
                        }
                    } else {
                        echo "<div class='alert alert-danger'>Email does not match </div>";
                    }
                }
        ?>

        <form action="login.php" method="post">
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="Your Email" required>
            </div>

            <div class="form-group">
                <input type="password" name="password" placeholder="Password" class="form-control" required>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Login" name="login" class="btn btn-primary btn-lg">
            </div>
            
        </form>
        <div><p>Not Registered yet? <a href="registration.php">Register Here</a></div>
    </div>

</body>
</html>