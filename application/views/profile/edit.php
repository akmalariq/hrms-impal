<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <div class="row">
        <div class="col-lg-6">
            <form method="post" action="">
                <!-- Name -->
                <label for="name">Name:</label>
                <div class=" form-group">
                    <input type="text" class="form-control form-control-user" id="name" name="name" value="<?= $user['name']; ?>">
                    <!-- check input error -->
                    <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Email -->
                <label for="email">Email:</label>
                <div class="form-group">
                    <input type="email" class="form-control form-control-user" id="email" name="email" value="<?= $user['email']; ?>">
                    <!-- check input error -->
                    <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Student ID -->
                <label for="sid">Student ID:</label>
                <div class=" form-group">
                    <input type="text" class="form-control form-control-user" id="sid" name="sid" value="<?= $user['sid']; ?>">
                    <!-- check input error -->
                    <?= form_error('sid', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>

                <!-- Class -->
                <div class="form-group">
                    <label for="class">Class:</label>
                    <select class="form-control" id="class" name="class">
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