<?php

include("sessioncheck.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];

if (isset($_POST['tabledata'])) {

    $data = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $result = mysqli_query($connection, "SELECT * FROM `district`");
    $data->list = mysqli_fetch_all($result, MYSQLI_ASSOC);

    echo json_encode($data);
    exit();
}


//Add district 
if (isset($_POST['Add'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $email1 = array();

    $name = mysqli_real_escape_string($connection, trim(strip_tags($_POST["name"])));
    $state = mysqli_real_escape_string($connection, trim(strip_tags($_POST["state"])));

    try {
        $data = mysqli_query($connection, "INSERT INTO `district`
                                        (`name`, `state`, `status`)
                                        values
                                        ('$name', '$state','1')");


        if (mysqli_affected_rows($connection) == 1) {
            $msg->value = 1;
            $msg->data = "District Added Successfully. ";
            $msg->type = "alert alert-success alert-dismissible ";
        } else {
            $msg->value = 0;
            $msg->data = "Please Check Information. or District Already Exists.";
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

//Edit district
if (isset($_POST['Edit'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8");

    $editname = mysqli_real_escape_string($connection, $_POST['editname']);
    $editstate = mysqli_real_escape_string($connection, $_POST['editstate']);
    $id = mysqli_real_escape_string($connection, trim(strip_tags($_POST['id'])));

    $updaterain = mysqli_query($connection, "UPDATE `district` SET 
                                            `name`= '$editname', `state`='$editstate' WHERE id = '$id'");

    if ($updaterain > 0) {
        $msg->value = 1;
        $msg->data = "District updated successfully.";
        $msg->type = "alert alert-success alert-dismissible ";
    } else {
        $msg->value = 0;
        $msg->data = "Please check district name and try again";
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
    <title><?= $project ?> : Add District</title>
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
                    <li class="active">District list</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Default box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"> District Registration</h3>
                                <a class="btn btn-social-icon btn-success pull-right" style="margin:5px" title="Add New District" data-toggle="modal" data-target="#modaladd"><i class="fa fa-plus"></i></a>
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
                                            <th class='text-center'>State</th>
                                            <th class='text-center'>Status</th>
                                            <th class='text-center'>Update</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>Name</th>
                                            <th class='text-center'>State</th>
                                            <th class='text-center'>Status</th>
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
        <!-- Add District modal -->
        <form id="adddistrict" action="" method="post">
            <div class="modal fade" id="modaladd" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-green">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Add New District </h4>
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
                                <label for="exampleInputEmail1">Select State</label>
                                <select class="form-control select2 select3 " style="width: 100%;" id="state" name="state" required>
                                    <option value="">--Select--</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option value="Assam">Assam</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Haryana">Haryana</option>
                                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Manipur">Manipur</option>
                                    <option value="Meghalaya">Meghalaya</option>
                                    <option value="Mizoram">Mizoram</option>
                                    <option value="Nagaland">Nagaland</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Punjab">Punjab</option>
                                    <option value="Rajasthan">Rajasthan</option>
                                    <option value="Sikkim">Sikkim</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                    <option value="Telangana">Telangana</option>
                                    <option value="Tripura">Tripura</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Uttarakhand">Uttarakhand</option>
                                    <option value="West Bengal">West Bengal</option>
                                    <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                    <option value="Chandigarh">Chandigarh</option>
                                    <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                                    <option value="Lakshadweep">Lakshadweep</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Puducherry">Puducherry</option>
                                    <option value="Ladakh">Ladakh</option>
                                    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <input type="hidden" name="Add" value="Add">
                            <button type="submit" name="Add" value="Add" id='add' class="btn btn-success">Register Me</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </form>
        <!-- End District modal -->
         <!-- Edit District modal -->
        <form id="editdistrict" action="" method="post">
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
                                <label for="exampleInputEmail1">District name</label>
                                <input type="text" class="form-control" placeholder="District name" name="editname" id="editname" required>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Select State</label>
                                <select class="form-control select2 select3 " style="width: 100%;" id="editstate" name="editstate" required>
                                    <option value="">--Select--</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option value="Assam">Assam</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Haryana">Haryana</option>
                                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Manipur">Manipur</option>
                                    <option value="Meghalaya">Meghalaya</option>
                                    <option value="Mizoram">Mizoram</option>
                                    <option value="Nagaland">Nagaland</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Punjab">Punjab</option>
                                    <option value="Rajasthan">Rajasthan</option>
                                    <option value="Sikkim">Sikkim</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                    <option value="Telangana">Telangana</option>
                                    <option value="Tripura">Tripura</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Uttarakhand">Uttarakhand</option>
                                    <option value="West Bengal">West Bengal</option>
                                    <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                    <option value="Chandigarh">Chandigarh</option>
                                    <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                                    <option value="Lakshadweep">Lakshadweep</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Puducherry">Puducherry</option>
                                    <option value="Ladakh">Ladakh</option>
                                    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                </select>
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
                $('#adddistrict')[0].reset();

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
                            var datatext = 'data-editid="' + value.id + '" data-status="' + value.status +
                                '" data-name="' + value.name +
                                '" data-state="' + value.state + '"';
                            button1 = '<button type="submit" name="Edit" id="Edit" ' +
                                'data-editid="' + value.id + '" data-name="' + value.name +
                                '" data-status="' + value.status +
                                '" data-state="' + value.state + 
                                '" class="btn btn-xs btn-warning edit-button" style= "margin:5px" title=" Edit district" data-toggle="modal" data-target="#modaledit"><i class="fa fa-edit"></i></button>';


                            var html = '<tr class="odd gradeX">' +
                                '<td class="text-center">' + srno + '</td>' +
                                '<td class="text-center">' + value.name + '</td>' +
                                '<td class="text-center">' + value.state + '</td>' +
                                '<td class="text-center">' + value.status + '</td>' +
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

            $('#adddistrict').submit(function(e) {
                $('#add').prop('disabled', true);
                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();

                $('#addalertclass').removeClass();
                $('#addmsg').empty();

                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#adddistrict').serialize(),
                    success: function(response) {
                        // console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#adddistrict')[0].reset();
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
                $(".modal-body #editname").attr("value", $(this).data('name'));
                // $(".modal-body #editstate").attr("value", $(this).data('state')).change();
                $(".modal-body #editstate").val($(this).data('state')).change();
                $("#editid").val($(this).data('editid'));
            });

            //edit district 
            $('#editdistrict').submit(function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#editdistrict').serialize(),
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