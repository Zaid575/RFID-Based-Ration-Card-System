<?php

include("sessioncheck.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];
$districtid = $_SESSION['districtid'];
if (isset($_POST['tabledata'])) {

    $data = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $result = mysqli_query($connection, "SELECT u.*, f.*, c.name AS cardname 
                                        FROM user AS u INNER JOIN familymember AS f 
                                        ON u.cardnumber = f.cardnumber 
                                        INNER JOIN cardtype AS c 
                                        ON u.type = c.id 
                                        ORDER BY f.cardnumber");
    $data->list = mysqli_fetch_all($result, MYSQLI_ASSOC);

    $result = mysqli_query($connection, "SELECT cardnumber FROM `user` ORDER BY `cardnumber`");
    $data->cardnumber = mysqli_fetch_all($result, MYSQLI_ASSOC);

    echo json_encode($data);
    exit();
}


//Add user family member
if (isset($_POST['Add'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $email1 = array();

    $cardnumber = mysqli_real_escape_string($connection, trim(strip_tags($_POST["cardnumber"])));
    $name = mysqli_real_escape_string($connection, trim(strip_tags($_POST["name"])));
    $dob = mysqli_real_escape_string($connection, trim(strip_tags($_POST["dob"])));
    $gender = mysqli_real_escape_string($connection, trim(strip_tags($_POST["gender"])));
    $relation = mysqli_real_escape_string($connection, trim(strip_tags($_POST["relation"])));
    $aadhar = mysqli_real_escape_string($connection, trim(strip_tags($_POST["aadhar"])));


    try {
        $data = mysqli_query($connection, "INSERT INTO `familymember`
                                        (`cardnumber`, `name`, `age`, `gender`, `status`, `relation`, `addharid`, `addedby`)
                                        values
                                        ('$cardnumber','$name', '$dob','$gender','1','$relation','$aadhar','$userid')");


        if (mysqli_affected_rows($connection) == 1) {
            $msg->value = 1;
            $msg->data = "Family member added successfully. ";
            $msg->type = "alert alert-success alert-dismissible ";
        } else {
            $msg->value = 0;
            $msg->data = "Please Check Information. or Member Already Exists.";
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

//Update card Status
if (isset($_POST['Update'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");

    $userid = mysqli_real_escape_string($connection, trim(strip_tags($_POST['userid'])));
    $status = mysqli_real_escape_string($connection, trim(strip_tags($_POST['status'])));
    $newstatus;
    $color;

    if ($status == 1) {
        $newstatus = 0;
        $msg->type = "alert alert-danger alert-dismissible ";
    } else {
        $newstatus = 1;
        $msg->type = "alert alert-success alert-dismissible ";
    }

    if (mysqli_query($connection, "UPDATE `familymember` SET `status` = '$newstatus' WHERE id = '$userid'") <= 0) {
        $msg->value = 0;
        $msg->data = " You cannot update user. Please Try again.";
    } else {
        $msg->value = 1;
        $msg->data = "Family member updated successfully.";
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
    <title><?= $project ?> : Add Family member</title>
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
                    <li><a href="#">Officer</a></li>
                    <li class="active">Family member list</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Default box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"> Family member registration</h3>
                                <a class="btn btn-social-icon btn-success pull-right" style="margin:5px" title="Add New Family member" data-toggle="modal" data-target="#modaladd"><i class="fa fa-plus"></i></a>
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
                                            <th class='text-center'>Card number</th>
                                            <th class='text-center'>Name</th>
                                            <th class='text-center'>DOB</th>
                                            <th class='text-center'>Gender</th>
                                            <th class='text-center'>Relation</th>
                                            <th class='text-center'>Addhar</th>
                                            <th class='text-center'>Addedby</th>
                                            <th class='text-center'>Status</th>
                                            <th class='text-center'>Update</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>Card number</th>
                                            <th class='text-center'>Name</th>
                                            <th class='text-center'>DOB</th>
                                            <th class='text-center'>Gender</th>
                                            <th class='text-center'>Relation</th>
                                            <th class='text-center'>Addhar</th>
                                            <th class='text-center'>Addedby</th>
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
        <!-- Add User modal -->
        <form id="adduser" action="" method="post">
            <div class="modal fade" id="modaladd" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-green">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Add New Family member</h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="addalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#addalertclass').hide()">×</button>
                                <p id="addmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Card Number</label>
                                <select class="form-control select2 select3 " style="width: 100%;" required name="cardnumber" id="cardnumber">
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <input type="text" class="form-control" placeholder="Enter Name" name="name" id="name" required pattern="[a-zA-Z\s]+">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">DOB</label>
                                <input type="date" class="form-control" placeholder="Enter Name" name="dob" id="dob" required max="<?= date("Y-m-d") ?>">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Gender</label>
                                <select class="form-control select2 " style="width: 100%;" required name="gender" id="gender">
                                    <option>Select gender</option>
                                    <option value="Female">Female</option>
                                    <option value="Male">Male</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Relation</label>
                                <select class="form-control select2 " style="width: 100%;" required name="relation" id="relation">   
                                    <option>Select relation</option>                                 
                                    <option value="Brother">Brother</option>
                                    <option value="Daughter">Daughter</option>
                                    <option value="Father">Father</option>
                                    <option value="Mother">Mother</option>
                                    <option value="Female">Self</option>
                                    <option value="Sister">Sister</option>
                                    <option value="Son">Son</option>
                                    <option value="Wife">Wife</option>                                                                        
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Aadhar</label>
                                <input type="text" class="form-control" placeholder="Enter Aadhar" name="aadhar" id="aadhar" required pattern="[0-9]{12}">
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
        <!-- End Add user modal -->

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
                $('#adduser')[0].reset();

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
                                '" data-cardnumber="' + value.cardnumber +                                
                                '"';

                            var btndelete = "";                            

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
                                '<td class="text-center">' + value.name + '</td>' +
                                '<td class="text-center">' + value.age + '</td>' +
                                '<td class="text-center">' + value.gender + '</td>' +
                                '<td class="text-center">' + value.relation + '</td>' +
                                '<td class="text-center">' + value.addharid + '</td>' +
                                '<td class="text-center">' + value.addedby + '</td>' +
                                '<td class="text-center">' + value.status + '</td>' +
                                '<td class="text-center">' + btndelete + '</td>' +
                                '</tr>';
                            $('#example1 tbody').append(html);
                        });

                        $('.select3').append(new Option("Select type", ""));
                        $.each(returnedData['cardnumber'], function(key, value) {
                            $('.select3').append(new Option(value.cardnumber, value.cardnumber));
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

            $('#adduser').submit(function(e) {
                $('#add').prop('disabled', true);
                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();

                $('#addalertclass').removeClass();
                $('#addmsg').empty();

                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#adduser').serialize(),
                    success: function(response) {
                        // console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#adduser')[0].reset();
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

            //Update user status
            $(document).on("click", ".update-button", function(e) {

                $('#alertclass').removeClass();
                $('#msg').empty();

                e.preventDefault();
                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: {
                        'Update': 'Update',
                        'userid': $(this).data('editid'),
                        'status': $(this).data('status')
                    },
                    success: function(response) {
                        //console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                            tabledata();
                        } else {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                        }
                        tabledata();
                    }
                });
            });            
        })
    </script>
</body>

</html>