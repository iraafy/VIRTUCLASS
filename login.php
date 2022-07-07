<?php
include 'conn.php';
$error = 0;

session_start();
if (isset($_SESSION["login"])) {
	header("Location: index.php");
	exit;
}
if (isset($_SESSION["loginadmin"])) {
	header("Location: admin/admin.php");
	exit;
}
if (isset($_POST["submit"])) {
	$email = $_POST["email"];
	$pass = $_POST["password"];
	setcookie('siswa', $email);
	$query_siswa_validate = mysqli_query($conn, "SELECT * FROM siswa WHERE email = '$email' AND validated = '1'");
	$query_siswa = mysqli_query($conn, "SELECT * FROM siswa WHERE email = '$email' AND validated = '0'");
	$query_admin = mysqli_query($conn, "SELECT * FROM admin WHERE email = '$email' AND password = '$pass'");
	$query_guru = mysqli_query($conn, "SELECT * FROM guru WHERE email = '$email' AND password = '$pass'");

	if (mysqli_num_rows($query_siswa_validate) === 1) {
		$row = mysqli_fetch_assoc($query_siswa_validate);
		echo $row["password"];
		if (password_verify($pass, $row["password"])) {
			$_SESSION["login"] = true;
			$siswaid = $row['id_siswa'];
			$siswaname = $row['nama_siswa'];
			$_SESSION["id"] = $siswaid;
			$_SESSION["username"] = $siswaname;
			header("Location: siswa/course/kelas.php");
			exit;
		}
	} elseif (mysqli_num_rows($query_siswa) === 1) {
		$row = mysqli_fetch_assoc($query_siswa);
		if (password_verify($pass, $row["password"])) {
			$error = 1;
		}
	} elseif (mysqli_num_rows($query_admin) === 1) {
		$_SESSION["loginadmin"] = true;
		header("Location: admin/admin.php");
		exit;
	} elseif (mysqli_num_rows($query_guru) === 1) {
		$_SESSION["loginguru"] = true;
		header("Location: admin/guru/guru.php");
		exit;
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

	<title>Login</title>
</head>

<body>
	<div class="col-lg-6 offset-lg-3 offset-md-3 mt-5">
		<div class="p-5">
			<div class="card-body">
				<a href="index.php" style="color: #901311;">
					<p class="title-1 text-center" style="color: #991311"><b>Virtu</b>Class</p>
				</a>
				<br>
			</div>
			<div class="card-text">
				<?php if ($error == 1) { ?>
					<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
						<ol class="breadcrumb flex">
							<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data belum tervalidasi, mohon menunggu</li>
						</ol>
					</nav>
				<?php } elseif ($error == 2) { ?>
					<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
						<ol class="breadcrumb flex">
							<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data salah, silahkan login kembali</li>
						</ol>
					</nav>
				<?php } ?>
				<form method="post">
					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<input type="email" name="email" class="form-control" id="email" placeholder="Masukkan Email" required>
					</div>

					<div class="mb-1">
						<label for="password" class="form-label">Password</label>
						<input type="password" name="password" class="form-control" placeholder="Masukkan Password" required>
					</div>

					<div class="d-flex justify-content-between align-items-center mb-4">
						<div class="form-check"></div>
						<a href="#!" class="text-body text-muted">Lupa password?</a>
					</div>

					<div class="d-grid mb-1">
						<button type="submit" name="submit" class="btn btn-block text-light" style="background-color: #901311">Masuk</button>
					</div>
				</form>

				<div class="text-center">
					<p>Belum punya akun? <a href="register.php" style="color: #991311">Daftar</a></p>
				</div>
			</div>
		</div>
	</div>
</body>

</html>