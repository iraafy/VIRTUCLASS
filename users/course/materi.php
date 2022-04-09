<?php
	include 'conn.php';
	session_start();
	if( !isset($_SESSION["login"]))
	{
		header("Location: Login.php");
		exit;
	}
	$kelas = mysqli_query($conn, 'SELECT * FROM kelas'); 
	$modul = mysqli_query($conn, 'SELECT * FROM modul');                                
	$submodul = mysqli_query($conn, 'SELECT * FROM submodul');                                
?>

<!doctype html>
<html lang="en">
<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css">
	<title>Course VirtuClass</title>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
		<div class="container ps-4 pe-4">
			<a class="navbar-brand" href="#">
                <img src="assets/virtuclass_logo.svg" width="50px" alt="virtuclass-logo">
            </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
                    <li class="nav-item">
						<a class="nav-link" href="index.php">Home&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="kelas.php"><b>Course</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">FAQ&emsp;</a>
					</li>
					<li class="nav-item">
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							<span class="iconify" style="font-size: 25px; color: black" data-icon="healthicons:ui-user-profile-outline"></span>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<a class="dropdown-item" href="profil.php">
								<?php
									if(!isset($_SESSION["login"])) {
										echo "Profil";
									} else {
										echo $_COOKIE['username'];
									}
								?>
								</a>
								<?php
								if(isset($_SESSION["login"])) {
									echo 
									"
									<a class='dropdown-item' href='logout.php'>
										Keluar
									</a>
									";
								} else {
									echo 
									"
									<a class='dropdown-item' href='login.php'>
										Masuk
									</a>
									";
								}
								?>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Side-Nav -->
	<div class="wrapper mt-5">
        <!-- Sidebar Holder -->
        <div id="sidebar">
			<div class="row">
				<div class="mt-3">
					<div class="accordion p-2" id="accordionExample">
						<?php $getID = $_GET['id_course']; ?>
						<?php $i = 1; ?>
						<?php foreach ($modul as $keyModul) { ?>
							<?php if ($getID == $keyModul['id_course']) { ?>
								<div class="accordion-item">
									<h2 class="accordion-header" id="heading<?php echo $i; ?>">
										<button class="accordion-button" style="background-color: white !important;" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?php echo $i; ?>" aria-expanded="true" aria-controls="collapse<?php echo $i; ?>">
											<b style="color: black">
												<?php 
												echo $keyModul['nama_modul']; 
												$getID_Modul = $keyModul['id_modul'];
												// echo $getID_Kelas;
												?>
											</b>
										</button>
									</h2>
									<div id="collapse<?php echo $i; ?>" class="accordion-collapse collapse" aria-labelledby="heading<?php echo $i; ?>" data-bs-parent="#accordionExample">
										<div class="accordion-body" style="background-color: white !important; color: black;">
											<ul>
												<?php foreach ($submodul as $keySubModul) { ?>
													<?php if ($keySubModul['id_modul'] == $getID_Modul) { ?>
														<li>
															<a href="materi.php?id_course=<?php echo $getID?>&id_submodul=<?php echo $keySubModul['id_submodul']?>" style="color: black;"><?php echo $keySubModul['judul_content']; ?></a>
															<!-- <?php echo $keySubModul['judul_content']; ?></a> -->
														</li>
													<?php } ?>
												<?php } ?>
											</ul>
										</div>
									</div>
								</div>
							<?php } ?>
						<?php $i++; ?>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
		
		<div id="content" class="p-4">
			<button class="btn btn-outline-danger hidden-btn mt-2 mb-4 ps-2 pe-2" id="sidebarBtn" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="iconify-inline" data-icon="cil:menu"></span>
				&nbsp;Materi
			</button>
			<div class="row">
				<?php if (isset($_GET['id_submodul'])) { ?>
					<?php foreach ($submodul as $keySubModul) { ?>
						<?php if ($_GET['id_submodul'] == $keySubModul['id_submodul']) { ?>
							<div class="row pe-4 mb-5 mt-3">
								<h4>
									<?php echo $keySubModul['judul_content']; ?>
								</h4> 
								<p class="mt-2" style="text-align: justify">
									<?php echo $keySubModul['content']; ?>
								</p>
								<!-- <iframe width="100%" height="400" src="https://www.youtube.com/embed/8gS8ecKG63k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
							</div>
						<?php } ?>
					<?php } ?>
				<?php } else { ?>
					<br>
					<h5>Silahkan Pilih Materi</h5>
				<?php } ?>
			</div>
		</div>
	</div>
	


	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarBtn').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
</body>
</body>
</html>