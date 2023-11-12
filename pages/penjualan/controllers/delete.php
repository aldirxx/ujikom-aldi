<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_GET['ID_Kasir'])) {
    $ID_Kasir = $_GET['ID_Kasir'];

    $sql= "DELETE from tbl_kasir where ID_Kasir='$ID_Kasir'";
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
