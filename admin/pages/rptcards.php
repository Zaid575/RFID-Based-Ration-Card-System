<?php

include("sessioncheck.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];

if (isset($_POST['tabledata'])) {

    $data = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $result = mysqli_query($connection, "SELECT * FROM `cardtype`");
    $data->list = mysqli_fetch_all($result, MYSQLI_ASSOC);

    echo json_encode($data);
    exit();
}


//Add card 
if (isset($_POST['Add'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $email1 = array();

    $name = mysqli_real_escape_string($connection, trim(strip_tags($_POST["name"])));
    $rice = mysqli_real_escape_string($connection, trim(strip_tags($_POST["rice"])));
    $sugar = mysqli_real_escape_string($connection, trim(strip_tags($_POST["sugar"])));
    $wheat = mysqli_real_escape_string($connection, trim(strip_tags($_POST["wheat"])));

    $ricerate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["ricerate"])));
    $sugarrate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["sugarrate"])));
    $wheatrate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["wheatrate"])));

    try {
        $data = mysqli_query($connection, "INSERT INTO `cardtype`
                                        (`name`, `rice`, `sugar`, `wheat`, `ricerate`, `sugarrate`, `wheatrate`)
                                        values
                                        ('$name', '$rice','$sugar','$wheat','$ricerate','$sugarrate','$wheatrate')");


        if (mysqli_affected_rows($connection) == 1) {
            $msg->value = 1;
            $msg->data = "Card Added Successfully. ";
            $msg->type = "alert alert-success alert-dismissible ";
        } else {
            $msg->value = 0;
            $msg->data = "Please Check Information. or Card Already Exists.";
            $msg->type = "alert alert-danger alert-dismissible ";
        }
    } catch (Exception $e) {
        $msg->value = 0;
        $msg->data = "Please check your info and try again. " . $e->getMessage();
        $msg->type = "alert alert-danger alert-dismissible ";
    }

    echo json_encode($msg);
    exit();
}

//Edit card
if (isset($_POST['Edit'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8");

    $rice = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editrice"])));
    $sugar = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editsugar"])));
    $wheat = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editwheat"])));

    $ricerate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editricerate"])));
    $sugarrate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editsugarrate"])));
    $wheatrate = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editwheatrate"])));
    $id = mysqli_real_escape_string($connection, trim(strip_tags($_POST['id'])));

    $updaterain = mysqli_query($connection, "UPDATE `cardtype` SET 
                                            `rice` = '$rice', `sugar` = '$sugar', `wheat` = '$wheat', 
                                            `ricerate` = '$ricerate', `sugarrate` = '$sugarrate', `wheatrate` = '$wheatrate' 
                                            WHERE id = '$id'");

    if ($updaterain > 0) {
        $msg->value = 1;
        $msg->data = "Card updated successfully.";
        $msg->type = "alert alert-success alert-dismissible ";
    } else {
        $msg->value = 0;
        $msg->data = "Please check card name and try again";
        $msg->type = "alert alert-danger alert-dismissible ";
    }

    echo json_encode($msg);
    exit();
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= $project ?> : Add Cards</title>
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
                    <li class="active">Cards type</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Default box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"> Card type Registration</h3>
                                <a class="btn btn-social-icon btn-success pull-right" style="margin:5px" title="Add New type" data-toggle="modal" data-target="#modaladd"><i class="fa fa-plus"></i></a>
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
                                            <th class='text-center'>Name</th>
                                            <th class='text-center'>Rice</th>
                                            <th class='text-center'>Sugar</th>
                                            <th class='text-center'>Wheat</th>
                                            <th class='text-center'>Update</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>Name</th>
                                            <th class='text-center'>Rice</th>
                                            <th class='text-center'>Sugar</th>
                                            <th class='text-center'>Wheat</th>
                                            <th class='text-center'>Update</th>
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
        <!-- Add card modal -->
        <form id="addcard" action="" method="post">
            <div class="modal fade" id="modaladd" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-green">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Add New Card type </h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="addalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#addalertclass').hide()">×</button>
                                <p id="addmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Name</label>
                                <input type="text" class="form-control" placeholder="Enter Name" name="name" id="name" required pattern="[a-zA-Z\s]+">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Rice Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Rice Quantity" name="rice" id="rice" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Rice Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Rice Rate" name="ricerate" id="ricerate" required min="0" max="1000">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Sugar Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Sugar Quantity" name="sugar" id="sugar" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Sugar Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Sugar Rate" name="sugarrate" id="sugarrate" required min="0" max="1000">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Wheat Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Wheat Quantity" name="wheat" id="wheat" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Wheat Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Wheat Rate" name="wheatrate" id="wheatrate" required min="0" max="1000">
                            </div>

                        </div>
                        <div class="modal-footer ">
                            <input type="hidden" name="Add" value="Add">
                            <button type="submit" name="Add" value="Add" id='add' class="btn btn-success">Add Me</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </form>
        <!-- End card add modal -->
        <!-- Edit card modal -->
        <form id="editcard" action="" method="post">
            <div class="modal fade" id="modaledit" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-red">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Edit District</h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="editalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#editalertclass').hide()">×</button>
                                <p id="editmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Card name</label>
                                <input type="text" class="form-control" placeholder="Card name" name="editname" id="editname" required readonly>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Rice Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Rice Quantity" name="editrice" id="editrice" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Rice Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Rice Rate" name="editricerate" id="editricerate" required min="0" max="1000">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Sugar Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Sugar Quantity" name="editsugar" id="editsugar" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Sugar Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Sugar Rate" name="editsugarrate" id="editsugarrate" required min="0" max="1000">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Wheat Quantity</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Wheat Quantity" name="editwheat" id="editwheat" required min="0" max="100">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Wheat Rate</label>
                                <input step="any" type="number" class="form-control" placeholder="Enter Wheat Rate" name="editwheatrate" id="editwheatrate" required min="0" max="1000">
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <input type="hidden" name="id" id="editid">
                            <input type="hidden" name="Edit" value="Edit">
                            <button type="submit" name="Edit" value="Edit" id='Edit' class="btn btn-success">Update</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </form>
        <!-- End Edit College modal -->


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

                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();
                $('#addcard')[0].reset();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: {
                        'tabledata': 'tabledata'
                    },
                    success: function(response) {
                        //console.log(response);
                        var returnedData = JSON.parse(response);
                        var srno = 0;
                        $.each(returnedData['list'], function(key, value) {
                            srno++;
                            var update = "";
                            var datatext = 'data-editid="' + value.id + '" data-name="' + value.name +
                                '" data-rice="' + value.rice + '" data-ricerate="' + value.ricerate +
                                '" data-sugar="' + value.sugar + '" data-sugarrate="' + value.sugarrate +
                                '" data-wheat="' + value.wheat + '" data-wheatrate="' + value.wheatrate +                                
                                '"';
                            button1 = '<button type="submit" name="Edit" id="Edit" ' + datatext +
                                '" class="btn btn-xs btn-warning edit-button" style= "margin:5px" title=" Edit card"'+
                                'data-toggle="modal" data-target="#modaledit"><i class="fa fa-edit"></i></button>';


                            var html = '<tr class="odd gradeX">' +
                                '<td class="text-center">' + srno + '</td>' +
                                '<td class="text-center">' + value.name + '</td>' +
                                '<td class="text-center">' + value.rice + 'KG / '+ value.ricerate +' Rs</td>' +
                                '<td class="text-center">' + value.sugar + 'KG / '+ value.sugarrate +' Rs</td>' +
                                '<td class="text-center">' + value.wheat + 'KG / '+ value.wheatrate +' Rs</td>' +
                                '<td class="text-center">' + button1 + '</td>' +
                                '</tr>';
                            $('#example1 tbody').append(html);
                        });

                        $('#example1').DataTable({
                            stateSave: true,
                            destroy: true,
                        });
                    }
                });
            }

            tabledata();

            $('#addcard').submit(function(e) {
                $('#add').prop('disabled', true);
                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();

                $('#addalertclass').removeClass();
                $('#addmsg').empty();

                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#addcard').serialize(),
                    success: function(response) {
                        // console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#addcard')[0].reset();
                            $('#addalertclass').addClass(returnedData['type']);
                            $('#addmsg').append(returnedData['data']);
                            $("#addalertclass").show();
                            tabledata();
                        } else {
                            $('#addalertclass').addClass(returnedData['type']);
                            $('#addmsg').append(returnedData['data']);
                            $("#addalertclass").show();
                            tabledata();
                        }
                        $('#add').prop('disabled', false);

                    }
                });

            });

            $(document).on("click", ".edit-button", function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                $('#editcard')[0].reset();
                $(".modal-body #editname").attr("value", $(this).data('name'));
                $(".modal-body #editrice").attr("value", $(this).data('rice'));
                $(".modal-body #editsugar").attr("value", $(this).data('sugar'));
                $(".modal-body #editwheat").attr("value", $(this).data('wheat'));
                $(".modal-body #editricerate").attr("value", $(this).data('ricerate'));
                $(".modal-body #editsugarrate").attr("value", $(this).data('sugarrate'));
                $(".modal-body #editwheatrate").attr("value", $(this).data('wheatrate'));                
                $("#editid").val($(this).data('editid'));
            });

            //edit card 
            $('#editcard').submit(function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#editcard').serialize(),
                    success: function(response) {
                        // console.log(response);                      
                        var returnedData = JSON.parse(response);

                        if (returnedData['value'] == 1) {
                            $('#editalertclass').addClass(returnedData['type']);
                            $('#editmsg').append(returnedData['data']);
                            $("#editalertclass").show();
                            tabledata();
                        } else {
                            $('#editalertclass').addClass(returnedData['type']);
                            $('#editmsg').append(returnedData['data']);
                            $("#editalertclass").show();
                        }
                    }
                });
            });
        })
    </script>
</body>

</html>