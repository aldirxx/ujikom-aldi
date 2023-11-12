<?php

include '../config/koneksi/koneksi.php';

if (isset($_POST)) {
    $ID_Kasir       = $_POST['ID_Kasir'];
    $password       = $_POST['password'];

    $sql    = "SELECT * FROM tbl_kasir
                WHERE ID_Kasir='$ID_Kasir' AND password='$password' ";

$query  = mysqli_query($db, $sql);

$nums_row = mysqli_num_rows($query);


    if ($nums_row == 1) {
        header('location: ../pages/kasir/index.php');
    }else {
        header('location: ../index.php');
    }

}else{
    header('Location: ../index.php');
}

?>