<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg-12">
            <?= form_error('menu', '<div class="alert alert-danger" role="alert">', '</div>'); ?>
            <?= $this->session->flashdata('message'); ?>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
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

                            <?php if ($u['role_id'] == 1) : ?>
                                <td>Admin</td>
                            <?php elseif ($u['role_id'] == 2) : ?>
                                <td>Member</td>
                            <?php endif; ?>

                            <td><?= date('d F Y', $u['date_created']) ?></td>

                            <td>
                                <a href="<?= base_url("admin/edit/") . "?id=" . $u['id'] ?>" class="badge badge-success">edit</a>
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