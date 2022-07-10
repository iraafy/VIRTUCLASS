
<?php

require '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
} else {
    $querycourse = "DELETE FROM course WHERE id_course = $_GET[id_course]";
    mysqli_query($conn, $querycourse);
    header('location: uploadMateri.php');
}

?>