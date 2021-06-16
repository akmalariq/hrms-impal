<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg">
            <?= $this->session->flashdata('message'); ?>

            <h4>Name : <?= $assigned_user['name'] ?></h4>
            <h4>Class : <?= $assigned_user['class'] ?></h4>
            <h4>Student ID : <?= $assigned_user['sid'] ?></h4>
            <div class="float-right mx-4 my-2">
                <a href="<?= base_url("admin/add_assign/") . $assigned_user['id'] ?>" class="btn btn-primary">Assign</a>
                <a href="<?= base_url("admin/") ?>" class="btn btn-secondary">Back</a>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Role</th>
                        <th scope="col">Course</th>
                        <th scope="col">Modul</th>
                        <th scope="col">Date</th>
                        <th scope="col">Attendance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($schedule as $s) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>

                            <td><?= $s['role'] ?></td>
                            <td><?= $s['course'] ?></td>
                            <td><?= $s['modul'] ?></td>
                            <td><?= date('d F Y', $s['date']) ?></td>
                            <td><?= $s['attend'] ?></td>
                        </tr>
                        <?php $i++ ?>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->