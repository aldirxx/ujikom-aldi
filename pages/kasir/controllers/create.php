<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_POST)) {
    $Username  = $_POST['Username'];
    $password  = $_POST['password'];
    $NamaKasir = $_POST['NamaKasir'];
    $NomerHP   = $_POST['NomerHP'];
    $NomerKTP  = $_POST['NomerKTP'];
    $Alamat    = $_POST['Alamat'];


    $sql    = "INSERT INTO tbl_kasir  (Username, password, NamaKasir, NomerHP, NomerKTP, Alamat) VALUES ('$Username', '$password', '$NamaKasir','$NomerHP', '$NomerKTP','$Alamat')";
                                
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
