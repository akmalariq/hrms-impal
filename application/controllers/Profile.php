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

        // This function checks which role is logged in and has what access
        is_logged_in();
    }

    public function index()
    {
        $id = $this->session->userdata('id');
        $this->db->select('name, image, email, sid, class, role, date_created');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->join('user_role', 'user.role_id = user_role.id');
        $this->db->where('user.id', $id);
        $data['user'] = $this->db->get()->row_array(); // get this session's credentials

        $data['title'] = "My Profile"; // add title page

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('profile/index', $data);
        $this->load->view('templates/footer');
    }

    // public function edit()
    // {
    //     $id = $this->session->userdata('id');
    //     $this->db->select('user.id AS id, name, image, email, sid, class, role, date_created');
    //     $this->db->from('user');
    //     $this->db->join('class', 'user.class_id = class.id');
    //     $this->db->join('user_role', 'user.role_id = user_role.id');
    //     $this->db->where('user.id', $id);
    //     $data['user'] = $this->db->get()->row_array(); // get this session's credentials

    //     $data['class'] = $this->db->get("class")->result_array(); // get all class

    //     // Sets rules from form validation (Check the inputs if valid)

    //     // Sets rules for name {trim: to remove trailing whitespace, required: the field cannot be empty}
    //     $this->form_validation->set_rules('name', 'Name', 'required|trim');

    //     // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
    //     $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]');

    //     // Sets rules for student id {trim: to remove trailing whitespace, required: the field cannot be empty, is_unique from table: user cols: sid}
    //     $this->form_validation->set_rules('sid', 'Student ID', 'required|trim|numeric|exact_length[10]', [
    //         // Sets unique warning
    //         'numeric' => "Student ID must be numeric",
    //         'exact_length' => "Student ID must be 10 digits",
    //     ]);

    //     // Sets rules for student id {trim: to remove trailing whitespace, required: the field cannot be empty, is_unique from table: user cols: sid}
    //     $this->form_validation->set_rules('class', 'Class', 'required');

    //     // Checks if form_validation has not run, shows login page. Else get input form
    //     if ($this->form_validation->run() == false) {

    //         $data['title'] = "Edit Profile";

    //         $this->load->view('templates/header', $data);
    //         $this->load->view('templates/sidebar', $data);
    //         $this->load->view('templates/topbar', $data);
    //         $this->load->view('profile/edit', $data);
    //         $this->load->view('templates/footer');
    //     } else {
    //         $newdata = [
    //             // name is filtered through XSS filter and htmlspecialchars
    //             'name' => htmlspecialchars($this->input->post('name', true)),

    //             // email is filtered through XSS filter and htmlspecialchars
    //             'email' => htmlspecialchars($this->input->post('email', true)),

    //             // student id is filtered through XSS filter and htmlspecialchars
    //             'sid' => htmlspecialchars($this->input->post('sid', true)),

    //             // class is filtered through XSS filter and htmlspecialchars
    //             'class_id' => $this->input->post('class', true)
    //         ];

    //         $this->db->where('id', $data['user']['id']);
    //         $this->db->update('user', $newdata);
    //         $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Profile has been updated</div>');
    //         redirect('profile');
    //     }
    // }

    public function change_password()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for old_password {trim: to remove trailing whitespace, required: the field cannot be empty, min_lenth[3]: minimum strings of 3}
        $this->form_validation->set_rules('old_password', 'Old Password', 'required|trim|min_length[3]', [
            // Sets unique warning
            'min_length' => "Password too short!"
        ]);

        // Sets rules for password1 {trim: to remove trailing whitespace, required: the field cannot be empty, min_lenth[3]: minimum strings of 3, matches[password2]: password1 needs to match password2}
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]', [
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
            $this->load->view('profile/change_password', $data);
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
                redirect('profile');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password is incorrect</div>');
                redirect('profile/change_password');
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
        $this->load->view('profile/schedule', $data);
        $this->load->view('templates/footer');
    }
}
