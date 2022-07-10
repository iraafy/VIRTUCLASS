
<?php

require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
} else {
    $querymodul = "DELETE FROM modul WHERE id_modul = $_GET[id_modul]";
    mysqli_query($conn, $querymodul);
    header('location: uploadMateri.php');
}

?>