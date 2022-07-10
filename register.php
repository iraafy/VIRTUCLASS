<?php

require 'conn.php';
session_start();
if (isset($_SESSION["login"])) {
	header("Location: index.php");
	exit;
}
if (isset($_SESSION["loginadmin"])) {
	header("Location: admin/admin.php");
	exit;
}
$error = 0;
function registrasi($data)
{
	global $conn;
	$nama_siswa = $data["nama_siswa"];
	$asal_sekolah = $data["asal_sekolah"];
	$jk = $data["jk"];
	$email = $data["email"];
	$telepon = $data["telepon"];
	$passwordd = $data["password"];
	$password = password_hash($passwordd, PASSWORD_DEFAULT);
	$validated = 0;
	$find_email = mysqli_query($conn, "SELECT email FROM siswa WHERE email = '$email'");
	if (mysqli_fetch_assoc($find_email)) {
		echo "<script>
				alert('email sudah terdaftar!');
			</script>";
	} else {
		$filename = $_FILES['file1']['name'];
		if ($filename != '') {
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			$allowed = ['pdf', 'png', 'jpg', 'jpeg'];
			if (in_array($ext, $allowed)) {
				$filename = md5(time()) . '-' . $filename;
				$path = 'admin/bukti/kartu_pelajar/';
				move_uploaded_file($_FILES['file1']['tmp_name'], ($path . $filename));
				$sql = "INSERT INTO siswa VALUES('', '$nama_siswa', '$asal_sekolah', '$jk', '$email', '$telepon', '$password', '$filename', '$validated', 'null')";
				mysqli_query($conn, $sql);
				return mysqli_affected_rows($conn);
			} else {
				echo "<script>
						alert('File kartu pelajar tidak sesuai kriteria (gunakan pdf, png, jpg, atau jpeg).');
					</script>";
			}
		} else {
			echo "<script>
					alert('File kartu pelajar tidak sesuai kriteria!');
				</script>";
		}
	}
}

if (isset($_POST['submit'])) {
	if (registrasi($_POST) > 0) {
		$error = 1;
	} else {
		$error = 2;
	}
}

?>

<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">

	<script src="https://kit.fontawesome.com/9da43ad1c6.js" crossorigin="anonymous"></script>

	<title>Register</title>
</head>

<body>
	<div class="col-lg-6 offset-lg-3 offset-md-3">
		<div class="p-5">
			<div class="card-body">
				<a href="index.php" style="color: #901311;">
					<p class="title-1 text-center" style="color: #991311"><b>Virtu</b>Class</p>
				</a>
				<br>
			</div>

			<div class="card-text">
				<?php if ($error == 2) { ?>
					<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
						<ol class="breadcrumb flex">
							<li class="breadcrumb-item active" aria-current="page" style="color: white">Pendaftaran gagal, silahkan <a href="register.php" style="color: red">Daftar</a> kembali</li>
						</ol>
					</nav>
				<?php } elseif ($error == 1) { ?>
					<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
						<ol class="breadcrumb flex">
							<li class="breadcrumb-item active" aria-current="page" style="color: #262626;">Pendaftaran berhasil, silahkan <a href="login.php">Masuk</a></li>
						</ol>
					</nav>
				<?php } ?>

				<form method="post" action="" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="nama" class="form-label">Nama</label>
						<input type="text" name="nama_siswa" class="form-control" id="nama" placeholder="Masukkan Nama Lengkap" required>
					</div>

					<div class="mb-3">
						<label for="asalsekolah" class="form-label">Asal sekolah</label>
						<input type="text" name="asal_sekolah" class="form-control" id="asalsekolah" placeholder="Masukkan Asal sekolah" required>
					</div>

					<label for="jk" class="mb-2">Jenis Kelamin</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="Perempuan" name="jk" id="jk1" required>
						<label class="form-check-label" for="jk1">
							Perempuan
						</label>
					</div>
					<div class="form-check mb-3">
						<input class="form-check-input" type="radio" value="Laki-Laki" name="jk" id="jk2" required>
						<label class="form-check-label" for="jk2">
							Laki-Laki
						</label>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<input type="email" name="email" class="form-control" id="email" placeholder="Masukkan Email" required>
					</div>

					<div class="mb-3">
						<label for="telepon" class="form-label">Nomor telepon</label>
						<input type="text" name="telepon" class="form-control" id="telepon" placeholder="Masukkan Nomor Telepon" required>
					</div>

					<div class="mb-4">
						<label for="password" class="form-label">Password</label>
						<input type="password" name="password" class="form-control" id="passwordHelpBlock" placeholder="Masukkan Password" required>
						<!-- <div id="passwordHelpBlock" class="form-text"> Your password must be 8-20 characters long, contain letters and numbers.</div> -->
					</div>

					<label for="kartupelajar" class="mb-2">Kartu Pelajar</label>
					<div class="input-group">
						<input type="file" name="file1" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" required>
					</div>

					<div class="d-grid mb-1 mt-5">
						<button type="submit" name="submit" class="btn btn-block text-light" style="background-color: #901311">Daftar</button>
					</div>
				</form>

				<div class="text-center mb-3">
					<p>Sudah punya akun? <a href="login.php" style="color: #991311">Masuk</a></p>
				</div>
			</div>
		</div>
	</div>
</body>

</html>