<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     *	- or -
     * 		http://example.com/index.php/welcome/index
     *	- or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */

    // Call View Function to show Login Page
    public function index()
    {
        // Checks if there is a live session if there is one, redirect to controllers/user
        if ($this->session->userdata('email')) {
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } else {
                redirect('profile');
            }
        } else {
            $this->db->select('*');
            $this->db->from('announcements');
            $this->db->order_by('date_created', 'desc');
            $data['announcements'] = $this->db->get()->result_array();


            $data['title'] = "HRMS";

            $this->load->view('auth/landing_page', $data);
        }
    }

    public function login()
    {
        // Sets rules from form validation

        // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        // Sets rules for password {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('password', 'Password', 'trim|required');

        // Checks if form_validation has not run, shows login page. Else run _login funtion
        if ($this->form_validation->run() == false) {
            // Title
            $data['title'] = "HRMS";

            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/login');
            $this->load->view('templates/auth_footer');
        } else {
            // Validasi Login private function
            $this->_login();
        }
    }


    private function _login()
    {
        // Get the inputs from form
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        // Get user by email
        $user = $this->db->get_where(
            'user',
            ['email' => $email]
        )->row_array();

        // Checks if user exist. Else show warning
        if ($user) {
            // Checks if user is active (active user means they already validate their emails, it is still done manually). Else show warning
            if ($user['is_active'] == 1) {
                // Verify is the password correct. Else show warning
                if (password_verify($password, $user['password'])) {
                    // Store email and role to array data
                    $data = [
                        'id' => $user['id'],
                        'email' => $user['email'],
                        'role_id' => $user['role_id']
                    ];
                    // Store data to session
                    $this->session->set_userdata($data);

                    // Redirects according to user's role
                    if ($user['role_id'] == 1) {
                        redirect('admin');
                    } else {
                        redirect('profile');
                    }
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Wrong password!</div>');
                    redirect('auth/login');
                }
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email has not been activated!</div>');
                redirect('auth/login');
            }
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email is not registered!</div>');
            redirect('auth/login');
        }
    }

    // Call View Function to show Registration Page from (views/auth/login)
    public function registration()
    {
        // get class table from database
        $data['class'] = $this->db->get("class")->result_array();

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for NAME {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('name', 'Name', 'required|trim');

        // Sets rules for EMAIL {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
            // Sets unique warning
            'is_unique' => "Email has already been registered"
        ]);

        // Sets rules for STUDENT ID {trim: to remove trailing whitespace, required: the field cannot be empty, is_unique from table: user cols: sid}
        $this->form_validation->set_rules('sid', 'Student ID', 'required|trim|numeric|exact_length[10]|is_unique[user.sid]', [
            // Sets unique warning
            'numeric' => "Student ID must be numeric",
            'exact_length' => "Student ID must be 10 digits",
            'is_unique' => "Student ID has already been registered",
        ]);

        // Sets rules for CLASS ID {required: the field cannot be empty}
        $this->form_validation->set_rules('class_id', 'Class', 'required');

        // Sets rules for PASSWORD1 {trim: to remove trailing whitespace, required: the field cannot be empty, min_lenth[3]: minimum strings of 3, matches[password2]: password1 needs to match password2}
        $this->form_validation->set_rules('password1', 'Password1', 'required|trim|min_length[3]|matches[password2]', [
            // Sets unique warning
            'matches' => "Password didn't match!",
            'min_length' => "Password too short!"
        ]);

        // Sets rules for PASSWORD2 {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('password2', 'Password2', 'required|trim');

        // Checks if form_validation has not run, shows login page. Else get input form
        if ($this->form_validation->run() == false) {

            $data['title'] = "Sistem Registration";

            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/registration');
            $this->load->view('templates/auth_footer');
        } else {
            $email = $this->input->post('email', true);
            $data = [
                // name is filtered through XSS filter and htmlspecialchars
                'name' => htmlspecialchars($this->input->post('name', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'email' => htmlspecialchars($email),

                // student id is filtered through XSS filter and htmlspecialchars
                'sid' => htmlspecialchars($this->input->post('sid', true)),

                // class is filtered through XSS filter and htmlspecialchars
                'class_id' => htmlspecialchars($this->input->post('class_id', true)),

                // image use default until until further function is implemented (user can upload their own image)
                'image' => "default.jpg",

                // password is hashed
                'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),

                // role_id is default to 3 (candidate), for a user to be an admin it needes to be referred by other admins
                'role_id' => 3,

                // is_active is default to 1 (active) until further function is implemented (user can authenticate their own email)
                'is_active' => 0,

                // date is automatically added
                'date_created' => time()

            ];

            // Random token for email verification
            $token = base64_encode(random_bytes(32));

            // User token
            $user_token = [
                'email'         => $email,
                'token'         => $token,
                'date_created' => time()
            ];

            $this->db->insert('user', $data);               // insert new user
            $this->db->insert('user_token', $user_token);   // insert new user_token

            $this->_sendemail($token, 'verify');            // send an email with a link to verify the email is true

            // message to action
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Congratulation! your account has been created. Please activate your email </div>');
            redirect('auth/login');
        }
    }

    private function _sendemail($token, $type)
    {
        // email sender configuration
        $config = [
            'protocol'  => 'smtp',
            'smtp_host' => 'ssl://smtp.googlemail.com',
            'smtp_user' => 'hrms.iflab@gmail.com',
            'smtp_pass' => 'r5p6*uBi',
            'smtp_port' => 465,
            'mailtype'  => 'html',
            'charset'   => 'utf-8',
            'newline'   => "\r\n"
        ];

        $this->email->initialize($config); // set the config to codeigniter email library

        // check which mail is wanted to be sent
        if ($type === 'verify') {

            // sends a link to verify email
            $this->email->from('hrms.iflab@gmail.com', 'HRMS IFLAB');
            $this->email->to($this->input->post('email'));
            $this->email->subject('Email Activation');
            $this->email->message('Click this link to verify your account: <a href="' . base_url() . 'auth/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Activate</a>');
        }

        // checks if the email is sent, if not print the error
        if ($this->email->send()) {
            return true;
        } else {
            echo $this->email->print_debugger();
            die;
        }
    }

    public function verify()
    {
        $email = $this->input->get('email'); // get the email from url
        $token = $this->input->get('token'); // get the token from url

        // get user by email
        $user = $this->db->get_where('user', ['email' => $email])->row_array();

        // checks if user exist in database
        if ($user) {

            // get user_token by email
            $user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

            // checks if user_token exist
            if ($user_token) {

                // checks if the given token has not expired, the time limit is 24 hours
                if ((time() - $user_token['date_created']) < (60 * 60 * 24)) {

                    // update the is_active column to 1
                    $this->db->set('is_active', 1);
                    $this->db->where('email', $email);
                    $this->db->update('user');

                    // delete the user_token
                    $this->db->delete('user_token', ['email' => $email]);

                    // message to action
                    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">' . $email . ' has been activated. Please login</div>');
                    redirect('auth/login');
                } else {

                    // if the token is expired, delete the user and user_token from database
                    $this->db->delete('user', ['email' => $email]);
                    $this->db->delete('user_token', ['email' => $email]);

                    // message to action
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Token Expired.</div>');
                    redirect('auth/login');
                }
            } else {

                // if the token is incorrect or did not exist

                // message to action
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Wrong token.</div>');
                redirect('auth/login');
            }
        } else {

            // if user (email) is incorrect or did not exist

            // message to action
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Account activation failed! Wrong email.</div>');
            redirect('auth/login');
        }
    }

    // Logout function to logout of session
    public function logout()
    {

        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role_id');

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">You have been logged out!</div>');
        redirect('auth');
    }

    // Renders block access from user to admin through URL (added in helpers/sistem_helper)
    public function blocked()
    {
        $this->load->view('auth/blocked');
    }
}
