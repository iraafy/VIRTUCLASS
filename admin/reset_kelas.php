<?php

require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../login.php");
    exit;
} else {
    mysqli_query($conn, "UPDATE siswa SET kelas = 'null'");
    header('location: admin.php');
}
