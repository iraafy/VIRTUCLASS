<?php

include '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
	header("Location: ../../../login.php");
	exit;
}
$siswa = mysqli_query($conn, 'SELECT * FROM siswa');

if (isset($_POST["reset-kelas"])) {
	$kls_lama = $_POST['kls_lama'];
	mysqli_query($conn, "UPDATE siswa SET kelas = 'null' WHERE kelas = '$kls_lama'");
	header("Location: admin.php");
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
	<title>VirtuClass</title>
	<link rel="stylesheet" href="../assets/css/style.css">

</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
		<div class="container ps-4 pe-4">
			<a class="navbar-brand" href="admin.php">
				<img src="../assets/img/virtuclass_logo.svg" width="15%" alt="virtuclass-logo">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="admin.php"><b>Siswa</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mgmt_guru.php">Guru&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="uploadMateri.php">Materi&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="dashboard.php">Dashboard Nilai&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../logout.php"><span class="iconify-inline" data-icon="carbon:logout"></span></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<br><br>
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<div class="container p-5 ps-3">
					<h1>
						<b> Dashboard Admin </b>
					</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<a href="update_siswa.php" class="btn btn-danger mt-3" style="width: 100%;"><small>Update Data Siswa</small></a>
			</div>
			<div class="col-4">
				<button type="submit" class="btn btn-danger mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal00" style="width: 100%;"><small>Update Data Kelas</small></button>
				<div class="modal fade" id="exampleModal00" tabindex="-1" aria-labelledby="exampleModal00Label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="" method="post">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModal00Label"><b>Update Data Kelas Siswa</b></h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body pt-3 pb-3">
									<label> <b>Nama Lama</b> </label>
									<input type="text" name="kls_lama" class="form-control" placeholder="Masukan Nama Kelas Lama" required>
									<br>
									<!-- <label> <b>Nama Baru</b> </label>
									<select class="form-select" aria-label="Default select example" nama='kls_baru' onchange="showDiv(this)" required>
										<option value="null">null</option>
										<option value="custom">custom</option>
									</select>
									<div id="form-custom" style="display:none;">
										<div class="mb-3">
											<input type="text" name="custom-value" class="form-control" placeholder="Masukan Nama Kelas Baru">
										</div>
									</div> -->
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-danger" name="reset-kelas">Update</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-4">
				<button type="submit" class="btn btn-danger mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal0" style="width: 100%;"><small>Reset Semua Data Kelas</small></button>
				<div class="modal fade" id="exampleModal0" tabindex="-1" aria-labelledby="exampleModal0Label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModal0Label"><b>Reset Kelas</b></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body pb-5">
								<p>Apakah anda yakin ingin me-reset semua data kelas setiap siswa menjadi "null"?</p>
							</div>
							<div class="modal-footer">
								<a href="reset_kelas.php" class="btn btn-danger">Reset</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<input type="text" id="search" class="form-control mt-5" placeholder="Cari Pelajar">
		<div style="overflow-x:auto;">
			<table class="table mt-5" style="text-align: center;">
				<thead>
					<tr>
						<th>Nama</th>
						<th>Asal Sekolah</th>
						<th>Email</th>
						<th>Telepon</th>
						<th>OPSI</th>
					</tr>
				</thead>
				<tbody id="tampil">
					<?php foreach ($siswa as $datasiswa) { ?>
						<tr>
							<td><?php echo $datasiswa['nama_siswa'] ?> </td>
							<td><?php echo $datasiswa['asal_sekolah'] ?> </td>
							<td><?php echo $datasiswa['email'] ?> </td>
							<td><?php echo $datasiswa['telepon'] ?> </td>
							<td>
								<!-- Button trigger modal -->
								<a href="detail.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal-<?php echo $datasiswa['id_siswa']; ?>">Detail</a>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal-<?php echo $datasiswa['id_siswa']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Detail Info</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body" style="text-align: justify">
												<table class="table">
													<tr>
														<td>
															Nama Pelajar
														</td>
														<td>
															: <?php echo $datasiswa['nama_siswa'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Asal Sekolah
														</td>
														<td>
															: <?php echo $datasiswa['asal_sekolah'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Jenis Kelamin
														</td>
														<td>
															: <?php echo $datasiswa['jk'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Email
														</td>
														<td>
															: <?php echo $datasiswa['email'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Telepon
														</td>
														<td>
															: <?php echo $datasiswa['telepon'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Kartu Pelajar
														</td>
														<td>
															<a href="detail_kartu.php?kartu_pelajar=<?php echo $datasiswa['kartu_pelajar'] ?>" class="link-preview" target="_blank" rel="nofollow">
																<?php echo $datasiswa['kartu_pelajar'] ?>
															</a>
														</td>
													</tr>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary">Update</button>
											</div>
										</div>
									</div>
								</div>
								<?php if ($datasiswa['validated'] == "1") { ?>
									<a href="acc.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn disabled" style="background-color: lightgrey; color: black;">Tervalidasi</a>
								<?php } else { ?>
									<a href="acc.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn btn-danger">Validasi</a>
								<?php } ?>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
	<br><br><br>

	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../assets/jquery/jquery.min.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#search').on('keyup', function() {
				$.ajax({
					type: 'POST',
					url: 'search.php',
					data: {
						search: $(this).val()
					},
					cache: false,
					success: function(data) {
						$('#tampil').html(data);
					}
				});
			});
		});
	</script>

	<script type="text/javascript">
		function showDiv(select) {
			if (select.value == "null") {
				document.getElementById('form-custom').style.display = "none";
			} else {
				document.getElementById('form-custom').style.display = "block";
			}
		}
	</script>
</body>

</html>