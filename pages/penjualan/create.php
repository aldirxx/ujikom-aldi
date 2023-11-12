<html>
    <head>
        <meta charset="TTF-8"> 
        <title>Create Penjualan</title>

        <!--link-rel-->
        <?php include '../templates/link-rel.php'; ?>

    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

             <!-- // header -->
            <?php include '../templates/header.php'; ?>
            <!-- // side menu -->
            <?php include '../templates/menu.php'; ?>
       
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
                                    <h3 class="card-title">Table Penjualan</h3>
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
                            <form action="controllers/create.php" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Username</label>
                                            <input type="text" class="form-control" name="Username" placeholder="Username">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="">Password</label>
                                            <input type="text" class="form-control" name="password" placeholder="Password">
                                    </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nama Kasir</label>
                                            <input type="text" class="form-control" name="NamaKasir" placeholder="Nama Kasir">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">No. Handphone</label>
                                            <input type="text" class="form-control" name="NomerHP" placeholder="No. Handphone">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nomer KTP</label>
                                            <input type="text" class="form-control" name="NomerKTP" placeholder="Nomer KTP">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Alamat</label>
                                            <textarea name="Alamat" class="form-control" placeholder="Alamat"></textarea>
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