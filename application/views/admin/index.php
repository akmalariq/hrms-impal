<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg-12">

            <form action="" method="post" class="form-inline">
                <div class="form-group mx-sm-3  mb-4">
                    <label for="keyword" class="mx-sm-3">Search :</label>
                    <input type="text" class="form-control col-xs-4" name="keyword" autofocus placeholder="keyword" autocomplete="off">
                </div>
                <button type="submit" name="cari" class="btn btn-primary mb-4">Cari</button>
            </form>

            <?= form_error('menu', '<div class="alert alert-danger" role="alert">', '</div>'); ?>
            <?= $this->session->flashdata('message'); ?>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Student ID</th>
                        <th scope="col">Class</th>
                        <th scope="col">Role</th>
                        <th scope="col">Created At</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($users as $u) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>

                            <td><?= $u['name']; ?></td>

                            <td><?= $u['email']; ?></td>

                            <td><?= $u['sid']; ?></td>

                            <td><?= $u['class']; ?></td>

                            <td>
                                <?php
                                $j = 0;
                                while ($u['role_id'] !=  $user_role[$j]['id']) {
                                    $j++;
                                }
                                echo $user_role[$j]['role'];
                                ?>
                            </td>

                            <td><?= date('d F Y', $u['date_created']) ?></td>

                            <td>
                                <a href="<?= base_url('admin/assign/') . $u['id']; ?>" class="badge badge-warning">assign</a>
                                <a href="<?= base_url("admin/edit/") . $u['id'] ?>" class="badge badge-success">edit</a>
                                <a href="<?= base_url("admin/delete/") . $u['id'] ?>" class="badge badge-danger">delete</a>
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