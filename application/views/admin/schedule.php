<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>
    <a href="<?= base_url("admin/addschedule") ?>" class="btn btn-primary float-right mx-4 my-2">Add</a>


    <?= $this->session->flashdata('message') ?>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Student ID</th>
                <th scope="col">Class</th>
                <th scope="col">Role</th>
                <th scope="col">Course</th>
                <th scope="col">Modul</th>
                <th scope="col">Date</th>
                <th scope="col">Attendance</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 1 ?>
            <?php foreach ($schedule as $s) : ?>
                <tr>
                    <th scope="row"><?= $i ?></th>

                    <td><?= $this->db->get_where("user", ["id" => $s['user_id']])->row_array()["name"]; ?></td>

                    <td><?= $this->db->get_where("user", ["id" => $s['user_id']])->row_array()["sid"]; ?></td>

                    <td><?= $this->db->get_where("user", ["id" => $s['user_id']])->row_array()["class"]; ?></td>

                    <td><?= $this->db->get_where("user_role", ["id" => $s['role_id']])->row_array()["role"]; ?></td>

                    <td><?= $this->db->get_where("modul", ["id" => $s['modul_id']])->row_array()["mata_kuliah"]; ?></td>

                    <td><?= $this->db->get_where("modul", ["id" => $s['modul_id']])->row_array()["modul"]; ?></td>

                    <td><?= date('d F Y', $s['date']) ?></td>

                    <td>
                        <?= $s['attend'] ?>
                    </td>
                </tr>
                <?php $i++ ?>
            <?php endforeach; ?>
        </tbody>
    </table>
    <h1>
        <?php
        // echo 'user', '<pre>' . var_export($user, true) . '</pre>';
        // echo 'course', '<pre>' . var_export($course, true) . '</pre>';
        // echo 'modul', '<pre>' . var_export($modul, true) . '</pre>';
        // echo 'schedule', '<pre>' . var_export($schedule, true) . '</pre>';
        // echo 'assistant_schedule', '<pre>' . var_export($assistant_schedule, true) . '</pre>';
        // echo 'schedule', '<pre>' . var_export($this->db->get_where('course', ['id' => ])->row_array(), true) . '</pre>';

        // foreach ($schedule as $s) {
        // echo 'schedule', '<pre>' . var_export($s, true) . '</pre>';
        // echo 'schedule', '<pre>' . var_export($this->db->get_where();, true) . '</pre>';
        // }
        // die;
        ?>
    </h1>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->