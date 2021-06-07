<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg">
            <?= $this->session->flashdata('message'); ?>

            <h5>Name : <?= $assigned_user['name'] ?></h5>
            <h5>Role : Student</h5>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Mata Kuliah</th>
                        <th scope="col">Role</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($mata_kuliah as $m) : ?>

                        <tr>
                            <th scope="row"><?= $i ?></th>
                            <td><?= $m['mata_kuliah']; ?></td>
                            <td>
                                <?php
                                if (count($assigned) >= $m['id']) {
                                    echo $assigned[$m['id'] - 1]['role'];
                                } else {
                                    echo "-";
                                }
                                ?>
                            </td>
                            <td>
                                <a href="<?= base_url('admin/assign/') . $assigned['user_assign.id']; ?>" class="badge badge-warning">assign</a>
                            </td>
                            <?php $i++ ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->