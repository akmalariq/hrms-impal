<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

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

    <h1><?= "Rp " . number_format($attendance["attendance"] * 30000, 2, ',', '.') ?></h1>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->