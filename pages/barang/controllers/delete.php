<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_GET['ID_Barang'])) {
    $ID_Barang = $_GET['ID_Barang'];

    $sql= "DELETE from tbl_barang where ID_Barang='$ID_Barang'";
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
