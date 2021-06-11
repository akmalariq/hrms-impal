<!-- Begin Page Content -->
<div class="container-fluid">

    <?php
    // $moduls = $this->db->get("modul")->result_array();
    // $i = 1;
    // foreach ($moduls as $m) {
    //     if (($i > 12) && ($i <= 24)) {
    //         $this->db->set('course_id', 2);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 24) && ($i <= 36)) {
    //         $this->db->set('course_id', 3);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 36) && ($i <= 48)) {
    //         $this->db->set('course_id', 4);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 48) && ($i <= 60)) {
    //         $this->db->set('course_id', 5);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 60) && ($i <= 72)) {
    //         $this->db->set('course_id', 6);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 72) && ($i <= 84)) {
    //         $this->db->set('course_id', 7);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 84) && ($i <= 96)) {
    //         $this->db->set('course_id', 8);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 96) && ($i <= 108)) {
    //         $this->db->set('course_id', 9);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 108) && ($i <= 120)) {
    //         $this->db->set('course_id', 10);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 120) && ($i <= 132)) {
    //         $this->db->set('course_id', 11);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     } elseif (($i > 132) && ($i <= 144)) {
    //         $this->db->set('course_id', 12);
    //         $this->db->where('id', $m['id']);
    //         $this->db->update('modul');
    //     }

    //     $i++;
    // }

    // $schedules = $this->db->get("schedule")->result_array();
    // for ($i = 2; $i <= 12; $i++) {
    //     $data = [
    //         "user_id" => 1,
    //         "role_id" => 3,
    //         "modul_id" => $i,
    //         "date" => 0,
    //         "complain" => "",
    //         "attend" => 0,
    //     ];
    //     $this->db->insert('schedule', $data);
    // }


    // $i = 3;
    // foreach ($schedules as $s) {



    // $id = $u['id'];
    // $name = $u['name'];
    // $email = $u['email'];
    // $sid = $u['sid'];
    // $image = $u['image'];
    // $password = $u['password'];
    // $role_id = $u['role_id'];
    // $is_active = $u['is_active'];
    // $date_created = $u['date_created'];

    // echo $id, PHP_EOL;
    // echo $name, PHP_EOL;
    // echo $email, PHP_EOL;
    // echo $sid, PHP_EOL;
    // echo $image, PHP_EOL;
    // echo $password, PHP_EOL;
    // echo $role_id, PHP_EOL;
    // echo $is_active, PHP_EOL;
    // echo $date_created, PHP_EOL;


    // if ($i < 10) {
    //     $sid = "130117000" . $i;
    // } elseif ($i < 100) {
    //     $sid = "13011700" . $i;
    // } elseif ($i < 1000) {
    //     $sid = "1301170" . $i;
    // } else {
    //     $sid = "130117" . $i;
    // }
    // $data = [
    // "id" => $id,
    // "name" => $name,
    // "email" => $email,
    // "sid" => $sid,
    // "image" => $image,
    // "password" => $password,
    // "role_id" => $role_id,
    // "is_active" => $is_active,
    // "date_created" => $date_created,
    // ];
    // $i++;
    // $this->db->where('id', $id);
    // $this->db->update('user', $data);
    // }
    die;
    ?>
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>

    <?= $this->session->flashdata('message') ?>

    <?php
    $user_id = $this->session->userdata('id');
    $querySchedule = "SELECT    `id`, `mata_kuliah_id`, `modul`, `date`
                        FROM    `modul`
        ";
    $mata_kuliah = $this->db->query($querySchedule)->result_array();

    ?>

    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">id</th>
                <th scope="col">mata_kuliah_id</th>
                <th scope="col">modul</th>
                <th scope="col">date</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 1 ?>
            <?php foreach ($mata_kuliah as $m) : ?>
                <tr>
                    <th scope="row"><?= $i ?></th>

                    <td><?= $m['id']; ?></td>

                    <td><?= $m['mata_kuliah_id']; ?></td>

                    <td><?= $m['modul']; ?></td>

                    <td><?= date('d F Y', $m['date']) ?></td>
                </tr>
                <?php $i++ ?>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->