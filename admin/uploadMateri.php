<?php

	include '../conn.php';
	include '../assets/php/function.php';
	$notif = 0;
	$error = 0;
	$kelas = mysqli_query($conn, 'SELECT * FROM kelas');
	$kelas_course = mysqli_query($conn, 'select id_course, nama_course, nama_kelas from course a join kelas b on a.id_kelas = b.id_kelas;');
	$data_modul = mysqli_query($conn, 'select id_modul, nama_modul, nama_course, nama_kelas from course a join modul b on a.id_course = b.id_course join kelas c on a.id_kelas = c.id_kelas;');	
	$list_data = mysqli_query($conn, 'select judul_content, content, nama_modul, nama_course, nama_kelas from submodul a join modul b on a.id_modul = b.id_modul join course c on b.id_course = c.id_course join kelas d on c.id_kelas = d.id_kelas;');

	if( isset($_POST["upload_course"]) ) 
	{
		if( upload_course($_POST) > 0 ) 
		{
			$notif = 1;
			header("Refresh: 4; url=uploadMateri.php");
		}
		else
		{
			$error = 3;
			header("Refresh: 4; url=uploadMateri.php");
		}
	}
	else if( isset($_POST["upload_modul"]) ) 
	{

		if( upload_modul($_POST) > 0 ) 
		{
			$notif = 2;
			header("Refresh: 4; url=uploadMateri.php");
		}
		else
		{
			$error = 3;
			header("Refresh: 4; url=uploadMateri.php");
		}
	}
	else if( isset($_POST["upload_submodul"]) ) 
	{

		if( upload_submodul($_POST) > 0 ) 
		{
			$notif = 3;
			header("Refresh: 4; url=uploadMateri.php");
		}
		else
		{
			$error = 3;
			header("Refresh: 4; url=uploadMateri.php");
		}
	}
	else if( isset($_POST["upload_kelas"]) ) 
	{

		if( upload_kelas($_POST) > 0 ) 
		{
			$notif = 4;
			header("Refresh: 4; url=uploadMateri.php");
		}
		else
		{
			$error = 3;
			header("Refresh: 4; url=uploadMateri.php");
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
						<a class="nav-link" href="mgmt_guru.php">Guru&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="uploadMateri.php"><b>Materi</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="Dashboard.php">Dashboard Nilai&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../logout.php"><span class="iconify-inline" data-icon="carbon:logout"></span></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

    <div class="container mt-5 mb-5">
		<h3 class="text-center mt-3 mb-5" style="color: #991311">
			<b>
				Manajemen Data Modul VirtuClass
			</b>
		</h3>
		<?php if ($error == 1) { ?>
			<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course gagal ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($error == 2) { ?>
			<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course gagal ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($error == 3) { ?>
			<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course gagal ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($error == 4) { ?>
			<nav aria-label="breadcrumb" style="background-color: #ba8888; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course gagal ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($notif == 1) { ?>
			<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course berhasil ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($notif == 2) { ?>
			<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course berhasil ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($notif == 3) { ?>
			<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course berhasil ditambahkan</li>
				</ol>
			</nav>
		<?php } elseif ($notif == 4) { ?>
			<nav aria-label="breadcrumb" style="background-color: #97cc9b; border-radius: 5px !important;" class="mb-4 p-2">
				<ol class="breadcrumb flex">
					<li class="breadcrumb-item active" aria-current="page" style="color: white;">Data Course berhasil ditambahkan</li>
				</ol>
			</nav>
		<?php } ?>
		<div class="card mb-5" style="box-shadow: 2px 2px 10px 1px rgba(0,0,0,0.30);">
			<div class="card-body" style="width: 100%;">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-kelas-tab" data-bs-toggle="tab" data-bs-target="#nav-kelas" type="button" role="tab" aria-controls="nav-kelas" aria-selected="true">Upload Kelas</button>
						<button class="nav-link" id="nav-course-tab" data-bs-toggle="tab" data-bs-target="#nav-course" type="button" role="tab" aria-controls="nav-course" aria-selected="false">Upload Course</button>
						<button class="nav-link" id="nav-modul-tab" data-bs-toggle="tab" data-bs-target="#nav-modul" type="button" role="tab" aria-controls="nav-modul" aria-selected="false">Upload Modul</button>
						<button class="nav-link" id="nav-submodul-tab" data-bs-toggle="tab" data-bs-target="#nav-submodul" type="button" role="tab" aria-controls="nav-submodul" aria-selected="false">Upload Sub-Modul</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade" id="nav-course" role="tabpanel" aria-labelledby="nav-course-tab">
						<form action="" method="post">
							<label class="mt-3 mb-2"><b>Nama Course</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="nama_course" placeholder="Masukan Nama Course">
							</div>
							<label class="mt-3 mb-2"><b>Url Background</b></label>
							<div class="input-group">
								<input type="text" name="bg_course" class="form-control" id="inputGroupFile02" placeholder="Masukan URL Foto">
							</div>
							<label class="mt-3 mb-2"><b>Deskripsi Course</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="desc_course" placeholder="Masukan Deskripsi Course">
							</div>
							<label class="mt-3 mb-2" for="inputGroupSelect01"><b>Kategori Kelas</b></label>
							<div class="input-group">
								<select class="form-select" id="kategori_kelas" name="kategori_kelas">
									<option disabled selected> Pilih Kelas </option>									
									<?php foreach ($kelas as $data) { ?>
										<option value="<?=$data['id_kelas']?>"><?=$data['nama_kelas']?></option> 
									<?php } ?>
								</select>
							</div>
							<button type="submit" name="upload_course" class="btn mt-4" style="float: right; background-color: #991311; color: white;" >Upload</button>
						</form>
					</div>
					<div class="tab-pane fade" id="nav-modul" role="tabpanel" aria-labelledby="nav-modul-tab">
						<form action="" method="post">
							<label class="mt-3 mb-2"><b>Nama Modul</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="nama_modul" placeholder="Masukan Nama Modul">
							</div>
							<label class="mt-3 mb-2" for="inputGroupSelect01"><b>Kategori Pelajaran(Course)</b></label>
							<div class="input-group">
								<select class="form-select" id="kategori_course" name="kategori_course">
									<option disabled selected> Pilih Course </option>									
									<?php foreach ($kelas_course as $dataa) { ?>
										<option value="<?=$dataa['id_course']?>"><?=$dataa['nama_course']?> - <?=$dataa['nama_kelas']?></option> 
									<?php } ?>
								</select>
							</div>
							<button type="submit" name="upload_modul" class="btn mt-4" style="float: right; background-color: #991311; color: white;" >Upload</button>
						</form>
					</div>
					<div class="tab-pane fade" id="nav-submodul" role="tabpanel" aria-labelledby="nav-submodul-tab">
						<form action="" method="post">
							<label class="mt-3 mb-2"><b>Judul Sub-Modul</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="judul_content" placeholder="Masukan Judul Sub-Modul">
							</div>
							<label class="mt-3 mb-2"><b>Isi Content</b></label>
							<div class="form-floating">
								<textarea class="form-control" name="content" id="content" style="height: 150px"></textarea>
								<label for="floatingTextarea">Masukan Content</label>
							</div>
							<label class="mt-3 mb-2" for="inputGroupSelect01"><b>Kategori Modul</b></label>
							<div class="input-group">
								<select class="form-select" id="kategori_modul" name="kategori_modul">
									<option disabled selected> Pilih Modul </option>									
									<?php foreach ($data_modul as $dataaa) { ?>
										<option value="<?=$dataaa['id_modul']?>"><?=$dataaa['nama_modul']?> - <?=$dataaa['nama_course']?> - <?=$dataaa['nama_kelas']?></option> 
									<?php } ?>
								</select>
							</div>
							<button type="submit" name="upload_submodul" class="btn mt-4" style="float: right; background-color: #991311; color: white;" >Upload</button>
						</form>
					</div>
					<div class="tab-pane fade show active" id="nav-kelas" role="tabpanel" aria-labelledby="nav-kelas-tab">
						<form action="" method="post">
							<label class="mt-3 mb-2"><b>Tambah Kelas</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name="nama_kelas" placeholder="Masukan Nama Kelas">
							</div>
							<button type="submit" name="upload_kelas" class="btn mt-4" style="float: right; background-color: #991311; color: white;" >Upload</button>
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
							Course
						</td>
						<td>
							Kelas
						</td>
						<td>
							Modul
						</td>
						<td>
							Sub-Modul
						</td>
						<td class="ellipsis">
							Content
						</td>
						<td>
							Opsi
						</td>
					</tr>
				</thead>
				<tbody style="text-align:center">
					<?php $no = 1; ?>
					<?php foreach ($list_data as $list) { ?>
						<tr>
							<td>
								<?=$no;?>
							</td>
							<td>
								<?=$list['nama_course']?>
							</td>
							<td>
								<?=$list['nama_kelas']?>
							</td>
							<td>
								<?=$list['nama_modul']?>
							</td>
							<td>
								<?=$list['judul_content']?>
							</td>
							<td class="ellipsis">
								<?=$list['content']?>
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