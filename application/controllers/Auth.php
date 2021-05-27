<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    // Call View Function to show Login Page
    public function index()
    {
        // Checks if there is a live session if there is one, redirect to controllers/user
        if ($this->session->userdata('email')) {
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } else {
                redirect('user');
            }
        }

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
                        redirect('user');
                    }
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Wrong password!</div>');
                    redirect('auth');
                }
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email has not been activated!</div>');
                redirect('auth');
            }
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email is not registered!</div>');
            redirect('auth');
        }
    }

    // Call View Function to show Registration Page from (views/auth/login)
    public function registration()
    {
        if ($this->session->userdata('email')) {
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } else {
                redirect('user');
            }
        }

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for name {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
            // Sets unique warning
            'is_unique' => "Email has already been registered"
        ]);
        // Sets rules for password1 {trim: to remove trailing whitespace, required: the field cannot be empty, min_lenth[3]: minimum strings of 3, matches[password2]: password1 needs to match password2}
        $this->form_validation->set_rules('password1', 'Password1', 'required|trim|min_length[3]|matches[password2]', [
            // Sets unique warning
            'matches' => "Password didn't match!",
            'min_length' => "Password too short!"
        ]);
        // Sets rules for password2 {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('password2', 'Password2', 'required|trim');

        // Checks if form_validation has not run, shows login page. Else get input form
        if ($this->form_validation->run() == false) {

            $data['title'] = "Sistem Registration";

            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/registration');
            $this->load->view('templates/auth_footer');
        } else {
            $data = [
                // name is filtered through XSS filter and htmlspecialchars
                'name' => htmlspecialchars($this->input->post('name', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'email' => htmlspecialchars($this->input->post('email', true)),

                // image use default until until further function is implemented (user can upload their own image)
                'image' => "default.jpg",

                // password is hashed
                'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),

                // role_id is default to 2 for a user to be an admin, it needes to be referred by other admins
                'role_id' => 2,

                // is_active is default to 1 (active) until further function is implemented (user can authenticate their own email)
                'is_active' => 1,

                // date is automatically added
                'date_created' => time()

            ];

            $this->db->insert('user', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Congratulation! your account has been created. Pleas Login </div>');
            redirect('auth');
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
