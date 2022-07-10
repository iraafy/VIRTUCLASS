<?php 

    require '../conn.php';
    session_start();
    if( !isset($_SESSION["loginadmin"]))
    {
        header("Location: ../../../login.php");
        exit;
    }
    else{
        $query = "UPDATE siswa SET validated = 1 WHERE id_siswa = $_GET[id_siswa]";
        mysqli_query($conn, $query);
        header('location: admin.php');
    }
