<?php

	include '../conn.php';
	include '../assets/php/function.php';
	$notif = 0;
	$error = 0;
	$list_guru = mysqli_query($conn, 'select * from guru;');

	if(isset($_POST["upload_guru"]))
	{
		if( upload_guru($_POST) > 0 ) 
		{
			$notif = 1;
			header("Refresh: 4; url=mgmt_guru.php");
		}
		else
		{
			$error = 1;
			header("Refresh: 4; url=mgmt_guru.php");
		}
	}

?>


<!doctype html>
<html lang="en">
<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<link rel="stylesheet" href="../assets/css/style.css">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>TEST</title>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
		<div class="container ps-4 pe-4">
			<a class="navbar-brand" href="#">
                <img src="../assets/img/virtuclass_logo.svg" width="15%" alt="virtuclass-logo">
            </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
                    <li class="nav-item">
						<a class="nav-link" href="admin.php">Siswa&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="uploadMateri.php">Materi&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mgmt_guru.php"><b>DaftarGuru</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="Dashboard.php">Dashboard Nilai&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="Logout.php">Logout&emsp;</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

    <div class="container mt-5 mb-5">
		<h3 class="text-center mt-3 mb-5" style="color: #991311">
			<b>
				Manajemen Guru VirtuClass
			</b>
		</h3>
		<?php if ($error == 1) { ?>
			<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Guru gagal ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($notif == 1) { ?>
			<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Guru berhasil ditambahkan</li>
				</ol>
			</nav>
		<?php } ?>
		<div class="card mb-5" style="box-shadow: 2px 2px 10px 1px rgba(0,0,0,0.30);">
			<div class="card-body" style="width: 100%;">
				<nav>
				<h3 class="text-center mt-3 mb-5" style="color: #991311">
					<b>
						Daftarkan Guru Baru
					</b>
				</h3>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-course" role="tabpanel" aria-labelledby="nav-course-tab">
						<form action="" method="post">
							<label class="mt-3 mb-2"><b>Nama Guru</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="nama" placeholder="Nama">
							</div>
							<label class="mt-3 mb-2"><b>Email Guru</b></label>
							<div class="input-group">
								<input type="text" name="email" class="form-control" id="inputGroupFile02" placeholder="Email">
							</div>
							<label class="mt-3 mb-2"><b>Password Guru</b></label>
							<div class="input-group">
								<input type="password" class="form-control" name="password" placeholder="Password">
							</div>
							<label class="mt-3 mb-2"><b>Verifikasi Password</b></label>
							<div class="input-group">
								<input type="password" class="form-control" name="rep_password" placeholder="Repeat Password">
							</div>
							<button type="submit" name="upload_guru" class="btn mt-4" style="float: right; background-color: #991311; color: white;" >Upload</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<div class="row">
			<table class="table">
				<thead>
					<tr style="font-weight: bold; text-align:center;">
						<td>
							NO
						</td>
						<td>
							Nama
						</td>
						<td>
							Email
						</td>
						<td>
							Password
						</td>
						<td>
							Opsi
						</td>
					</tr>
				</thead>
				<tbody style="text-align:center">
					<?php $no = 1; ?>
					<?php foreach ($list_guru as $list) { ?>
						<tr>
							<td>
								<?=$no;?>
							</td>
							<td>
								<?=$list['nama']?>
							</td>
							<td>
								<?=$list['email']?>
							</td>
							<td>
								<?=$list['password']?>
							</td>
							<td>
								<a href="detail.php?id_user=" class="btn btn-outline-success"><span class="iconify-inline" data-icon="clarity:note-edit-line" style="color: green;"></span></a>
								&nbsp;
								<a href="detail.php?id_user=" class="btn btn-danger"><span class="iconify-inline" data-icon="fluent:delete-20-regular" style="color: white;"></span></a>
							</td>
						</tr>
					<?php $no++ ?>
					<?php } ?>
				</tbody>
			</table>
		</div>
    </div>

	</script>
	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>