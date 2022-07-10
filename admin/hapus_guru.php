<?php 

    require '../conn.php';
    session_start();
    if( !isset($_SESSION["loginadmin"]))
    {
        header("Location: ../../../login.php");
        exit;
    }
    else{
        $query = "DELETE FROM guru WHERE id_guru = $_GET[id_guru]";
        mysqli_query($conn, $query);
        header('location: mgmt_guru.php');
    }
