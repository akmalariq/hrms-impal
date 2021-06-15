<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <div class="row">
        <div class="col-lg-6">
            <form method="post" action="">

                <div class=" form-group">
                    <label for="old_password">Old Password:</label>
                    <input type="password" class="form-control form-control-user" id="old_password" name="old_password">
                    <!-- check input error -->
                    <?= form_error('old_password', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <label for="new_password">New Password:</label>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Password">
                        <!-- check input error -->
                        <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="col-sm-6">
                        <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Repeat Password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    Change Password
                </button>
            </form>

        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->