<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_POST)) {
    $NamaBarang  = $_POST['NamaBarang'];
    $Satuan  = $_POST['Satuan'];
    $HargaSatuan     = $_POST['HargaSatuan'];

    $sql    = "INSERT INTO tbl_barang  (NamaBarang, Satuan, HargaSatuan) VALUES ('$NamaBarang', '$Satuan', '$HargaSatuan')";
                                
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
