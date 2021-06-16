<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="float-right mx-4 my-2">
        <a href="<?= base_url("practicum/recruitment") ?>" class="btn btn-primary">Back</a>
    </div>

    <div class="row">
        <div class="col-lg-6">

            <form method="post" action="">
                <!-- Name -->
                <label for="name">Name:</label>
                <div class=" form-group">
                    <input type="text" class="form-control form-control-user" id="name" name="name" value="<?= $user['name']; ?>" readonly>
                    <!-- check input error -->
                    <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Email -->
                <label for="email">Email:</label>
                <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="email" name="email" value="<?= $user['email']; ?>" readonly>
                    <!-- check input error -->
                    <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Student ID -->
                <label for="sid">Student ID:</label>
                <div class=" form-group">
                    <input type="text" class="form-control form-control-user" id="sid" name="sid" value="<?= $user['sid']; ?>" readonly>
                    <!-- check input error -->
                    <?= form_error('sid', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Class -->
                <div class="form-group">
                    <label for="class">Class:</label>
                    <select class="form-control" id="class" name="class" readonly>
                        <?php foreach ($class as $c) : ?>
                            <?php if ($c === $user['class_id']) : ?>
                                <option selected value="<?= $c['id'] ?>"><?= $c['class'] ?></option>
                            <?php else : ?>
                                <option value="<?= $c['id'] ?>"><?= $c['class'] ?></option>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </select>
                    <!-- check input error -->
                    <?= form_error('class', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <a href="<?= base_url('profile/edit') ?>" class="btn btn-primary">
                    Edit Account
                </a>
            </form>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <?php echo form_open_multipart('practicum/do_upload'); ?>

            <!-- Curriculum Vitae -->
            <label for="cv">Curriculum Vitae:</label>
            <?= $this->session->flashdata('message_cv') ?>

            <div class=" form-group">
                <input type="file" name="cv" size="20" />
            </div>

            <?= $this->session->flashdata('message_cv') ?>

            <!-- Motivation Letter -->
            <label for="ml">Motivation Letter:</label>
            <?= $this->session->flashdata('message_ml') ?>

            <div class=" form-group">
                <input type="file" name="ml" size="20" />
            </div>

            <?= $this->session->flashdata('message_ml') ?>

            <!-- Upload Button -->
            <input type="submit" value="Upload" />


            </form>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->