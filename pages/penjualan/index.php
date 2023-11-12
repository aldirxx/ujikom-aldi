
<html>
    <head>
        <meta charset="TTF-8"> 
        <title>Tabel Kasir</title>

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
                                    <h3 class="card-title">Data Penjualan</h3>
                                </div>
                                <div class="col-md-6">
                                    <a href="create.php" class="btn btn-sm btn-primary float-right">
                                        <i class="fa fa-plus"></i>&nbsp; Tambah Data
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>ID Penjualan</th>
                                <th>Tanggal</th>
                                <th>Total</th>
                                <th>Nama Kasir</th>
                                <th>Aksi</th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php
                                $no = 1;
                                $sql ="SELECT * 
                                                FROM tbl_penjualan AS a 
                                                LEFT JOIN tbl_shift AS b
                                                ON
                                                a.ID_Shift = b.ID_Shift
                                                LEFT JOIN tbl_kasir AS c
                                                ON b.ID_Kasir = c.ID_Kasir
                                                " ;
                                $query = mysqli_query($db, $sql);
                                while ($kasir = mysqli_fetch_array($query)){
                                
                            ?>

                            <tr>
                                <td><?php echo $no++; ?></td>
                                <td><?php echo $kasir['ID_Penjualan']; ?></td>
                                <td><?php echo $kasir['WaktuTransaksi']; ?></td>
                                <td><?php echo $kasir['Total']; ?></td>
                                <td><?php echo $kasir['NamaKasir']; ?></td>
                                <td>
                                    <a href="detail.php?id=<?php echo $kasir['ID_Penjualan']?>" class="btn btn-sm btn-info">Detail</a>
                                </td>
                            </tr>
                            <?php }?>
                            </table>
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