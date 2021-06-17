<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>
    <div class="row">
        <div class="col-lg">
            <?= $this->session->flashdata('message'); ?>
            <h4>Name : <?= $assigned_user['name'] ?></h4>
            <h4>Student ID : <?= $assigned_user['sid'] ?></h4>
            <?php
            // echo var_export($course);
            // die;
            ?>

            <div class="float-right mx-4 my-2">
                <a href="<?= base_url("admin/assign_user/") . $assigned_user['id'] ?>" class="btn btn-secondary">Back</a>
            </div>

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
                                $this->db->select('schedule.id');
                                $this->db->from('schedule');
                                $this->db->join('modul', 'schedule.modul_id = modul.id');
                                $this->db->join('course', 'modul.course_id = course.id');
                                $this->db->where('user_id', $assigned_user['id']);
                                $this->db->where('course_id', $c['id']);
                                $exist = $this->db->get()->row_array();
                                ?>

                                <?php if ($exist) : ?>
                                    <a href="<?= base_url("admin/delete_course/") . $assigned_user['id'] . "/" . $c['id'] ?>" class="btn btn-danger">Delete</a>
                                <?php else : ?>
                                    <a href="<?= base_url("admin/add_course/") . $assigned_user['id'] . "/" . $c['id'] ?>" class="btn btn-success">Assign</a>
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