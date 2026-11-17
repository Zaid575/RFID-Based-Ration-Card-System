<?php

include("sessioncheck.php");

$addedby = $_SESSION['userid'];
date_default_timezone_set('Asia/Kolkata');

if (isset($_POST['data'])) {
  $data = new \stdClass();
  $result = mysqli_query($connection, "SET NAMES utf8");
  $result = mysqli_query($connection, "select count(*) as admincount from admin where status != 0");
  $data->admincount = mysqli_fetch_all($result, MYSQLI_ASSOC);

  $result = mysqli_query($connection, "select count(*) as cardcount from cardtype");
  $data->cardcount = mysqli_fetch_all($result, MYSQLI_ASSOC);
  
  $result = mysqli_query($connection, "select count(*) as districtcount from district where status = 1");
  $data->districtcount = mysqli_fetch_all($result, MYSQLI_ASSOC);
  
  $result = mysqli_query($connection, "select count(*) as familycount from user");
  $data->familycount = mysqli_fetch_all($result, MYSQLI_ASSOC);

  $result = mysqli_query($connection, "select count(*) as familymembers from familymember WHERE status = 1");
  $data->familymembers = mysqli_fetch_all($result, MYSQLI_ASSOC);

  $result = mysqli_query($connection, "select count(*) as shopkeeper from shopkeeper where status=1");
  $data->shopkeeper = mysqli_fetch_all($result, MYSQLI_ASSOC);

  echo json_encode($data);
  exit();
}

?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?= $project ?> : Dashboard</title>
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
  <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- daterange picker -->
  <link rel="stylesheet" href="../../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="../../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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
          <li class="active">Dashboard</li>
        </ol>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <h4 id="admincount">00</h4>

                <p>Total Admin</p>
              </div>
              <div class="icon">
                <i class="fa fa-user"></i>
              </div>
              <a href="rptadmin.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <!-- ./col -->
          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
              <div class="inner">
                <h4 id="districtcount">00</h4>

                <p>Total district</p>
              </div>
              <div class="icon">
                <i class="fa fa-institution"></i>
              </div>
              <a href="rptdistrict.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-purple">
              <div class="inner">
                <h4 id="shopkeeper">00</h4>

                <p>Total shopkeeper</p>
              </div>
              <div class="icon">
                <i class="fa fa-shopping-cart"></i>
              </div>
              <a href="rptshop.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
                <h4 id="cardcount">00</h4>

                <p>Total card type</p>
              </div>
              <div class="icon">
                <i class="fa fa-credit-card"></i>
              </div>
              <a href="rptcards.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
              <div class="inner">
                <h4 id="familycount">00</h4>

                <p>Total families</p>
              </div>
              <div class="icon">
                <i class="fa fa-home"></i>
              </div>
              <a href="rptuser.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-maroon">
              <div class="inner">
                <h4 id="familymembers">00</h4>

                <p>Total family members</p>
              </div>
              <div class="icon">
                <i class="fa fa-users"></i>
              </div>
              <a href="rptfamilymembers.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
        </div>        
      </section>

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
  <!-- date-range-picker -->
  <script src="../../bower_components/moment/min/moment.min.js"></script>
  <script src="../../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- bootstrap datepicker -->
  <script src="../../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script>
    $(document).ready(function() {
      $('.sidebar-menu').tree()

      //display data card
      function tabledata() {
        $.ajax({
          url: $(location).attr('href'),
          type: 'POST',
          data: {
            'data': 'data'
          },
          success: function(response) {
            // console.log(response); 
            var returnedData = JSON.parse(response);
            console.log(returnedData);
            $('#admincount').text(returnedData['admincount'][0]['admincount']);
            $('#districtcount').text(returnedData['districtcount'][0]['districtcount']);
            $('#cardcount').text(returnedData['cardcount'][0]['cardcount']);
            $('#shopkeeper').text(returnedData['shopkeeper'][0]['shopkeeper']);
            $('#familycount').text(returnedData['familycount'][0]['familycount']);
            $('#familymembers').text(returnedData['familymembers'][0]['familymembers']);

          }
        });
      }

      tabledata();
    })
  </script>
</body>

</html>