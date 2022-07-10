<?php

if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
}
$getID = $_GET['bukti'];

?>
<img src="bukti/nilai/<?php echo $getID; ?>" alt="kartu-pelajar" width="100%">