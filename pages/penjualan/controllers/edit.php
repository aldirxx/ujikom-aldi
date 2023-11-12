<?php

include '../../../config/koneksi/koneksi.php';

if (isset($_POST)) {
    $id        = $_POST['id'];
    $Username  = $_POST['Username'];
    $password  = $_POST['password'];
    $NamaKasir = $_POST['NamaKasir'];
    $NomerHP   = $_POST['NomerHP'];
    $NomerKTP  = $_POST['NomerKTP'];
    $Alamat    = $_POST['Alamat'];

    $sql    = "UPDATE tbl_kasir  
                                SET Username  = '$Username',
                                    password  = '$password',
                                    NamaKasir = '$NamaKasir',
                                    NomerHP   = '$NomerHP',
                                    NomerKTP  = '$NomerKTP',
                                    Alamat    = '$Alamat'

                                    WHERE ID_Kasir='$id' ";
    $query  = mysqli_query($db, $sql);
    
    if ($query){
        header('Location: ../index.php');
    }
}else{
    header('Location: ../index.php');
}
