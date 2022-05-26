
<?php 

require '../conn.php';
session_start();
if( !isset($_SESSION["loginadmin"]))
{
    header("Location: ../login.php");
    exit;
}
else{
    $querykelas = "DELETE FROM kelas WHERE id_kelas = $_GET[id_kelas]";
    mysqli_query($conn, $querykelas);
    header('location: uploadMateri.php');
}

?>