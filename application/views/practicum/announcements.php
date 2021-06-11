<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- LOOPING SCHEDULE -->
    <ul class="list-style-none">
        <?php foreach ($announcements as $a) : ?>
            <li class="card my-2">
                <div class="card-header d-flex no-block">
                    <i class="fa fa-bullhorn w-30px mx-3 my-auto"></i>
                    <h3 class="my-auto">
                        <?= $a['title'] ?>
                    </h3>
                    <?php if (($user['role_id'] == 1) || ($user['role_id'] == 3)) : ?>
                        <a class="btn btn-primary mx-2" href="<?= base_url("admin/announcementsedit/") . $a['id'] ?>" role="button">Edit</a>
                    <?php endif; ?>
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

</div>
<!-- End of Main Content -->