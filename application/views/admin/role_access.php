<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg-12">
            <?= $this->session->flashdata('message'); ?>

            <h5>Role : <?= $user['role']; ?></h5>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Menu</th>
                        <?php foreach ($role as $r) : ?>
                            <th scope="col"><?= $r['role'] ?></th>
                        <?php endforeach; ?>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($menu as $m) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>
                            <td><?= $m['menu']; ?></td>
                            <td>
                                <div class="form-check">
                                    <!-- Administrator -->
                                    <input class="form-check-input" type="checkbox" <?= check_access(1, $m['id']); ?> data-role="<?= 1; ?>" data-menu="<?= $m['id']; ?>">
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <!-- Practicum Assistant -->
                                    <input class="form-check-input" type="checkbox" <?= check_access(2, $m['id']); ?> data-role="<?= 2; ?>" data-menu="<?= $m['id']; ?>">
                                </div>
                            </td>
                            <td>
                                <div class="form-check">
                                    <!-- Candidate -->
                                    <input class="form-check-input" type="checkbox" <?= check_access(3, $m['id']); ?> data-role="<?= 3; ?>" data-menu="<?= $m['id']; ?>">
                                </div>
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