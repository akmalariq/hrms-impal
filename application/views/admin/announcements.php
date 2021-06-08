<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?= $title ?></h1>
    <div class="row">
        <div class="col-lg-6">
            <form method="post" action="">

                <div class=" form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control form-control-user" id="title" name="title">
                </div>

                <div class="form-group">
                    <label for="announcement">Announcement:</label>
                    <textarea class="form-control" id="announcement" rows="5" name="announcement"></textarea>
                </div>

                <button type="submit" class="btn btn-primary">
                    Create
                </button>

            </form>

        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->