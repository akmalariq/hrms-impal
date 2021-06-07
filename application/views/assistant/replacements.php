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
        <div class="card my-4">
            <div class="card-header">
                <?= $m['mata_kuliah'] ?>
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