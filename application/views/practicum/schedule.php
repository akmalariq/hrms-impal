<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- QUERY SCHEDULE -->


    <h3 class="float-right">Salary: <span><?= "Rp " . number_format($attendance["attend"] * 30000, 2, ',', '.') ?></span></h3>
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
                    <a class="btn btn-primary" href="<?= base_url('assistant/validateattendance/') . $s['modul_id'] ?>">
                        <i class="fas fa-fw fa-user-check"></i>
                        Validate Attendance
                    </a>
                    <a class="btn btn-secondary" href="<?= base_url('assistant/replacement') ?>">
                        <i class="fas fa-fw fa-people-arrows"></i>
                        Replace me
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