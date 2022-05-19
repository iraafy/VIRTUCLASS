<?php

    include '../conn.php';
    session_start();
    if (!isset($_SESSION["login"])) {
        header("Location: ../login.php");
        exit;
    }
    $user = mysqli_query($conn, 'SELECT * FROM user');
    $kelas = mysqli_query($conn, 'SELECT * FROM kelas');
    $record_siswa = mysqli_query($conn, 'SELECT * FROM record_siswa');

    function edit($data)
    {
        global $conn;
        $nama = $_POST["uname"];
        $asal = $_POST["asal"];
        $email = $_POST["email"];
        $telepon = $_POST["telepon"];
        
        //add to db
        mysqli_query($conn, "UPDATE user SET nama_user='$nama', asal_sekolah='$asal', email='$email', telepon='$telepon' WHERE id_user = '$_SESSION[id]'");

        return mysqli_affected_rows($conn);

    }

    if( isset($_POST["edit"]) ) 
    {

        if( edit($_POST) > 0 ) 
        {
            header("Location: profile.php");
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
    <link rel="stylesheet" href="assets/css/style.css">
    <title>VirtuClass</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top mb-5" style="box-shadow: 0px 0px 10px -2px rgba(0,0,0,0.35);">
        <div class="container ps-4 pe-4">
            <a class="navbar-brand" href="../index.php">
                <img src="../assets/img/virtuclass_logo.svg" width="50px" alt="virtuclass-logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../index.php">Home&emsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="course/kelas.php">Course&emsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../index.php#about">About&emsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../index.php#faq">FAQ&emsp;</a>
                    </li>
                    <li class="nav-item p-0">
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="iconify" style="font-size: 25px; color: black" data-icon="healthicons:ui-user-profile-outline"></span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <a class="dropdown-item" href="profil.php">
                                    <?php
                                    if (!isset($_SESSION["login"])) {
                                        echo "Profil";
                                    } else {
                                        echo $_SESSION["username"];
                                    }
                                    ?>
                                </a>
                                <?php
                                if (isset($_SESSION["login"])) {
                                    echo
                                    "
									<a class='dropdown-item' href='../logout.php'>
                                        <span class='iconify-inline' data-icon='carbon:logout'></span>
									</a>
									";
                                } else {
                                    echo
                                    "
									<a class='dropdown-item' href='../login.php'>
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

    <div class="container mt-5 pt-5">
        <div class="card" style="background-color: #991311; border-radius: 15px; color: white;">
            <div class="card-body p-5">
                <h1>
                    <b>
                        <?php foreach ($user as $key) { ?>
                            <?php if ($key['id_user'] == $_SESSION["id"]) { ?>
                                <?php echo $key['nama_user']; ?>
                            <?php } ?>
                        <?php } ?>
                    </b>
                </h1>
                <h5>
                    <?php foreach ($user as $key) { ?>
                        <?php if ($key['id_user'] == $_SESSION["id"]) { ?>
                            <?php echo $key['asal_sekolah']; ?>
                        <?php } ?>
                    <?php } ?>
                </h5>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-lg-4 col-md-4 col-sm-12 col-12 border-right p-3">
                <div class="card" style="box-shadow: 2px 2px 10px 1px rgba(0,0,0,0.30);">
                    <div class="card-body pb-5">
                        <button type="button" style="float: right; background-color: #991311; color: white;" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <span class="iconify-inline" data-icon="ep:edit"></span>
                        </button>
                        <?php foreach ($user as $dataUser) { ?>
                            <?php if ($dataUser['id_user'] == $_SESSION['id']) { ?>
                                <?php foreach ($kelas as $dataKelas) { ?>
                                    <?php if ($dataUser['kelas'] == $dataKelas['nama_kelas']) { ?>
                                        <?php $getKelasID = $dataKelas['id_kelas']; ?>
                                    <?php } ?>
                                <?php } ?>
                                <form action="" method="post">
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Edit Data</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                    <div class="modal-body" style="text-align: justify">
                                                        <table class="table">
                                                            <tr>
                                                                <td>
                                                                Nama Siswa
                                                            </td>
                                                            <td>
                                                                : &nbsp; <input type="text" style="border: none;" name="uname" value="<?php echo $dataUser['nama_user'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Asal Sekolah
                                                            </td>
                                                            <td>
                                                                : &nbsp; <input type="text" style="border: none;" name="asal" value="<?php echo $dataUser['asal_sekolah'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Email
                                                            </td>
                                                            <td>
                                                                : &nbsp; <input type="text" style="border: none;" name="email" value="<?php echo $dataUser['email'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Telepon
                                                            </td>
                                                            <td>
                                                                : &nbsp; <input type="text" style="border: none;" name="telepon" value="<?php echo $dataUser['telepon'] ?>">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" name="edit" class="btn btn-danger">Update Data</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            <?php } ?>
                        <?php } ?>
                        <br>
                        <img class="rounded-circle mx-auto d-block mt-5 mb-4" style="border: 4px solid #5e5e5e;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Breezeicons-actions-22-im-user.svg/512px-Breezeicons-actions-22-im-user.svg.png" width="90">
                        <div class="text-center mt-5 mb-5">
                            <?php foreach ($user as $key) { ?>
                                <?php if ($key['id_user'] == $_SESSION["id"]) { ?>
                                    <h6 class="font-weight-bold"><?php echo $key['email']; ?> </h6>
                                    <h6 class="text-black-50"><?php echo $key['telepon']; ?> </h6>
                                    <h6 class="text-black-50"><?php echo $key['jk']; ?> </h6>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-12 border-right p-3">
                <div class="card" style="box-shadow: 2px 2px 10px 1px rgba(0,0,0,0.30);">
                    <div class="card-body" style="width: 100%;">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-phb-tab" data-bs-toggle="tab" data-bs-target="#nav-phb" type="button" role="tab" aria-controls="nav-phb" aria-selected="true">PHB</button>
                                <button class="nav-link" id="nav-uts-tab" data-bs-toggle="tab" data-bs-target="#nav-uts" type="button" role="tab" aria-controls="nav-uts" aria-selected="false">UTS</button>
                                <button class="nav-link" id="nav-uas-tab" data-bs-toggle="tab" data-bs-target="#nav-uas" type="button" role="tab" aria-controls="nav-uas" aria-selected="false">UAS</button>
                                <button class="nav-link" id="nav-upload-tab" data-bs-toggle="tab" data-bs-target="#nav-upload" type="button" role="tab" aria-controls="nav-upload" aria-selected="false">Upload Nilai</button>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-phb" role="tabpanel" aria-labelledby="nav-phb-tab">
                                <label class="mt-3 mb-2" for="selectedCategoryFilter"><b>Course</b></label>
                                <form action="" method="post">
                                    <div class="input-group">
                                        <select name="coursePHB" class="form-select" id="coursePHB">
                                            <?php 
                                                $sql = mysqli_query($conn,"SELECT id_course, nama_course FROM course WHERE id_kelas = $getKelasID");
                                                while ($row = mysqli_fetch_array($sql)) { ?>
                                                <option value="<?= $row['id_course'];?>"> <?= $row['nama_course'];?> </option>;
                                            <?php } ?>
                                        </select>
                                    </div>
                                </form>
                                
                                <canvas class="mt-4" id="chartPHB" style="width:100%; max-width:600px"></canvas>
                            </div>
                            <div class="tab-pane fade" id="nav-uts" role="tabpanel" aria-labelledby="nav-uts-tab">
                                <label class="mt-3 mb-2" for="selectedCategoryFilter"><b>Mata Pelajaran</b></label>
                                <div class="input-group">
                                    <select name="courseUTS" class="form-select" id="courseUTS">
                                        <?php 
                                            $sql = mysqli_query($conn,"SELECT id_course, nama_course FROM course WHERE id_kelas = $getKelasID");
                                            while ($row = mysqli_fetch_array($sql)) { ?>
                                            <option value="<?= $row['id_course'];?>"> <?= $row['nama_course'];?> </option>;
                                        <?php } ?>
                                    </select>
                                </div>
                                <canvas class="mt-4" id="chartUTS" style="width:100%;max-width:600px"></canvas>
                            </div>
                            <div class="tab-pane fade" id="nav-uas" role="tabpanel" aria-labelledby="nav-uas-tab">
                                <label class="mt-3 mb-2" for="selectedCategoryFilter"><b>Mata Pelajaran</b></label>
                                <div class="input-group">
                                    <select name="courseUAS" class="form-select" id="courseUAS" onchange="findmyvalue()">
                                        <?php 
                                            $sql = mysqli_query($conn,"SELECT id_course, nama_course FROM course WHERE id_kelas = $getKelasID");
                                            while ($row = mysqli_fetch_array($sql)) { ?>
                                            <option value="<?= $row['id_course'];?>"> <?= $row['nama_course'];?> </option>;
                                        <?php } ?>
                                    </select>
                                </div>
                                <canvas class="mt-4" id="chartUAS" style="width:100%; max-width:600px"></canvas>
                            </div>
                            <div class="tab-pane fade" id="nav-upload" role="tabpanel" aria-labelledby="nav-upload-tab">
                                <form action="" method="post">
                                    <label class="mt-3 mb-2" for="inputGroupSelect01"><b>Kategori Nilai</b></label>
                                    <div class="input-group">
                                        <select class="form-select" id="inputGroupSelect01">
                                            <option value="PHB">PHB</option>
                                            <option value="UTS">UTS</option>
                                            <option value="UAS">UAS</option>
                                        </select>
                                    </div>
                                    <label class="mt-3 mb-2" for="inputGroupSelect01"><b>Course</b></label>
                                    <div class="input-group">
                                        <select name="courseDataNilai" class="form-select" id="courseDataNilai">
                                            <?php 
                                                $sql = mysqli_query($conn,"SELECT id_course, nama_course FROM course WHERE id_kelas = $getKelasID");
                                                while ($row = mysqli_fetch_array($sql)) { ?>
                                                <option value="<?= $row['id_course'];?>"> <?= $row['nama_course'];?> </option>;
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label class="mt-3 mb-2"><b>Nilai</b></label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="nilai" placeholder="Masukan nilai">
                                    </div>
                                    <label class="mt-3 mb-2"><b>Bukti</b></label>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="inputGroupFile02">
                                    </div>
                                    <button type="submit" class="btn mt-4" style="float: right; background-color: #991311; color: white;">Upload</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br>

    <!-- iconify -->
    <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function findmyvalue()
        {
            myval = document.getElementById("courseUAS").value;
        }
    </script>
    <script>
        var myModal = document.getElementById('myModal')
        var myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', function() {
            myInput.focus()
        })
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script>
        <?php  
            $nilai = array(); 
            $nilai_sql = mysqli_query($conn, "SELECT nilai FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='PHB' AND id_course = '<script>document.write(myval);</script>'");
            $nilai = mysqli_fetch_all($nilai_sql);

            $tanggal = array(); 
            $tanggal_sql = mysqli_query($conn, "SELECT tanggal FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='PHB' AND id_course = '<script>document.write(myval);</script>'");
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

        new Chart("chartPHB", {
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
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100
                        }
                    }],
                }
            }
        });
    </script>
    <script>
        <?php  
            $nilai = array(); 
            $nilai_sql = mysqli_query($conn, "SELECT nilai FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='UTS'");
            $nilai = mysqli_fetch_all($nilai_sql);

            $tanggal = array(); 
            $tanggal_sql = mysqli_query($conn, "SELECT tanggal FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='UTS'");
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

        new Chart("chartUTS", {
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
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100
                        }
                    }],
                }
            }
        });
    </script>
    <script>
        <?php  
            $nilai = array(); 
            $nilai_sql = mysqli_query($conn, "SELECT nilai FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='UAS'");
            $nilai = mysqli_fetch_all($nilai_sql);

            $tanggal = array(); 
            $tanggal_sql = mysqli_query($conn, "SELECT tanggal FROM record_siswa WHERE id_user = $_SESSION[id] AND kategori_nilai ='UAS'");
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

        new Chart("chartUAS", {
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
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100
                        }
                    }],
                }
            }
        });
    </script>
</body>

</html>