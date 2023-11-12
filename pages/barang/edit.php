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

                    $sql = "SELECT * FROM tbl_barang WHERE ID_Barang=$id ";
                    $query = mysqli_query($db, $sql);
                    $barang = mysqli_fetch_assoc($query);
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
                            <form action="controllers/edit.php" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nama Barang</label>
                                            <!-- hidden id -->
                                            <input type="hidden" name="id" value="<?php echo $barang['ID_Barang']; ?>">


                                            <input type="text" name="NamaBarang" class="form-control" value="<?php echo $barang['NamaBarang']; ?>">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="">Satuan</label>
                                            <input type="text" name="Satuan" class="form-control" value="<?php echo $barang['Satuan']; ?>">
                                    </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Harga Satuan</label>
                                            <input type="text" name="HargaSatuan" class="form-control" value="<?php echo $barang['HargaSatuan']; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer justify-content-between">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
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