<?php

require 'conn.php';
$error = 0;

function registrasi($data)
{
	global $conn;
	global $error;
	$nama_user = $_POST["nama_user"];
	$asal_sekolah = $_POST["asal_sekolah"];
	$jk = $_POST["jk"];
	$email = $_POST["email"];
	$telepon = $_POST["telepon"];
	$password = $_POST["password"];
	$kartu_pelajar = $_POST["kartu_pelajar"];
	$validated = 0;

	$result = mysqli_query($conn, "SELECT email FROM user WHERE email = '$email'");
	if( mysqli_fetch_assoc($result) )
	{
		$error = 2;
		return false;
	}

	//enkripsi
	// $password = password_hash($password, PASSWORD_DEFAULT);

	//add to db
	$sql = mysqli_query($conn, "INSERT INTO user VALUES('', '$nama_user', '$asal_sekolah', '$jk', '$email', '$telepon', '$password', '$kartu_pelajar', '$validated')");
	return mysqli_affected_rows($conn);
}

if( isset($_POST["register"]) ) 
{

	if( registrasi($_POST) > 0 ) 
	{
		$error = 1;
		echo "<script>
				alert('user baru berhasil ditambahkan');
			</script>";
	}
	else
	{
		echo mysqli_error($conn);
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
							<li class="breadcrumb-item active" aria-current="page" style="color: white">Data salah, silahkan login kembali</li>
						</ol>
					</nav>
				<?php } elseif ($error == 1) { ?>
					<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
						<ol class="breadcrumb flex">
							<li class="breadcrumb-item active" aria-current="page" style="color: #262626;">Pendaftaran berhasil, silahkan <a href="login.php">Masuk</a></li>
						</ol>
					</nav>
				<?php } ?>
				
				<form method="post">
					<div class="mb-3">
						<label for="nama" class="form-label">Nama</label>
						<input type="text" name="nama_user" class="form-control" id="nama" placeholder="Masukkan Nama Lengkap">
					</div>

					<div class="mb-3">
						<label for="asalsekolah" class="form-label">Asal sekolah</label>
						<input type="text" name="asal_sekolah" class="form-control" id="asalsekolah" placeholder="Masukkan Asal sekolah">
					</div>

					<label for="jk" class="mb-2">Jenis Kelamin</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="P" name="jk" id="jk1">
						<label class="form-check-label" for="jk1">
							Perempuan
						</label>
					</div>
					<div class="form-check mb-3">
						<input class="form-check-input" type="radio" value="L" name="jk" id="jk2">
						<label class="form-check-label" for="jk2">
							Laki-Laki
						</label>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<input type="email" name="email" class="form-control" id="email" placeholder="Masukkan Email">
					</div>

					<div class="mb-3">
						<label for="telepon" class="form-label">Nomor telepon</label>
						<input type="text" name="telepon" class="form-control" id="telepon" placeholder="Masukkan Nomor Telepon">
					</div>

					<div class="mb-4">
						<label for="password" class="form-label">Password</label>
						<input type="password" name="password" class="form-control" id="passwordHelpBlock" placeholder="Masukkan Password">
						<div id="passwordHelpBlock" class="form-text"> Your password must be 8-20 characters long, contain letters and numbers.</div>
					</div>

					<label for="kartupelajar" class="mb-2">Kartu Pelajar</label>
					<div class="input-group">
						<input type="file" name="kartu_pelajar" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
					</div>

					<div class="d-grid mb-1 mt-5">
						<button type="submit" name="register" class="btn btn-block text-light" style="background-color: #901311">Daftar</button>
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