<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_POST)) {
    $id         = $_POST['id'];
    $NamaBarang  = $_POST['NamaBarang'];
    $Satuan  = $_POST['Satuan'];
    $HargaSatuan     = $_POST['HargaSatuan'];

    $sql    = "UPDATE tbl_barang  
                                SET NamaBarang  = '$NamaBarang',
                                    Satuan      = '$Satuan',
                                    HargaSatuan = '$HargaSatuan'
                                    
                                    WHERE ID_Barang='$id' ";
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
