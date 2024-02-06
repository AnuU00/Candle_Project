<?php
session_start();
$host = 'localhost';
$dbname = 'candle_factory';
$user = 'root';
$pass = 'root';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Could not connect to the database $dbname :" . $e->getMessage());
}

if(isset($_POST['submit'])) {
    $username = $_POST['userName'];
    $password = $_POST['Passwordlog'];

    $stmt = $pdo->prepare('SELECT * FROM sys_user WHERE user_id = :userName AND password = :Passwordlog');
    $stmt->execute(['userName' => $username, 'Passwordlog' => $password]);
    $user = $stmt->fetch();

    if ($user) {
        // Login successful
        $_SESSION['user_id'] = $user['user_id'];
        if ($username == 'manager' && $password == '123') {
            header('Location: home_manager.php');
            exit;
        } elseif ($username == 'recep' && $password == '456') {
            header('Location: home_receptionist.htm');
            exit;
        } elseif ($username == 'store' && $password == '789') {
            header('Location: store_keeper.htm');
            exit;
        }
    } else {
        // Login failed
        $error = 'Invalid username or password';
    }
}

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Factory Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles_main.css">
    </head>
    <body>
    <header class="header">
        
            <img class="logo" src="./images/logo.jpeg" alt="comapny logo">
            <h4 class="topic">This website is made for the use of authorized employees in the candle factory site</h4>
            <button class="side_login_button"><a href="candle_login.php">Sign in</a></button>

    </header>
        <div class="main">
            <h1 class="tag_line">Lighting up your senses...</h1>
            <div class="main-pagelog">
                <form class="middlepagelog" action="" method="post">
                    <div class="login">Welcome!</div>
                    
                    <?php
                    if (isset($error)) {
                        echo "<p class='error'>$error</p>";
                    }
                    ?>
                    
                    
                    <div class="user">Username<br>
                    <input type="text"  name="userName" class="userName" required>    
                    </div>
        
                    <div class="Password">Password<br>
                        <input type="password" name="Passwordlog" class="Passwordlog" required>
                    </div>
                    
                    <div class="logmiddle">
                        <input type="submit" name="submit" class="loginmiddle" value="Sign in">
                    </div>
                </form>    
            </div>
        </div>
    </body>
</html>
