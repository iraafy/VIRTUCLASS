<?php

if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
}
$getID = $_GET['kartu_pelajar'];

?>
<img src="bukti/kartu_pelajar/<?php echo $getID; ?>" alt="kartu-pelajar" width="100%">