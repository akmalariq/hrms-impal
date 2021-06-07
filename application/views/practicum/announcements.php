<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- LOOPING SCHEDULE -->
    <?php foreach ($announcements as $a) : ?>
        <div class="card my-4">
            <div class="card-header">
                <?= $a['title'] ?>
            </div>
            <div class="card-body">
                <p class="card-text">
                    <?= date('d F Y', $a['date_created']) ?>
                </p>
                <h5 class="card-title">
                    <?= $a['announcement'] ?>
                </h5>
            </div>
        </div>

    <?php endforeach; ?>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->