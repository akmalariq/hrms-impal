<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- QUERY SCHEDULE -->
    <?php
    $user_id = $this->session->userdata('id');
    $querySchedule = "SELECT    COUNT(attendance) AS attendance
                        FROM    practicum_attendance
                       WHERE    user_id = $user_id
                         AND    attendance = 1
        ";
    $attendance = $this->db->query($querySchedule)->row_array();

    ?>

    <h3 class="float-right">Salary: <span><?= "Rp " . number_format($attendance["attendance"] * 30000, 2, ',', '.') ?></span></h3>
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- QUERY SCHEDULE -->
    <?php
    $user_id = $this->session->userdata('id');
    $querySchedule = "SELECT    `practicum_mata_kuliah`.`id`, `mata_kuliah`, `modul`, `date`, `attendance`
                        FROM    `practicum_mata_kuliah` JOIN `practicum_modul`
                          ON    `practicum_mata_kuliah`.`id` = `practicum_modul`.`mata_kuliah_id`
                        JOIN    `assistant_attendance`
                          ON    `assistant_attendance`.`modul_id` = `practicum_modul`.`id`
                       WHERE    `assistant_attendance`.`user_id` = $user_id
                    ORDER BY    `date` ASC
        ";
    $mata_kuliah = $this->db->query($querySchedule)->result_array();
    ?>

    <!-- LOOPING SCHEDULE -->
    <?php foreach ($mata_kuliah as $m) : ?>
        <?php
        $color = "bg-light";
        if ($m['date'] < time()) {
            if ($m["attendance"] == 1) {
                $color = "text-white bg-success";
            } else {
                $color = "text-white bg-danger";
            }
        }
        ?>
        <div class="card my-4">
            <div class="card-header <?= $color ?>">
                <h4>
                    <?= $m['mata_kuliah'] ?>
                </h4>
                <div class="float-right">
                    <a class="btn btn-primary" href="<?= base_url('assistant/attendance/') . $m['id'] ?>">
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
                    <?= $m['modul'] ?>
                </h5>
                <p class="card-text">
                    <?= date('d F Y', $m['date']) ?>
                </p>
                <p class="card-text">
                    <?php
                    if ($m['attendance'] == 0) {
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