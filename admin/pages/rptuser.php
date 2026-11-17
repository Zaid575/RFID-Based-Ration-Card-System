<?php

include("sessioncheck.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];
if (isset($_POST['tabledata'])) {

    $data = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $result = mysqli_query($connection, "SELECT u.*, c.name as cardname 
                                            FROM `user` as u INNER JOIN cardtype as c 
                                            ON u.type = c.id;");
    $data->list = mysqli_fetch_all($result, MYSQLI_ASSOC);

    $result = mysqli_query($connection, "SELECT * FROM `cardtype` ORDER BY `name`");
    $data->cardtype = mysqli_fetch_all($result, MYSQLI_ASSOC);

    echo json_encode($data);
    exit();
}
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= $project ?> : User List</title>
    <link rel="icon" href="../../dist/img/small.png" type="image/x-icon">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../bower_components/select2/dist/css/select2.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        tfoot input {
            width: 50%;
            padding: 3px;
            box-sizing: border-box;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

        <?php include("header.php"); ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h4>
                    <?= $project ?>
                    <small><?= $slogan ?></small>
                </h4>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Admin</a></li>
                    <li class="active">User list</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Default box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"> User Registration</h3>                                
                            </div>
                            <div class="alert " id="alertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#alertclass').hide()">×</button>
                                <p id="msg"></p>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="box-body  table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>Card</th>
                                            <th class='text-center'>Type</th>
                                            <th class='text-center'>Address</th>
                                            <th class='text-center'>Email</th>
                                            <th class='text-center'>RFID</th>
                                            <th class='text-center'>Addedby</th>
                                            <th class='text-center'>Status</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>Card</th>
                                            <th class='text-center'>Type</th>
                                            <th class='text-center'>Address</th>
                                            <th class='text-center'>Email</th>
                                            <th class='text-center'>RFID</th>
                                            <th class='text-center'>Addedby</th>
                                            <th class='text-center'>Status</th>                                            
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.box-footer-->
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <?php include("footer.php"); ?>

    </div>
    <!-- ./wrapper -->

    <!-- jQuery 3 -->
    <script src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
    <!-- DataTables -->
    <script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="../../bower_components/select2/dist/js/select2.full.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.sidebar-menu').tree()

            $('[data-toggle="tooltip"]').tooltip();

            $('#example1').DataTable({
                stateSave: true,
                destroy: true,
            });

            //Initialize Select2 Elements
            $('.select2').select2()

            //display data table   
            function tabledata() {
                $('.select3').empty();
                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();               

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: {
                        'tabledata': 'tabledata'
                    },
                    success: function(response) {
                        // console.log(response);
                        var returnedData = JSON.parse(response);
                        var srno = 0;
                        $.each(returnedData['list'], function(key, value) {
                            srno++;
                            var update = "";
                            var datatext = 'data-editid="' + value.id + '" data-status="' + value.status +
                                '" data-rfid="' + value.rfid + '" data-cardnumber="' + value.cardnumber +
                                '" data-cardtype="' + value.type +
                                '"';

                            var btndelete = "";
                            const btnupdate = '<button type="submit" name="Edit" id="Edit" ' +
                                datatext +
                                '" class="btn btn-xs btn-warning edit-button" style= "margin:5px" title=" Edit district" data-toggle="modal" data-target="#modaledit"><i class="fa fa-edit"></i></button>';

                            if (value.status == 1) {
                                btndelete = '<button type="submit" name="Update" id="Update" ' +
                                    'data-editid="' + value.id + '" data-status="' + value.status +
                                    '" class="btn btn-xs btn-danger update-button" style= "margin:5px" title="Deactivate User" ><i class="fa fa-close"></i></button>';
                            } else {
                                btndelete = '<button type="submit" name="Update" id="Update" ' +
                                    'data-editid="' + value.id + '" data-status="' + value.status +
                                    '" class="btn btn-xs btn-success update-button" style= "margin:5px" title="Activate User" ><i class="fa fa-check"></i></button>';
                            }

                            var html = '<tr class="odd gradeX">' +
                                '<td class="text-center">' + srno + '</td>' +
                                '<td class="text-center">' + value.cardnumber + '</td>' +
                                '<td class="text-center">' + value.cardname + '</td>' +
                                '<td class="text-center">' + value.address + '</td>' +
                                '<td class="text-center">' + value.email + '</td>' +
                                '<td class="text-center">' + value.rfid + '</td>' +
                                '<td class="text-center">' + value.addedby + '</td>' +
                                '<td class="text-center">' + value.status + '</td>' +                                
                                '</tr>';
                            $('#example1 tbody').append(html);
                        });

                        $('.select3').append(new Option("Select type", ""));
                        $.each(returnedData['cardtype'], function(key, value) {
                            $('.select3').append(new Option(value.name, value.id));
                        });

                        //Initialize Select2 Elements
                        $('.select2').select2()

                        $('#example1').DataTable({
                            stateSave: true,
                            destroy: true,
                        });
                    }
                });
            }

            tabledata();
        })
    </script>
</body>

</html>