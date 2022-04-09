<?php
	include '../../conn.php';
	session_start();
	if( !isset($_SESSION["login"]))
	{
		header("Location: ../../login.php");
		exit;
	}
	$kelas = mysqli_query($conn, 'SELECT * FROM kelas'); 
	$course = mysqli_query($conn, 'SELECT * FROM course');                                
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

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
		<div class="container ps-4 pe-4">
			<a class="navbar-brand" href="../../index.php">
                <img src="../../assets/img/virtuclass_logo.svg" width="15%" alt="virtuclass-logo">
            </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
                    <li class="nav-item">
						<a class="nav-link" href="../../index.php">Home&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="kelas.php">Course&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../../index.php#about">About&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../../index.php#faq">FAQ&emsp;</a>
					</li>
					<li class="nav-item">
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							<span class="iconify" style="font-size: 25px; color: black" data-icon="healthicons:ui-user-profile-outline"></span>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<a class="dropdown-item" href="../profile.php">
								<?php
									if(!isset($_SESSION["login"])) {
										echo "Profil";
									} else {
										echo $_SESSION["id"];
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

	<div class="container mt-5 mb-5">
        <div class="row m-3">
            <h4 style="text-align: center">
                <b>
                    Course
                </b>
            </h4>
        </div>

		<div class="row mt-5">
			<div class="accordion accordion-flush" id="accordionFlushExample">
				<?php $i = 1; ?>
				<?php foreach ($kelas as $keyKelas) { ?>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-heading<?php echo $i; ?>">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<?php echo $i; ?>" aria-expanded="true" aria-controls="flush-collapse<?php echo $i; ?>">
								<b>
									Kelas <?php echo $keyKelas['nama_kelas']; ?>
									<?php 
										$getID_Kelas = $keyKelas['id_kelas'];
										// echo $getID_Kelas;
										?>
								</b>
							</button>
						</h2>
						<div id="flush-collapse<?php echo $i; ?>" class="accordion-collapse collapse" aria-labelledby="flush-heading<?php echo $i; ?>" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<div class="row mt-4 mb-4">
									<?php foreach ($course as $keyCourse) { ?>
										<?php $getID_Course = $keyCourse['id_course']; ?>
										<?php if ($keyCourse['id_kelas'] == $getID_Kelas) { ?>
											<div class="col-lg-3 col-md-4 col-sm-6 col-6 p-2">
												<div class="card" style="width: 18rem;">
													<img src="<?php echo $keyCourse['url_bg']; ?>" class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title"><?php echo $keyCourse['nama_course']; ?></h5>
														<p class="card-text"><?php echo $keyCourse['desc_course']; ?></p>
														<a href="materi.php?id_course=<?php echo $getID_Course?>" class="btn btn-primary">Lihat Materi</a>
													</div>
												</div>
											</div>	
										<?php } ?>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				<?php $i++; ?>
				<?php } ?>
			</div>
		</div>

	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>