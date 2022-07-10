<?php

include '../conn.php';
session_start();
if (!isset($_SESSION["loginadmin"])) {
    header("Location: ../../../login.php");
    exit;
}
$siswa = mysqli_query($conn, 'SELECT * FROM siswa');

function edit($data)
{
    global $conn;
    $id = $_POST["id"];
    $nama = $_POST["nama"];
    $asal = $_POST["asal"];
    $jk = $_POST["jk"];
    $email = $_POST["email"];
    $telepon = $_POST["telepon"];
    $pass = $_POST["password"];
    $password = password_hash($pass, PASSWORD_DEFAULT);
    $kelas = $_POST["kelas"];
    $validated = $_POST["validated"];

    //add to db
    mysqli_query($conn, "UPDATE siswa SET nama_siswa='$nama', asal_sekolah='$asal', jk='$jk',email='$email', telepon='$telepon', password='$password', validated='$validated', kelas='$kelas' WHERE id_siswa = '$id'");

    return mysqli_affected_rows($conn);
}

if (isset($_POST["edit"])) {

    if (edit($_POST) > 0) {
        header("Location: update_siswa.php");
    } else {
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

        <input type="text" id="search" class="form-control mt-5" placeholder="Cari Pelajar">
        <div style="overflow-x:auto;">
            <table class="table mt-5" style="text-align: center;">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Asal Sekolah</th>
                        <th>Email</th>
                        <th>OPSI</th>
                    </tr>
                </thead>
                <tbody id="tampil">
                    <?php foreach ($siswa as $datasiswa) { ?>
                        <tr>
                            <td><?php echo $datasiswa['nama_siswa'] ?> </td>
                            <td><?php echo $datasiswa['asal_sekolah'] ?> </td>
                            <td><?php echo $datasiswa['email'] ?> </td>
                            <td>
                                <!-- Button trigger modal -->
                                <a href="detail.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal-<?php echo $datasiswa['id_siswa']; ?>">Update</a>
                                <!-- Modal -->
                                <form action="" method="post">
                                    <div class="modal fade" id="exampleModal-<?php echo $datasiswa['id_siswa']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-xl modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Update Info Siswa</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body" style="text-align: justify">

                                                    <table class="table">
                                                        <input type="text" class="form-control" name="id" value="<?php echo $datasiswa['id_siswa'] ?>" hidden>
                                                        <tr>
                                                            <td>
                                                                Nama Pelajar
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="nama" value="<?php echo $datasiswa['nama_siswa'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Asal Sekolah
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="asal" value="<?php echo $datasiswa['asal_sekolah'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Jenis Kelamin
                                                            </td>
                                                            <td>
                                                                <select class="form-select" name="jk">
                                                                    <?php $array_jk = ["Laki-Laki", "Perempuan"]; ?>
                                                                    <?php foreach ($array_jk as $value_jk) { ?>
                                                                        <?php if ($value_jk == $datasiswa['jk']) { ?>
                                                                            <option selected><?= $value_jk; ?></option>
                                                                        <?php } else { ?>
                                                                            <option value='<?= $value_jk; ?>'> <?= $value_jk; ?> </option>
                                                                        <?php } ?>
                                                                    <?php } ?>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Email
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="email" value="<?php echo $datasiswa['email'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Telepon
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="telepon" value="<?php echo $datasiswa['telepon'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Password
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="password" value="<?php echo $datasiswa['password'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Kelas
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control" name="kelas" value="<?php echo $datasiswa['kelas'] ?>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Validated
                                                            </td>
                                                            <td>
                                                                <select class="form-select" name="validated">
                                                                    <?php $array = [0, 1]; ?>
                                                                    <?php foreach ($array as $value) { ?>
                                                                        <?php if ($value == $datasiswa['validated']) { ?>
                                                                            <option selected><?= $value; ?></option>
                                                                        <?php } else { ?>
                                                                            <option value='<?= $value; ?>'> <?= $value; ?> </option>
                                                                        <?php } ?>
                                                                    <?php } ?>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="edit" class="btn btn-danger">Update</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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