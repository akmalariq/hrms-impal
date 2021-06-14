<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg">

            <form action="" method="post" class="form-inline">
                <div class="form-group mx-sm-3  mb-4">
                    <label for="keyword" class="mx-sm-3">Search :</label>
                    <input type="text" class="form-control col-xs-4" name="keyword" autofocus placeholder="keyword" autocomplete="off">
                </div>
                <button type="submit" name="cari" class="btn btn-primary mb-4">Cari</button>
            </form>

            <?= $this->session->flashdata('message'); ?>

            <h5>Course : <?= $modul['course'] ?></h5>
            <h5>Modul : <?= $modul['modul'] ?></h5>

            <div class="float-right mx-4 my-2">
                <a href="<?= base_url("assistant") ?>" class="btn btn-secondary">Back</a>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Student ID</th>
                        <th scope="col">Class</th>
                        <th scope="col">Date</th>
                        <th scope="col">Attendance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($schedule as $s) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>

                            <td><?= $s['name'] ?></td>
                            <td><?= $s['sid'] ?></td>
                            <td><?= $s['class'] ?></td>
                            <td><?= date('d F Y', $s['date']) ?></td>
                            <td>
                                <?= $s['schedule_id'] ?>
                                <?php if ($s['attend']) : ?>
                                    <a href="<?= base_url("assistant/attend/") . $s['schedule_id'] . '/' . $s['modul_id'] . '/' . $s['attend'] ?>" class="btn btn-danger">Absent</a>
                                <?php else : ?>
                                    <a href="<?= base_url("assistant/attend/") . $s['schedule_id'] . '/' . $s['modul_id'] . '/' . $s['attend'] ?>" class="btn btn-success">Attend</a>
                                <?php endif; ?>

                            </td>
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