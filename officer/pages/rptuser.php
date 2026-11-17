<?php

include("sessioncheck.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];
$districtid = $_SESSION['districtid'];
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


//Add user
if (isset($_POST['Add'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $email1 = array();

    $cardnumber = mysqli_real_escape_string($connection, trim(strip_tags($_POST["cardnumber"])));

    $ptext = substr(str_shuffle("0123456789"), 0, 2) .
        substr(str_shuffle("abcdefghijkmnpqrstuvwxyz"), 0, 3) .
        substr(str_shuffle("ABCDEFGHJKLMNPQRSTUVWXYZ"), 0, 3);
    $password = md5($ptext);
    $email = mysqli_real_escape_string($connection, trim(strip_tags($_POST["email"])));
    $rfid = mysqli_real_escape_string($connection, trim(strip_tags($_POST["rfid"])));
    $address = mysqli_real_escape_string($connection, trim(strip_tags($_POST["address"])));
    $type = mysqli_real_escape_string($connection, trim(strip_tags($_POST["type"])));

    try {
        $data = mysqli_query($connection, "INSERT INTO `user`
                                        (`cardnumber`, `address`, `password`, `status`, `rfid`, `email`, `type`, `addedby`)
                                        values
                                        ('$cardnumber','$address', '$password','1','$rfid','$email','$type','$userid')");


        if (mysqli_affected_rows($connection) == 1) {

            $body =  "Dear " . $cardnumber . "  ,  <br/>

        Your new account is created at " . $project . " as user user. 
        <br/> Welcome you to the <b>" . $project . "</b>.We thank you for join with us.<br/><br/>        
        
        Your login ID is :" . $email . "<br/>
        Your Password is : " . $ptext . "<br/><br/>
        
        We request you to keep your login information confidential.<br/><br/>
        Thanks for Showing interest in our company.<br/><br/><br/>
        
        Regards,<br/>
        " . $project . "     
        ";

            $subject = "New ration user account created at " . $project;
            $mailstatus = mailsend($email, $body, $subject, $project);
            $mailmsg = "";
            if ($mailstatus == "Fail") {
                $mailmsg = "Mail Sending Fail.";
            } else {
                $mailmsg = "Mail Sending Successfully.";
            }

            $msg->value = 1;
            $msg->data = "User Added Successfully. " . $mailmsg;
            $msg->type = "alert alert-success alert-dismissible ";
        } else {
            $msg->value = 0;
            $msg->data = "Please Check Information. or Username Already Exists.";
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

//Edit user
if (isset($_POST['Edit'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $email1 = array();    
    
    $rfid = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editrfid"])));    
    $type = mysqli_real_escape_string($connection, trim(strip_tags($_POST["edittype"])));
    $editid = mysqli_real_escape_string($connection, trim(strip_tags($_POST['id'])));

    try {
        $data = mysqli_query($connection, "UPDATE `user` SET 
                                        `rfid` = '$rfid', `type` = $type, `addedby` = '$userid'
                                        WHERE id = '$editid'
                                        ");


        if (mysqli_affected_rows($connection) == 1) {
            $msg->value = 1;
            $msg->data = "User Updated Successfully. ";
            $msg->type = "alert alert-success alert-dismissible ";
        } else {
            $msg->value = 0;
            $msg->data = "Please Check Information. or RFID Already Exists.";
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

    if (mysqli_query($connection, "UPDATE `user` SET `status` = '$newstatus' WHERE id = '$userid'") <= 0) {
        $msg->value = 0;
        $msg->data = " You cannot update user. Please Try again.";
    } else {
        $msg->value = 1;
        $msg->data = "User updated successfully.";
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
    <title><?= $project ?> : Add User</title>
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
                                <a class="btn btn-social-icon btn-success pull-right" style="margin:5px" title="Add New User" data-toggle="modal" data-target="#modaladd"><i class="fa fa-plus"></i></a>
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
                                            <th class='text-center'>Update</th>
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
                            <h4 class="modal-title">Add New User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="addalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#addalertclass').hide()">×</button>
                                <p id="addmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Card Number</label>
                                <input type="text" class="form-control" placeholder="Enter Card Number" name="cardnumber" id="cardnumber" required pattern="[a-zA-Z0-9]+">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter RFID Number</label>
                                <input type="text" class="form-control" placeholder="Enter RFID Number" name="rfid" id="rfid" required pattern="[a-zA-Z0-9]+">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" placeholder="Enter email" name="email" id="email" required>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Address</label>
                                <textarea class="form-control" rows="3" placeholder="Enter Address" name="address" id="address" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Card Type</label>
                                <select class="form-control select2 select3 " style="width: 100%;" required name="type" id="type">
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
        <!-- End Add Officer user modal -->

        <!-- Edit User modal -->
        <form id="edituser" action="" method="post">
            <div class="modal fade" id="modaledit" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-red">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Update New User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="editalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#editalertclass').hide()">×</button>
                                <p id="editmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Card Number</label>
                                <input type="text" class="form-control" placeholder="Enter Card Number" name="editcardnumber" id="editcardnumber" required pattern="[a-zA-Z0-9]+" readonly>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter RFID Number</label>
                                <input type="text" class="form-control" placeholder="Enter RFID Number" name="editrfid" id="editrfid" required pattern="[a-zA-Z0-9]+">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Card Type</label>
                                <select class="form-control select2 select3 " style="width: 100%;" required name="edittype" id="edittype">
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer ">
                        <input type="hidden" name="id" id="editid">
                            <input type="hidden" name="Edit" value="Edit">
                            <button type="submit" name="Edit" value="Edit" id='Edit' class="btn btn-success">Update Me</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </form>
        <!-- End Add Officer user modal -->


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
                                '<td class="text-center">' + btnupdate + btndelete + '</td>' +
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

            $(document).on("click", ".edit-button", function(e) {
                $('#edituser')[0].reset();
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                $(".modal-body #editcardnumber").attr("value", $(this).data('cardnumber'));
                $(".modal-body #editrfid").attr("value", $(this).data('rfid'));
                $(".modal-body #edittype").val($(this).data('cardtype')).change();
                $("#editid").val($(this).data('editid'));
            });

            //edit user 
            $('#edituser').submit(function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#edituser').serialize(),
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