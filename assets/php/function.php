<?php

    include '../conn.php';  
    function upload_course($data)
    {
        global $conn;
        $nama_course = $data["nama_course"];
        $bg_course = $data["bg_course"];
        $desc_course = $data["desc_course"];
        $kategori_kelas = $data["kategori_kelas"];

        $result = mysqli_query($conn, "SELECT nama_course FROM course WHERE nama_course = '$nama_course'");
        if( mysqli_fetch_assoc($result) )
        {
            echo "<script>
                    alert('Nama Course sudah tersedia!');
                </script>";

            return false;
        }

        mysqli_query($conn, "INSERT INTO course VALUES('', '$nama_course', '$bg_course', '$desc_course', '$kategori_kelas')");
        return mysqli_affected_rows($conn);
    }
    
    function upload_modul($data)
    {
        global $conn;
        $nama_modul = $data["nama_modul"];
        $kategori_course = $data["kategori_course"];

        $result = mysqli_query($conn, "SELECT nama_modul FROM modul WHERE nama_modul = '$nama_modul'");
        if( mysqli_fetch_assoc($result) )
        {
            echo "<script>
                    alert('Nama Modul sudah tersedia!');
                </script>";

            return false;
        }

        mysqli_query($conn, "INSERT INTO modul VALUES('', '$nama_modul', '$kategori_course')");
        return mysqli_affected_rows($conn);
    }
    
    function upload_submodul($data)
    {
        global $conn;
        $judul_content = $data["judul_content"];
        $content = $data["content"];
        $kategori_modul = $data["kategori_modul"];

        $result = mysqli_query($conn, "SELECT judul_content FROM submodul WHERE judul_content = '$judul_content'");
        if( mysqli_fetch_assoc($result) )
        {
            echo "<script>
                    alert('Nama Submodul sudah tersedia!');
                </script>";

            return false;
        }

        mysqli_query($conn, "INSERT INTO submodul VALUES('', '$judul_content', '$content', '$kategori_modul')");
        return mysqli_affected_rows($conn);
    }
    
    function upload_kelas($data)
    {
        global $conn;
        $nama_kelas = $data["nama_kelas"];

        $result = mysqli_query($conn, "SELECT nama_kelas FROM kelas WHERE nama_kelas = '$nama_kelas'");
        if( mysqli_fetch_assoc($result) )
        {
            echo "<script>
                    alert('Nama kelas sudah tersedia!');
                </script>";

            return false;
        }

        mysqli_query($conn, "INSERT INTO kelas VALUES('', '$nama_kelas')");
        return mysqli_affected_rows($conn);
    }

?>