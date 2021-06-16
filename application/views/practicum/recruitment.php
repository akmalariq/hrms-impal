<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <div class="card my-5">
        <div class="card-body">
            <h4 class="card-title">1. Upload Document</h4>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Name -->
            <p class="card-text">Name: <?= $user['name']; ?></p>

            <!-- Email -->
            <p class="card-text">Email: <?= $user['email']; ?></p>

            <!-- Student ID -->
            <p class="card-text">Student ID: <?= $user['sid']; ?></p>

            <!-- Class -->
            <p class="card-text">Class: <?= $user['class']; ?></p>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <?php echo form_open_multipart('practicum/do_upload'); ?>

            <!-- Curriculum Vitae -->

            <label for="cv">Curriculum Vitae:</label>
            <?= $this->session->flashdata('message_cv') ?>
            <div class=" form-group">
                <input type="file" name="cv" size="20" />
            </div>

            <p>File Format CV: Name_StudentID_CV</p>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Motivation Letter -->

            <label for="ml">Motivation Letter:</label>
            <?= $this->session->flashdata('message_ml') ?>
            <div class=" form-group">
                <input type="file" name="ml" size="20" />
            </div>

            <p>File Format Motivation Letter: Name_StudentID_ML</p>

            <!-- Upload Button -->
            <input type="submit" value="Upload" />

            </form>
        </div>
    </div>

    <div class="card my-5">
        <div class="card-body">
            <h4 class="card-title">2. Written Test</h4>
            <p class="card-text">Date: </p>
            <p class="card-text">Passed</p>
        </div>
    </div>

    <div class="card my-5">
        <div class="card-body">
            <h5 class="card-title">3. Interview</h5>
            <p class="card-text">Date: </p>
            <p class="card-text">Passed</p>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->