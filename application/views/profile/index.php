<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>


    <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="<?= base_url('assets/img/') . $user['image'] ?>" class="card-img" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">Name: <?= $user['name'] ?></h5>
                    <p class="card-text">Email: <?= $user['email'] ?></p>
                    <p class="card-text">Student ID: <?= $user['sid'] ?></p>
                    <p class="card-text">Class: <?= $user['class'] ?></p>
                    <p class="card-text"><small class="text-muted">Member since: <?= date('d F Y', $user['date_created']) ?></small></p>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->