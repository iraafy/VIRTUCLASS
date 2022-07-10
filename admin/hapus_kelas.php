<?php

require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../login.php");
    exit;
} else {
    $d = $_GET['nama_kls'];
    $query = "UPDATE siswa SET kelas = 'null' WHERE kelas = $d";
    // // $querykelas = "DELETE FROM kelas WHERE id_kelas = $_GET[id_kelas]";
    mysqli_query($conn, $query);
    // // mysqli_query($conn, $querykelas);
    header('location: uploadMateri.php');
}
