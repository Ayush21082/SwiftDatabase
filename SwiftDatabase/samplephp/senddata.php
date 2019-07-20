<?php
    
    include('connection.php');
    
    ?>

<!-- DATABASE ENTRY -->
<?php
    
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $sql = "INSERT INTO MyTable values (DEFAULT,'$username','$password')";
    $myconn->query($sql);
    
    header("Location: ./index.php");
    
    ?>
