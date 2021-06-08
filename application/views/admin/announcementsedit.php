<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>
    <div class="row">
        <div class="col-lg-8">
            <form method="post" action="">

                <div class=" form-group">
                    <label for="name">Title:</label>
                    <input type="text" class="form-control form-control-user" id="title" name="title" value="<?= set_value("title", $announcements['title']); ?>">
                </div>
                <div class="form-group">
                    <label for="name">Announcement:</label>
                    <textarea class="form-control" id="announcement" rows="5" name="announcement"><?= $announcements['announcement'] ?></textarea>
                </div>
                <button type="submit" class="btn btn-primary mx-1">
                    Edit
                </button>
                <a href="<?= base_url("admin/announcementsdelete/") . $announcements['id'] ?>" class="btn btn-danger mx-1">Delete</a>
                <a href="<?= base_url("practicum/announcements") ?>" class="btn btn-warning mx-1">Cancel</a>


            </form>

        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->