<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?= $title; ?></title>

    <!-- Custom fonts for this template-->
    <link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<?= base_url('assets/'); ?>css/sb-admin-2.min.css" rel="stylesheet">

</head>

<!-- Begin Page Content -->

<body>

    <!-- Page Heading -->
    <!-- Image and text -->
    <nav class="navbar navbar-light bg-primary justify-content-between">
        <a class="navbar-brand" href="">
            <h1 class="mx-auto my-2 my-sm-0 text-light">
                <i class="fas fa-book"></i>
                <?= $title ?>
            </h1>
        </a>
        <div>
            <a class="mx-4 my-2 my-sm-0 text-light h5" href="<?= base_url("auth/login") ?>">Login</a>
            <a class="mx-4 my-2 my-sm-0 text-light h5" href="<?= base_url("auth/registration") ?>">Registration</a>
        </div>
    </nav>

    <div class="container-fluid bg-light">
        <div class="d-flex justify-content-center">
            <h1 class="my-4">Welcome To Informatics Laboratory HRMS</h1>
        </div>


        <h1 class="my-4">Announcements</h1>

        <!-- LOOPING ANNOUNCEMENTS -->
        <ul class="list-style-none">
            <?php foreach ($announcements as $a) : ?>
                <li class="card my-4">
                    <div class="card-header d-flex no-block">
                        <i class="fa fa-bullhorn w-30px mx-3 my-auto"></i>
                        <h3 class="my-auto">
                            <?= $a['title'] ?>
                        </h3>
                    </div>
                    <div class="card-body">
                        <p class="card-title">
                            <?= date('d F Y', $a['date_created']) ?>
                        </p>
                        <p class="card-text">
                            <?= $a['announcement'] ?>
                        </p>
                    </div>
                </li>

            <?php endforeach; ?>
        </ul>

    </div>
    <!-- /.container-fluid -->


    <!-- Bootstrap core JavaScript-->
    <script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
    <script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script>

</body>

</html>