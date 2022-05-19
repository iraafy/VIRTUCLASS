<?php
	include '../conn.php';
	$record_siswa = mysqli_query($conn, 'SELECT * FROM record_siswa');
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
			<a class="navbar-brand" href="guru.php">
                <img src="../assets/img/virtuclass_logo.svg" width="15%" alt="virtuclass-logo">
            </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="uploadMateri.php">Materi&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="dashboard.php"><b>Dashboard Nilai</b>&emsp;</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../logout.php"><span class="iconify-inline" data-icon="carbon:logout"></span></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- <div class="container mt-5 mb-5">
		<canvas class="mt-4" id="chartUAS" style="width:100%;"></canvas>
	</div> -->
	<div class="container mt-5">
		<div class="card" style="box-shadow: 2px 2px 10px 1px rgba(0,0,0,0.30);">
			<div class="card-body" style="width: 100%;">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-grafik-tab" data-bs-toggle="tab" data-bs-target="#nav-grafik" type="button" role="tab" aria-controls="nav-grafik" aria-selected="true">Grafik</button>
						<button class="nav-link" id="nav-details-tab" data-bs-toggle="tab" data-bs-target="#nav-details" type="button" role="tab" aria-controls="nav-details" aria-selected="false">Detail</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-grafik" role="tabpanel" aria-labelledby="nav-grafik-tab">
						<div class="row">
							<label class="mt-3 mb-3 text-center" for="selectedCategoryFilter"><b>Data rata rata nilai</b></label>
							<!-- <div class="col-3">
								<div class="input-group">
									<select class="form-select" id="selectedCategoryFilter">
										<option value="1">Semua Siswa</option>
									</select>
								</div>
							</div>
							<div class="col-3">
								<div class="input-group">
									<select class="form-select" id="selectedCategoryFilter">
										<option value="1">Fisika</option>
										<option value="2">Kimia</option>
										<option value="3">Biologi</option>
									</select>
								</div>
							</div>
							<div class="col-3">
								<div class="input-group">
									<select class="form-select" id="selectedCategoryFilter">
										<option value="1">PHB</option>
										<option value="2">UTS</option>
										<option value="3">UAS</option>
									</select>
								</div>
							</div>
							<div class="col-3">
								<div class="input-group">
									<select class="form-select" id="selectedCategoryFilter">
										<option value="1">2019</option>
										<option value="2">2020</option>
										<option value="3">2021</option>
										<option value="4">2022</option>
									</select>
								</div>
							</div> -->
						</div>
						<div>
							<canvas class="mt-4" id="chart" style="width:100%;"></canvas>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-details" role="tabpanel" aria-labelledby="nav-details-tab">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<script>
		<?php  
            $nilai = array(); 
            $nilai_sql = mysqli_query($conn, "SELECT AVG(nilai) avg_nilai FROM record_siswa GROUP BY tanggal ORDER BY tanggal ASC");
            $nilai = mysqli_fetch_all($nilai_sql);

            $tanggal = array(); 
            $tanggal_sql = mysqli_query($conn, "SELECT tanggal FROM record_siswa GROUP BY tanggal ORDER BY tanggal ASC");
            $tanggal = mysqli_fetch_all($tanggal_sql);
        ?>

        var data_tanggal = [ <?= json_encode($tanggal); ?> ];  
        for (i = 0; i < data_tanggal.length; i++) {
            xValues = data_tanggal[i];
        }

        var data_nilai = [ <?= json_encode($nilai); ?> ];  
        for (j = 0; j < data_nilai.length; j++) {
            yValues = data_nilai[j];      
        }

        new Chart("chart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
            fill: false,
            lineTension: 0,
            backgroundColor: "rgba(0,0,255,1.0)",
            borderColor: "rgba(0,0,255,0.1)",
            data: yValues
            }]
        },
        options: {
            legend: {display: false},
            scales: {
            yAxes: [{ticks: {min: 0, max:100}}],
            }
        }
        });
    </script>
	<!-- iconify -->
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>