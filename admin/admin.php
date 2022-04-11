<?php

	session_start();
	if( !isset($_SESSION["loginadmin"]))
    {
        header("Location: ../login.php");
        exit;
    }
    include '../conn.php';
	$user = mysqli_query($conn, 'SELECT * FROM user'); 
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
						<a class="nav-link" href="admin.php"><b>Siswa</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="uploadMateri.php">Materi&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="dashboard.php">Dashboard Nilai&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../logout.php">Logout&emsp;</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

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

		<input type="text" id="search" class="form-control mt-5" placeholder="Cari Pelajar">
		<div style="overflow-x:auto;">
			<table class="table mt-5" style="text-align: center;">
				<thead>
					<tr>
						<th>Nama</th>
						<th>Asal Sekolah</th>
						<th>Email</th>
						<th>Telepon</th>
						<th>Detail</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody id="tampil">
					<?php foreach ($user as $dataUser) { ?>
						<tr>
							<td><?php echo $dataUser['nama_user'] ?> </td>
							<td><?php echo $dataUser['asal_sekolah'] ?> </td>
							<td><?php echo $dataUser['email'] ?> </td>
							<td><?php echo $dataUser['telepon'] ?> </td>
							<td>
								<!-- Button trigger modal -->
								<a href="detail.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal-<?php echo $dataUser['id_user']; ?>">Detail</a>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal-<?php echo $dataUser['id_user']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
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
															: <?php echo $dataUser['nama_user'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Asal Sekolah
														</td>
														<td>
															: <?php echo $dataUser['asal_sekolah'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Jenis Kelamin
														</td>
														<td>
															: <?php echo $dataUser['jk'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Email
														</td>
														<td>
															: <?php echo $dataUser['email'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Telepon
														</td>
														<td>
															: <?php echo $dataUser['telepon'] ?>
														</td>
													</tr>
													<tr>
														<td>
															Kartu Pelajar
														</td>
														<td>
															<a href="detail_kartu.php?kartu_pelajar=<?php echo $dataUser['kartu_pelajar'] ?>" class="link-preview" target="_blank" rel="nofollow">
																<?php echo $dataUser['kartu_pelajar'] ?>
															</a>
														</td>
													</tr>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
												<?php if ($dataUser['validated'] == "1") { ?>
													<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn disabled" style="background-color: lightgrey; color: black;">Tervalidasi</a>
												<?php } else { ?>
													<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn btn-danger">Validasi</a>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td>
								<?php if ($dataUser['validated'] == "1") { ?>
									<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn disabled" style="background-color: lightgrey; color: black;">Tervalidasi</a>
								<?php } else { ?>
									<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn btn-danger">Validasi</a>
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
</body>
</html>