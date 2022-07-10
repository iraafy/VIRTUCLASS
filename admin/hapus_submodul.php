
<?php

require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
} else {
    $querysubmodul = "DELETE FROM submodul WHERE id_submodul = $_GET[id_submodul]";
    mysqli_query($conn, $querysubmodul);
    header('location: uploadMateri.php');
}

?>