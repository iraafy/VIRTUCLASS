<?php
$conn = new mysqli("localhost","root","","db_virtuclass");

// Check connection
if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}
?>