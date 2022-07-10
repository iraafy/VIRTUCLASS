<?php
if (!isset($_SESSION["loginadmin"])) {
	header("Location: ../../../login.php");
	exit;
}
if (isset($_POST['search'])) {
	require_once '../conn.php';
	$search = $_POST['search'];
	$query = mysqli_query($conn, "SELECT * FROM siswa WHERE nama_siswa LIKE '%" . $search . "%'"); ?>
	<?php foreach ($query as $datasiswa) { ?>
		<tr>
			<td><?php echo $datasiswa['nama_siswa'] ?> </td>
			<td><?php echo $datasiswa['asal_sekolah'] ?> </td>
			<td><?php echo $datasiswa['email'] ?> </td>
			<td><?php echo $datasiswa['telepon'] ?> </td>
			<td>
				<?php if ($datasiswa['validated'] == "1") { ?>
					<a href="acc.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn disabled" style="background-color: lightgrey; color: black;">Tervalidasi</a>
				<?php } else { ?>
					<a href="acc.php?id_siswa=<?php echo $datasiswa['id_siswa']; ?>" class="btn btn-danger">Validasi</a>
				<?php } ?>
			</td>
		</tr>
	<?php } ?>
<?php } ?>