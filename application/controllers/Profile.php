<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Profile extends CI_Controller
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

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
    }

    public function index()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // echo "selamat datang " . $data['user']['name'];

        $data['title'] = "My Profile";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('candidate/index', $data);
        $this->load->view('templates/footer');
    }

    public function edit()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for name {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');

        // Checks if form_validation has not run, shows login page. Else get input form
        if ($this->form_validation->run() == false) {

            $data['title'] = "Edit Profile";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('candidate/edit', $data);
            $this->load->view('templates/footer');
        } else {
            $newdata = [
                // name is filtered through XSS filter and htmlspecialchars
                'name' => htmlspecialchars($this->input->post('name', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'email' => htmlspecialchars($this->input->post('email', true)),

                // image use default until until further function is implemented (user can upload their own image)
                // 'image' => "default.jpg",

                // password is hashed
                // 'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),

                // role_id is default to 2 for a user to be an admin, it needes to be referred by other admins
                // 'role_id' => 2,

                // is_active is default to 1 (active) until further function is implemented (user can authenticate their own email)
                // 'is_active' => 1,

            ];

            $this->db->where('id', $data['user']['id']);
            $this->db->update('user', $newdata);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Profile has been updated</div>');
            redirect('user');
        }
    }

    public function change_password()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();

        // Sets rules from form validation (Check the inputs if valid)

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

            $data['title'] = "Change Password";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('candidate/change_password', $data);
            $this->load->view('templates/footer');
        } else {
            $password = $this->input->post('old_password');

            if (password_verify($password, $data['user']['password'])) {
                $newdata = [
                    // password is hashed
                    'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
                ];

                $this->db->where('id', $data['user']['id']);
                $this->db->update('user', $newdata);
                $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Password has been changed</div>');
                redirect('user');
            }
        }
    }

    public function schedule()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // echo "selamat datang " . $data['user']['name'];

        $data['title'] = "Schedule";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('candidate/schedule', $data);
        $this->load->view('templates/footer');
    }
}
