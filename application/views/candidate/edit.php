<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg-6">
            <form method="post" action="">

                <div class=" form-group">
                    <label for="name">Name:</label>
                    <input type="name" class="form-control form-control-user" id="name" name="name" value="<?= set_value("name", $user['name']); ?>">
                    <!-- check input error -->
                    <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <div class="form-group">
                    <label for="name">Email:</label>
                    <input type="email" class="form-control form-control-user" id="email" name="email" value="<?= set_value("email", $user['email']); ?>">
                    <!-- check input error -->
                    <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <button type="submit" class="btn btn-primary">
                    Edit Account
                </button>
            </form>

        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->