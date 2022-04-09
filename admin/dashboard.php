<?php
	include 'conn.php';
	$record_siswa = mysqli_query($conn, 'SELECT * FROM record_siswa');
?>


<!doctype html>
<html lang="en">
<head>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>TEST</title>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
		<div class="container ps-4 pe-4">
			<a class="navbar-brand" href="#">
                <img src="assets/virtuclass_logo.svg" width="15%" alt="virtuclass-logo">
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
						<a class="nav-link" href="Dashboard.php"><b>Dashboard Nilai</b>&emsp;</a>
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

	<div class="container mt-5 mb-5">
		<canvas id="myChart" style="width:100%;"></canvas>
	</div>

	<!-- chart -->
	<script>
		var xValues = ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"];

		new Chart("myChart", {
		type: "bar",
		data: {
			labels: xValues,
			datasets: [{ 
			data: [70,34,64,97,80,69,96,100,47,93,13,46],
			backgroundColor: "#965954",
			fill: false
			// label: "UAS",
			}, { 
			data: [36,83,65,85,35,68,87,95,35,76,24,57],
			backgroundColor: "#94403a",
			fill: false
			// label: "UTS",
			}, { 
			data: [60,35,58,77,97,68,94,26,89,56,86,34],
			backgroundColor: "#8c2d24",
			fill: false
			// label: "PHB",
			}]
		},
		options: {
			legend: {display: false}
		}
	});
	</script>
	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>