<?php

    // $conn = new mysqli("localhost","root","","db_virtuclass");
    require '../conn.php';
    session_start();
    // $_SESSION['error'] = 0;

    // $error = 0;
    $nama_user = $_POST["nama_user"];
    $asal_sekolah = $_POST["asal_sekolah"];
    $jk = $_POST["jk"];
    $email = $_POST["email"];
    $telepon = $_POST["telepon"];
    $password = $_POST["password"];
	// $password = password_hash($password, PASSWORD_DEFAULT);
    $validated = 0;
    if (isset($_POST['submit']))
    {
        $find_email = mysqli_query($conn, "SELECT email FROM user WHERE email = '$email'");
		if( mysqli_fetch_assoc($find_email) )
		{
			$error = 2;
			return false;
		}
		else 
		{
            $filename = $_FILES['file1']['name'];
            if($filename != '')
            {
                $ext = pathinfo($filename, PATHINFO_EXTENSION);
                $allowed = ['pdf', 'png', 'jpg', 'jpeg'];
                if (in_array($ext, $allowed))
                {
                    $filename = md5(time()).'-'.$filename;
                    $path = 'uploads/';
                    move_uploaded_file($_FILES['file1']['tmp_name'],($path . $filename));
                    $sql = "INSERT INTO user VALUES('', '$nama_user', '$asal_sekolah', '$jk', '$email', '$telepon', '$password', '$filename', '$validated')";
                    mysqli_query($conn, $sql);
                    $_SESSION['error'] = 1;
                }
                else
                {
                    $$_SESSION['error'] = 3;
                }
            }
            else {
                $_SESSION['error'] = 3;
            }
        }
        header("Location: ../register.php");
    }

?>