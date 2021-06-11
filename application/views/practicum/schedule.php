<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- QUERY SCHEDULE -->


    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- LOOPING SCHEDULE -->
    <?php foreach ($schedule as $s) : ?>
        <?php
        $color = "bg-light";
        if ($s['date'] < time()) {
            if ($s["attend"] == 1) {
                $color = "text-white bg-success";
            } else {
                $color = "text-white bg-danger";
            }
        }
        ?>
        <div class="card my-4">
            <div class="card-header <?= $color ?>">
                <h4>
                    <?= $s['course'] ?>
                </h4>
                <div class="float-right">
                    <a class="btn btn-warning" href="<?= base_url('practicum/complaints') ?>">
                        <i class="fas fa-fw fa-exclamation-circle"></i>
                        Complain
                    </a>
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    <?= $s['modul'] ?>
                </h5>
                <p class="card-text">
                    <?= date('d F Y', $s['date']) ?>
                </p>
                <p class="card-text">
                    <?php
                    if ($s['attend'] == 0) {
                        echo "Absent";
                    } else {
                        echo "Present";
                    }
                    ?>

                </p>
            </div>
        </div>

    <?php endforeach; ?>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->