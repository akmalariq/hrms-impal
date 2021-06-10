<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
    }

    public function index()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $data['user_role'] = $this->db->get('user_role')->result_array();
        // echo "selamat datang " . $data['user']['name'];

        $data['title'] = "Dashboard";


        $keyword = $this->input->post('keyword');
        if (!$keyword) {
            $data['users'] = $this->db->get('user')->result_array();
        } else {
            $this->load->model('users_model');
            $search = $this->input->post('keyword');
            $data['users'] =  $this->users_model->search($search);
        }

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('templates/footer');
    }

    public function role()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // var_dump($data['user']);
        // die;

        $data['title'] = "Role";

        $data['role'] = $this->db->get('user_role')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/role', $data);
        $this->load->view('templates/footer');
    }

    public function roleAccess()

    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // echo "selamat datang " . $data['user']['name'];

        $data['title'] = "Role Access";

        $data['role'] = $this->db->get('user_role')->row_array();

        if ($this->session->userdata('id') != 1) {
            $this->db->where('id !=', 1);
        }
        $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/role_access', $data);
        $this->load->view('templates/footer');
    }

    public function changeAccess()
    {
        $menu_id = $this->input->post('menuId');
        $role_id = $this->input->post('roleId');

        $data = [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ];

        $result = $this->db->get_where('user_access_menu', $data);

        if ($result->num_rows() < 1) {
            $this->db->insert('user_access_menu', $data);
        } else {
            $this->db->delete('user_access_menu', $data);
        }

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Access Changed!</div>');
    }

    public function edit($id)
    {
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for name {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');

        // Checks if form_validation has not run, shows login page. Else get input form
        if ($this->form_validation->run() == false) {

            $data['title'] = "Edit Member";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/edit', $data);
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
                'role_id' => $this->input->post('role_id', true),

                // is_active is default to 1 (active) until further function is implemented (user can authenticate their own email)
                // 'is_active' => 1,

            ];

            $this->db->where('id', $data['user']['id']);
            $this->db->update('user', $newdata);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Profile has been updated</div>');
            redirect('admin');
        }
    }

    public function delete($id)
    {
        $this->db->delete('user', array('id' => $id));
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">User has been deleted</div>');
        redirect("admin");
    }

    public function announcements()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();

        if (($this->input->post('title', true) == false) || ($this->input->post('announcement', true) == false)) {

            $data['title'] = "Create Announcements";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/announcements', $data);
            $this->load->view('templates/footer');
        } else {
            $newdata = [
                // name is filtered through XSS filter and htmlspecialchars
                'title' => htmlspecialchars($this->input->post('title', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'announcement' => htmlspecialchars($this->input->post('announcement', true)),

                'date_created' => time()
            ];

            $this->db->insert('announcements', $newdata);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Success</div>');
            redirect('practicum/announcements');
        }
    }

    public function assign($id)
    {

        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $data['assigned_user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $this->db->select('name, sid, class, role, course, modul, modul.date, attend');
        $this->db->from('user');
        $this->db->join('schedule', 'user.id = schedule.user_id');
        $this->db->join('user_role', 'schedule.role_id = user_role.id');
        $this->db->join('modul', 'schedule.modul_id = modul.id');
        $this->db->join('course', 'modul.course_id = course.id');
        $this->db->where('user_id', $id);
        $this->db->order_by("date", "ASC");
        $data['schedule'] = $this->db->get()->result_array();

        $data['title'] = "Assign Class";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/assign', $data);
        $this->load->view('templates/footer');
    }

    public function assignadd($id)
    // masih banyak error cek lagi
    {

        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $data['assigned_user'] = $this->db->get_where('user', ['id' => $id])->row_array();
        $data['modul'] = $this->db->get('modul')->result_array();
        $data['course'] = $this->db->get('course')->result_array();

        $data['title'] = "Assign Class";

        $this->db->select('course.id, role_id');
        $this->db->from('schedule');
        $this->db->join('modul', 'modul.id = schedule.modul_id');
        $this->db->join('course', 'course.id = modul.course_id');
        $this->db->where('user_id', $id);
        $data['schedule'] = $this->db->get()->result_array();


        // $data['mata_kuliah'] = $this->db->get('practicum_mata_kuliah')->result_array();
        // // $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/assignadd', $data);
        $this->load->view('templates/footer');
    }

    public function addcourse($id, $course_id, $role_id)
    // masih banyak error cek lagi
    {
        // $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">' . 'id = ' . $id . ' course = ' .  $course . ' Success</div>');
        // redirect('admin/assignadd/' . $id);

        // $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $modul = $this->db->get_where('modul', ['course_id' => $course_id])->result_array();

        foreach ($modul as $m) {
            $data = [
                'user_id' => $id,
                'role_id' => $role_id,
                'modul_id' => $m['id'],
                'date' => 0,
                'attend' => 0
            ];
            $this->db->insert("schedule", $data);
        }
        redirect("admin/assign/" . $id);
    }

    public function deletecourse($id, $course_id)
    // masih banyak error cek lagi
    {
        $modul = $this->db->get_where('modul', ['course_id' => $course_id])->result_array();

        foreach ($modul as $m) {
            $data = [
                'modul_id' => $m['id']
            ];
            $this->db->delete("schedule", $data);
        }
        redirect("admin/assign/" . $id);

        // $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // $data['assigned_user'] = $this->db->get_where('user', ['id' => $id])->row_array();
        // $data['schedule'] = $this->db->get_where('schedule', ['user_id' => $id])->result_array();
        // $data['modul'] = $this->db->get('modul')->result_array();
        // $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">hello</div>');

        // $data['title'] = "Assign Class";

        // // $this->db->select('mata_kuliah_id, role');
        // // $this->db->from('user_assign');
        // // $this->db->join('user_role', 'user_role.id = user_assign.role_id');
        // // $this->db->where('user_id', $id);
        // // $this->db->order_by("mata_kuliah_id", "ASC");
        // // $data['assigned'] = $this->db->get()->result_array();


        // // $data['mata_kuliah'] = $this->db->get('practicum_mata_kuliah')->result_array();
        // // // $data['menu'] = $this->db->get('user_menu')->result_array();

        // $this->load->view('templates/header', $data);
        // $this->load->view('templates/sidebar', $data);
        // $this->load->view('templates/topbar', $data);
        // $this->load->view('admin/assignadd', $data);
        // $this->load->view('templates/footer');
    }

    public function announcementsedit($id)
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $data['announcements'] = $this->db->get_where('announcements', ['id' => $id])->row_array();

        // Sets rules from form validation (Check the inputs if valid)

        // Checks if form_validation has not run, shows login page. Else get input form
        if ($this->input->post('title', true) == false) {

            $data['title'] = "Announcements Edit";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/announcementsedit', $data);
            $this->load->view('templates/footer');
        } else {
            $newdata = [
                // title is filtered through XSS filter and htmlspecialchars
                'title' => htmlspecialchars($this->input->post('title', true)),

                // announcement is filtered through XSS filter and htmlspecialchars
                'announcement' => htmlspecialchars($this->input->post('announcement', true)),

                'date_created' => time()
            ];

            $this->db->where('id', $data['announcements']['id']);
            $this->db->update('announcements', $newdata);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Announcement has been updated</div>');
            redirect('practicum/announcements');
        }
    }

    public function announcementsdelete($id)
    {
        $this->db->delete('announcements', array('id' => $id));
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">User has been deleted</div>');
        redirect("practicum/announcements");
    }

    public function schedule()
    // masih banyak error cek lagi
    {

        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        $data['schedule'] = $this->db->get_where('schedule', ['user_id' => 1])->result_array();
        // $data['assistant_schedule'] = $this->db->get('assistant_schedule')->result_array();
        // $data['course'] = $this->db->get('course')->result_array();
        // $data['modul'] = $this->db->get('modul')->result_array();
        // $data['assigned_user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $data['title'] = "Schedule";

        // $this->db->select('mata_kuliah_id, role');
        // $this->db->from('user_assign');
        // $this->db->join('user_role', 'user_role.id = user_assign.role_id');
        // $this->db->where('user_id', $id);
        // $this->db->order_by("mata_kuliah_id", "ASC");
        // $data['assigned'] = $this->db->get()->result_array();


        // $data['mata_kuliah'] = $this->db->get('practicum_mata_kuliah')->result_array();
        // // $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/schedule', $data);
        $this->load->view('templates/footer');
    }

    public function addschedule()
    // masih banyak error cek lagi
    {

        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // $data['schedule'] = $this->db->get_where('schedule', ['user_id' => 1])->result_array();
        // $data['assistant_schedule'] = $this->db->get('assistant_schedule')->result_array();
        // $data['course'] = $this->db->get('course')->result_array();
        // $data['modul'] = $this->db->get('modul')->result_array();
        // $data['assigned_user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $data['title'] = "Add Schedule";

        // $this->db->select('mata_kuliah_id, role');
        // $this->db->from('user_assign');
        // $this->db->join('user_role', 'user_role.id = user_assign.role_id');
        // $this->db->where('user_id', $id);
        // $this->db->order_by("mata_kuliah_id", "ASC");
        // $data['assigned'] = $this->db->get()->result_array();


        // $data['mata_kuliah'] = $this->db->get('practicum_mata_kuliah')->result_array();
        // // $data['menu'] = $this->db->get('user_menu')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/addschedule', $data);
        $this->load->view('templates/footer');
    }
}
