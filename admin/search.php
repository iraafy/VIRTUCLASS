<?php
	if (isset($_POST['search'])) {
		require_once '../conn.php';
		$search = $_POST['search'];
		$query = mysqli_query($conn, "SELECT * FROM user WHERE nama_user LIKE '%" . $search . "%'"); ?>
		<?php foreach ($query as $dataUser) { ?>
			<tr>
				<td><?php echo $dataUser['nama_user'] ?> </td>
				<td><?php echo $dataUser['asal_sekolah'] ?> </td>
				<td><?php echo $dataUser['email'] ?> </td>
				<td><?php echo $dataUser['telepon'] ?> </td>
				<td>
					<?php if ($dataUser['validated'] == "1") { ?>
						<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn disabled" style="background-color: lightgrey; color: black;">Tervalidasi</a>
					<?php } else { ?>
						<a href="acc.php?id_user=<?php echo $dataUser['id_user']; ?>" class="btn btn-danger">Validasi</a>
					<?php } ?>
				</td>
			</tr>
		<?php } ?>
<?php } ?>