<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <div class="col-md-4">
        <img src="<?= base_url('assets/img/') . $user['image'] ?>" style="max-width:300px;">
        <div class="mt-5">
            <h2>Name: <?= $user['name'] ?></h2>
            <br>
            <h2>Email: <?= $user['email'] ?></h2>
            <br>
            <h2>Student ID: <?= $user['sid'] ?></h2>
            <br>
            <h2>Class: <?= $user['class'] ?></h2>
            <br>
            <h2><small class="text-muted">Member since: <?= date('d F Y', $user['date_created']) ?></small></h2>
        </div>
    </div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->