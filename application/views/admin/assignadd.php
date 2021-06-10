<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>
    <div class="row">
        <div class="col-lg">
            <?= $this->session->flashdata('message'); ?>
            <h4>Name : <?= $assigned_user['name'] ?></h4>
            <?php
            // echo var_export($course);
            // die;
            ?>

            <div class="float-right mx-4 my-2">
                <a href="<?= base_url("admin/assign/") . $assigned_user['id'] ?>" class="btn btn-secondary">Back</a>
            </div>

            <h5>Student</h5>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Course</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($course as $c) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>

                            <td><?= $c['course']; ?></td>
                            <td>
                                <?php
                                $this->db->select('schedule.role_id, course');
                                $this->db->from('user');
                                $this->db->join('schedule', 'user.id = schedule.user_id');
                                $this->db->join('user_role', 'schedule.role_id = user_role.id');
                                $this->db->join('modul', 'schedule.modul_id = modul.id');
                                $this->db->join('course', 'modul.course_id = course.id');
                                $this->db->where('user_id', $assigned_user['id']);
                                $this->db->where('course_id', $c['id']);
                                $this->db->where('schedule.role_id', 2);
                                $student = $this->db->get()->row_array();

                                $this->db->select('schedule.role_id, course');
                                $this->db->from('user');
                                $this->db->join('schedule', 'user.id = schedule.user_id');
                                $this->db->join('user_role', 'schedule.role_id = user_role.id');
                                $this->db->join('modul', 'schedule.modul_id = modul.id');
                                $this->db->join('course', 'modul.course_id = course.id');
                                $this->db->where('user_id', $assigned_user['id']);
                                $this->db->where('course_id', $c['id']);
                                $this->db->where('schedule.role_id', 3);
                                $assistant = $this->db->get()->row_array();

                                // echo var_export($student);
                                // die;
                                ?>
                                <?php if ($student || $assistant) : ?>
                                    <?php if ($student && $assistant) : ?>
                                        <a href="<?= base_url("admin/deletecourse/") . $assigned_user['id'] . "/" . 2 . "/" . $c['id'] . "/" . 2 ?>" class="btn btn-danger">Student</a>
                                        <a href="<?= base_url("admin/deletecourse/") . $assigned_user['id'] . "/" . 3 . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-danger">Assistant</a>
                                    <?php elseif ($student) : ?>
                                        <a href="<?= base_url("admin/deletecourse/") . $assigned_user['id'] . "/" . 2 . "/" . $c['id'] . "/" . 2 ?>" class="btn btn-danger">Student</a>
                                        <a href="<?= base_url("admin/addcourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-success">Assistant</a>
                                    <?php elseif ($assistant) : ?>
                                        <a href="<?= base_url("admin/addcourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 2 ?>" class="btn btn-success">Student</a>
                                        <a href="<?= base_url("admin/deletecourse/") . $assigned_user['id'] . "/" . 3 . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-danger">Assistant</a>
                                    <?php endif; ?>
                                <?php else : ?>
                                    <a href="<?= base_url("admin/addcourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 2 ?>" class="btn btn-success">Student</a>
                                    <a href="<?= base_url("admin/addcourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-success">Assistant</a>
                                <?php endif; ?>
                            </td>
                        </tr>
                        <?php $i++ ?>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h5>Assistant</h5>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Course</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1 ?>
                    <?php foreach ($course as $c) : ?>
                        <tr>
                            <th scope="row"><?= $i ?></th>

                            <td><?= $c['course']; ?></td>
                            <td>
                                <?php $found = array_search($c['id'], array_column($schedule, 'id')); ?>
                                <?php if ($found === 0 || $found) : ?>
                                    <a href="<?= base_url("admin/deletecourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-danger">Delete</a>
                                <?php else : ?>
                                    <a href="<?= base_url("admin/addcourse/") . $assigned_user['id'] . "/" . $c['id'] . "/" . 3 ?>" class="btn btn-success">Add</a>
                                <?php endif; ?>
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