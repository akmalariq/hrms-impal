<!-- Begin Page Content -->
<div class="container-fluid">

    <?php
    $users = $this->db->get("user")->result_array();
    $i = 0;
    foreach ($users as $u) {
        $id = $u['id'];
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
    }
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