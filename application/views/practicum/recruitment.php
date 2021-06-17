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
            <?php if ($recruitment) : ?>
                <h4 class="card-title">You have applied</h4>
            <?php endif; ?>

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

            <?php
            $cv = $this->db->get_where('document', ['user_id' => $user['id'], 'type' => 'cv'])->row_array();
            $ml = $this->db->get_where('document', ['user_id' => $user['id'], 'type' => 'ml'])->row_array();
            ?>

            <?php echo form_open_multipart('practicum/do_upload/cv'); ?>

            <!-- Curriculum Vitae -->

            <label for="cv">Curriculum Vitae:</label>
            <?php if ($this->db->get_where('document', ['user_id' => $user['id'], 'type' => 'cv'])->row_array()) : ?>
                <p>Uploaded: <?= $cv['file_name'] ?></p>
            <?php endif; ?>
            <?= $this->session->flashdata('message_cv') ?>
            <div class=" form-group">
                <input type="file" name="cv" size="20" />
            </div>

            <!-- Upload Button -->
            <input type="submit" value="Upload" />

            </form>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <?php echo form_open_multipart('practicum/do_upload/ml'); ?>

            <!-- Motivation Letter -->

            <label for="ml">Motivation Letter:</label>
            <?php if ($this->db->get_where('document', ['user_id' => $user['id'], 'type' => 'cv'])->row_array()) : ?>
                <p>Uploaded: <?= $ml['file_name'] ?></p>
            <?php endif; ?>
            <?= $this->session->flashdata('message_ml') ?>
            <div class=" form-group">
                <input type="file" name="ml" size="20" />
            </div>

            <!-- Upload Button -->
            <input type="submit" value="Upload" />

            </form>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <?php if (($recruitment['phase'] == 1) || (!$recruitment)) : ?>
                <form method="post" action="" id="recruitment">

                    <!-- USER ID -->
                    <input type="hidden" class="form-control form-control-user" id="user_id" name="user_id" value="<?= $user['id']; ?>">

                    <!-- COURSE ID -->
                    <div class="form-group">
                        <label for="course_id">Course:</label>
                        <select class="form-control" id="course_id" name="course_id" form="recruitment">
                            <?php if (!$recruitment) : ?>
                                <option value="" selected>Please Select Course</option>
                            <?php endif; ?>
                            <?php foreach ($course as $c) : ?>
                                <?php if ($recruitment) : ?>
                                    <?php if ($c['id'] == $recruitment['course_id']) : ?>
                                        <option value="<?= $c['id'] ?>" selected><?= $c['course'] ?></option>
                                    <?php else : ?>
                                        <option value="<?= $c['id'] ?>"><?= $c['course'] ?></option>
                                    <?php endif; ?>
                                <?php else : ?>
                                    <option value="<?= $c['id'] ?>"><?= $c['course'] ?></option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <!-- CV ID -->
                    <input type="hidden" class="form-control form-control-user" id="cv_id" name="cv_id" value="<?= $cv['id']; ?>">

                    <!-- ML ID -->
                    <input type="hidden" class="form-control form-control-user" id="ml_id" name="ml_id" value="<?= $ml['id']; ?>">

                    <!-- PHASE -->
                    <input type="hidden" class="form-control form-control-user" id="phase" name="phase" value="1">

                    <!-- DATE -->
                    <input type="hidden" class="form-control form-control-user" id="written_id" name="written_id" value="0">

                    <button type="submit" class="btn btn-primary">
                        Apply
                    </button>
                </form>
            <?php else : ?>
                <p class="card-text">Course: <?= $recruitment['course']; ?></p>
            <?php endif; ?>

        </div>
    </div>

    <div class="card my-5">
        <div class="card-body">
            <h4 class="card-title">2. Written Test</h4>
            <?php if ($recruitment['phase'] == 2) : ?>
                <h5>Congratulation you have passed the second phase, please select a date for the Interview</h5>

                <form method="post" action="" id="recruitment">

                    <!-- USER ID -->
                    <input type="hidden" class="form-control form-control-user" id="user_id" name="user_id" value="<?= $recruitment['user_id']; ?>">

                    <!-- COURSE ID -->
                    <input type="hidden" class="form-control form-control-user" id="course_id" name="course_id" value="<?= $recruitment['id']; ?>">

                    <!-- CV ID -->
                    <input type="hidden" class="form-control form-control-user" id="cv_id" name="cv_id" value="<?= $recruitment['cv_id']; ?>">

                    <!-- ML ID -->
                    <input type="hidden" class="form-control form-control-user" id="ml_id" name="ml_id" value="<?= $recruitment['ml_id']; ?>">

                    <!-- PHASE -->
                    <input type="hidden" class="form-control form-control-user" id="phase" name="phase" value="<?= $recruitment['phase']; ?>">

                    <!-- WRITEN DATE -->
                    <div class="form-group">
                        <label for="written_id">Date:</label>
                        <select class="form-control" id="written_id" name="written_id" form="recruitment">

                            <?php if ($recruitment['written_id'] == 0) : ?>
                                <option value="" selected>Please Select Date</option>
                            <?php endif; ?>

                            <?php foreach ($written_test_schedule as $d) : ?>
                                <?php if ($d['id'] != 0) : ?>

                                    <?php if ($recruitment['written_id'] != 0) : ?>

                                        <?php if ($d['id'] == $recruitment['written_id']) : ?>
                                            <option value="<?= $d['id'] ?>" selected><?= date('D, M j G:i:s', $d['date']) ?></option>

                                        <?php else : ?>
                                            <option value="<?= $d['id'] ?>"><?= date('D, M j G:i:s', $d['date']) ?></option>
                                        <?php endif; ?>

                                    <?php else : ?>
                                        <option value="<?= $d['id'] ?>"><?= $d['id'], date('D, M j G:i:s', $d['date']) ?></option>
                                    <?php endif; ?>
                                <?php endif; ?>

                            <?php endforeach; ?>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        Apply
                    </button>
                </form>
            <?php else : ?>
                <p class="card-text">Written Test: <?= date('D, M j G:i:s', $recruitment['written_date']); ?></p>
            <?php endif; ?>
        </div>
    </div>

    <div class="card my-5">
        <div class="card-body">
            <h4 class="card-title">3. Interview</h4>
            <?php if ($recruitment['phase'] == 3) : ?>
                <h5>Congratulation you have passed the second phase, please select a date for the Interview</h5>
                <form method="post" action="" id="recruitment">

                    <!-- USER ID -->
                    <input type="hidden" class="form-control form-control-user" id="user_id" name="user_id" value="<?= $recruitment['user_id']; ?>">

                    <!-- COURSE ID -->
                    <input type="hidden" class="form-control form-control-user" id="course_id" name="course_id" value="<?= $recruitment['id']; ?>">

                    <!-- CV ID -->
                    <input type="hidden" class="form-control form-control-user" id="cv_id" name="cv_id" value="<?= $recruitment['cv_id']; ?>">

                    <!-- ML ID -->
                    <input type="hidden" class="form-control form-control-user" id="ml_id" name="ml_id" value="<?= $recruitment['ml_id']; ?>">

                    <!-- PHASE -->
                    <input type="hidden" class="form-control form-control-user" id="phase" name="phase" value="<?= $recruitment['phase']; ?>">

                    <!-- WRITEN DATE -->
                    <input type="hidden" class="form-control form-control-user" id="written_id" name="written_id" value="<?= $recruitment['written_id']; ?>">

                    <!-- INTERVIEW DATE -->
                    <div class="form-group">
                        <label for="interview_id">Date:</label>
                        <select class="form-control" id="interview_id" name="interview_id" form="recruitment">

                            <?php if ($recruitment['interview_id'] == 0) : ?>
                                <option value="" selected>Please Select Date</option>
                            <?php endif; ?>

                            <?php foreach ($interview_schedule as $d) : ?>
                                <?php if ($d['id'] != 0) : ?>
                                    <?php if ($recruitment['interview_id'] != 0) : ?>

                                        <?php if ($d['id'] == $recruitment['interview_id']) : ?>
                                            <option value="<?= $d['id'] ?>" selected><?= date('D, M j G:i:s', $d['date']) ?></option>

                                        <?php else : ?>
                                            <option value="<?= $d['id'] ?>"><?= date('D, M j G:i:s', $d['date']) ?></option>
                                        <?php endif; ?>

                                    <?php else : ?>
                                        <option value="<?= $d['id'] ?>"><?= date('D, M j G:i:s', $d['date']) ?></option>
                                    <?php endif; ?>
                                <?php endif; ?>

                            <?php endforeach; ?>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        Apply
                    </button>
                </form>
            <?php else : ?>
                <p class="card-text">Interview: <?= date('D, M j G:i:s', $recruitment['interview_date']); ?></p>
            <?php endif; ?>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->