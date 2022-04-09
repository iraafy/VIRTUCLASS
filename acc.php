<?php 

    require 'conn.php';
    // session_start();
    // if( !isset($_SESSION["login"]))
    // {
    //     header("Location: login.php");
    //     exit;
    // }
    // else{
        $query = "UPDATE user SET validated = 1 WHERE id_user = $_GET[id_user]";
        mysqli_query($conn, $query);
        header('location: admin.php');
    // }

?>