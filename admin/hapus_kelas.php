
<?php


require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../login.php");
    exit;
} else {
    // $dt_kls = $_GET['nama_kls'];
    // mysqli_query($conn, "UPDATE siswa SET kelas = 'null' WHERE kelas = $dt_kls");
    $querykelas = "DELETE FROM kelas WHERE id_kelas = $_GET[id_kelas]";
    mysqli_query($conn, $querykelas);
    header('location: uploadMateri.php');
}

?>