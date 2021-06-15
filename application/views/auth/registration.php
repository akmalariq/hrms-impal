<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-7 mx-auto">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg">
                    <div class="p-5">
                        <div class="text-center">
                            <a class="text-primary h1" href="<?= base_url("auth") ?>">
                                <i class="fas fa-book"></i>
                                HRMS
                            </a>
                            <h1 class="h4 text-gray-900 mb-4">Create Account!</h1>
                        </div>
                        <form class="user" method="post" action="<?= base_url('auth/registration'); ?>">
                            <!-- Name -->
                            <label for="name">Name:</label>
                            <div class=" form-group">
                                <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="John Doe" value="<?= set_value("name"); ?>">
                                <!-- check input error -->
                                <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>

                            <!-- Email -->
                            <label for="email">Email:</label>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="Email Address" value="<?= set_value("email"); ?>">
                                <!-- check input error -->
                                <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>

                            <!-- Student ID -->
                            <label for="sid">Student ID:</label>
                            <div class=" form-group">
                                <input type="text" class="form-control form-control-user" id="sid" name="sid" placeholder="1301171234" value="<?= set_value("sid"); ?>">
                                <!-- check input error -->
                                <?= form_error('sid', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>

                            <!-- Class -->
                            <div class="form-group">
                                <label for="class">Class:</label>
                                <select class="form-control" id="class" name="class">
                                    <option value="">Please Select Class</option>
                                    <?php foreach ($class as $c) : ?>
                                        <option value="<?= $c['id'] ?>"><?= $c['class'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?= form_error('class', '<small class="text-danger pl-3">', '</small>'); ?>
                            </div>

                            <!-- Password -->
                            <label for="password">Password:</label>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Password">
                                    <!-- check input error -->
                                    <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Repeat Password">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                Register Account
                            </button>
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.html">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="<?= base_url('auth/login') ?>">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>