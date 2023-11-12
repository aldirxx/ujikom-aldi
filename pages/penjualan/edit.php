<html>
    <head>
        <meta charset="TTF-8"> 
        <title>Edit Barang</title>

        <!--link-rel-->
        <?php include '../templates/link-rel.php'; ?>

    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

             <!-- // header -->
            <?php include '../templates/header.php'; ?>
            <!-- // side menu -->
            <?php include '../templates/menu.php'; ?>

            <!-- struktur data detail data -->
            <?php
                if (isset($_GET['id'])){

                    $id = $_GET['id'];

                    $sql = "SELECT * FROM tbl_kasir WHERE ID_Kasir=$id ";
                    $query = mysqli_query($db, $sql);
                    $kasir = mysqli_fetch_assoc($query);
                }
            ?>
       
            <!-- // content -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                <div class="container-fluid">
                    <div class="row">
                    <div class="col-12">
                        <div class="card my-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="card-title">Data Edit Link Create</h3>
                                </div>
                                <div class="col-md-6">
                                    <a href="index.php" class="btn btn-sm btn-primary float-right">
                                        <i class="fa fa-arrow-left"></i>&nbsp; Kembali Ke List Data
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- /.card-header -->
                        <div class="card-body">
                        <!-- ["Username"]=> string(12) "Abdul Rahman" ["NamaKasir"]=> string(3) "RIO" ["Alamat"]=> string(7) "Inkopad" ["NomerHP"]=> string(10) "0834567890" ["NomerKTP"]=> string(12) "321234567890" ["password"]=> string(4) "aman" } -->
                            <form action="controllers/edit.php" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="hidden" name="id" value="<?php echo $kasir['ID_Kasir']; ?>">
                                            <label for="">Username</label>
                                            <input type="text" class="form-control" name="Username" placeholder="Username" value="<?php echo $kasir['Username']; ?>">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="">Password</label>
                                            <input type="text" class="form-control" name="password" placeholder="Password" value="<?php echo $kasir['password']; ?>">
                                    </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nama Kasir</label>
                                            <input type="text" class="form-control" name="NamaKasir" placeholder="Nama Kasir" value="<?php echo $kasir['NamaKasir'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">No. Handphone</label>
                                            <input type="text" class="form-control" name="NomerHP" placeholder="No. Handphone" value="<?php echo $kasir['NomerHP'] ?>">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nomer KTP</label>
                                            <input type="text" class="form-control" name="NomerKTP" placeholder="Nomer KTP" value="<?php echo $kasir['NomerKTP'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Alamat</label>
                                            <textarea name="Alamat" class="form-control" placeholder="Alamat"><?php echo $kasir['Alamat'] ?></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer justify-content-between">
                                    <button type="reset" class="btn btn-default" data-dismiss="modal">Tutup</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>

            <!--footer-->
            <?php include '../templates/footer.php' ?>
            <!-- // script-->
            <?php include '../templates/script.php'; ?>

        </div>
    </body>
</html>