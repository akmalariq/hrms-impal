<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
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

    ################################# Dashboard #################################

    public function index()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['title'] = "Dashboard"; // add title page

        $keyword = $this->input->post('keyword'); // get the keyword from search bar
        if (!$keyword) {
            $this->db->select('user.id AS id, name, email, sid, class, role, role_id, date_created');
            $this->db->from('user');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('user_role', 'user.role_id = user_role.id');
            $this->db->where('role_id', 2);
            $data['users'] = $this->db->get()->result_array(); // get all users with their roles
        } else {
            // $this->load->model('users_model'); // load users_model
            // $data['users'] =  $this->users_model->search($keyword); // get all users with their roles by keyword

            $this->db->select('user.id AS id, name, email, sid, class, role, date_created');
            $this->db->from('user');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('user_role', 'user.role_id = user_role.id');
            $this->db->like('name', $keyword);
            $this->db->or_like('email', $keyword);
            $this->db->or_like('sid', $keyword);
            $this->db->or_like('class', $keyword);
            $data['users'] = $this->db->get()->result_array(); // get all users with their roles
        }

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('templates/footer');
    }

    public function edit_user($id)
    {
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get user's credentials

        // Sets rules from form validation (Check the inputs if valid)

        // Sets rules for name {trim: to remove trailing whitespace, required: the field cannot be empty}
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        // Sets rules for email {trim: to remove trailing whitespace, required: the field cannot be empty, valid_email: checks if the string is a valid email}
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');

        // Checks if form_validation has not run, shows edit user page. Else get input form
        if (!$this->form_validation->run()) {

            $data['title'] = "Edit Member"; // add title page

            // load page
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/edit_user', $data);
            $this->load->view('templates/footer');
        } else {
            $newdata = [
                // name is filtered through XSS filter and htmlspecialchars
                'name' => htmlspecialchars($this->input->post('name', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'email' => htmlspecialchars($this->input->post('email', true)),
            ];

            // update the user's data with newdata
            $this->db->where('id', $id);
            $this->db->update('user', $newdata);

            // gives message to action
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Profile has been updated</div>');

            // redirect to controller Admin
            redirect('admin');
        }
    }

    public function delete_user($id)
    {
        $this->db->delete('user', array('id' => $id));
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">User has been deleted</div>');
        redirect("admin");
    }

    public function assign_user($target_id)
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $this->db->select('user.id AS id, name, sid, class');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->where('user.id', $target_id);
        $data['assigned_user'] = $this->db->get_where()->row_array(); // get target user's credentials

        // get schedule
        $this->db->select('schedule.id AS id, course, modul_id, modul, modul.date, attend');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->join('schedule', 'user.id = schedule.user_id');
        $this->db->join('modul', 'schedule.modul_id = modul.id');
        $this->db->join('course', 'modul.course_id = course.id');
        $this->db->where('user_id', $target_id);
        $this->db->order_by("date", "ASC");
        $data['schedule'] = $this->db->get()->result_array();

        $data['title'] = "Schedules"; // add title page

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/assign_user', $data);
        $this->load->view('templates/footer');
    }

    public function add_assign($target_id)
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['assigned_user'] = $this->db->get_where('user', ['id' => $target_id])->row_array(); // get target user's credentials

        $data['course'] = $this->db->get('course')->result_array(); // get course

        $data['title'] = "Assign Practicum"; // add title page

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/add_assign', $data);
        $this->load->view('templates/footer');
    }

    public function add_course($id, $course_id)
    {
        $modul = $this->db->get_where('modul', ['course_id' => $course_id])->result_array(); // get all modul for the assigned course

        // insert all of the modul from the course to schedule
        foreach ($modul as $m) {
            $data = [
                'user_id' => $id,
                'modul_id' => $m['id']
            ];
            $this->db->insert("schedule", $data);
        }

        // return to original page
        redirect("admin/add_assign/" . $id);
    }

    public function delete_course($id, $course_id)
    {
        $modul = $this->db->get_where('modul', ['course_id' => $course_id])->result_array(); // get all modul for the assigned course

        // delete all of the modul from the course to schedule
        foreach ($modul as $m) {
            $data = [
                'modul_id' => $m['id']
            ];
            $this->db->delete("schedule", $data);
        }

        // return to original page
        redirect("admin/add_assign/" . $id);
    }

    public function attend($schedule_id, $target_id, $attend)
    {
        if ($attend) {
            $this->db->where('id', $schedule_id);
            $this->db->update('schedule', array('attend' => 0));
        } else {
            $this->db->where('id', $schedule_id);
            $this->db->update('schedule', array('attend' => 1));
        }
        redirect("admin/assign_user/" . $target_id);
    }

    ################################# Recruits #################################

    public function recruits()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['title'] = "Recruits"; // add title page

        $keyword = $this->input->post('keyword'); // get the keyword from search bar
        if (!$keyword) {
            $this->db->select('user.id AS id, name, sid, class, role, phase, course_id');
            $this->db->from('recruitment');
            $this->db->join('user', 'recruitment.user_id = user.id');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('user_role', 'user.role_id = user_role.id');
            $data['users'] = $this->db->get()->result_array(); // get all users with their roles
        } else {
            // $this->load->model('users_model'); // load users_model
            // $data['users'] =  $this->users_model->search($keyword); // get all users with their roles by keyword

            $this->db->select('user.id AS id, name, sid, class, role, phase, course_id');
            $this->db->from('recruitment');
            $this->db->join('user', 'recruitment.user_id = user.id');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('user_role', 'user.role_id = user_role.id');
            $this->db->like('name', $keyword);
            $this->db->or_like('email', $keyword);
            $this->db->or_like('sid', $keyword);
            $this->db->or_like('class', $keyword);
            $this->db->or_like('role', $keyword);
            $data['users'] = $this->db->get()->result_array(); // get all users with their roles
        }

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/recruits', $data);
        $this->load->view('templates/footer');
    }

    public function accept($target_id, $phase, $course_id)
    {

        if ($phase < 3) {
            $phase = $phase + 1;
            $newdata = [
                // phase is filtered through XSS filter and htmlspecialchars
                'phase' => $phase
            ];
            $this->db->where('user_id', $target_id);
            $this->db->update('recruitment', $newdata);
        } else {
            $newdata = [
                // phase is filtered through XSS filter and htmlspecialchars
                'role_id' => 2
            ];
            $this->db->where('id', $target_id);
            $this->db->update('user', $newdata);

            $modul = $this->db->get_where('modul', ['course_id' => $course_id])->result_array(); // get all modul for the assigned course

            // insert all of the modul from the course to schedule
            foreach ($modul as $m) {
                $data = [
                    'user_id' => $target_id,
                    'modul_id' => $m['id']
                ];
                $this->db->insert("schedule", $data);
            }

            $this->db->delete("recruitment", ['user_id' => $target_id]);
        }

        redirect('admin/recruits');
    }

    ################################# Role #################################

    public function role()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['title'] = "Role"; // add title page

        $data['role'] = $this->db->get('user_role')->result_array(); // get all roles

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/role', $data);
        $this->load->view('templates/footer');
    }

    public function role_access()
    {
        $id = $this->session->userdata('id');
        $this->db->select('user.id as id, name, sid, class, role');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->join('user_role', 'user.role_id = user_role.id');
        $this->db->where('user.id', $id);
        $data['user'] = $this->db->get()->row_array(); // get this session's credentials

        $data['title'] = "Role Access"; // add title page

        $data['role'] = $this->db->get('user_role')->result_array(); // get all roles

        // checks if the user is an admin, only admin can change role access of admin
        if ($id != 1) {
            $this->db->where('id !=', 1);
        }
        $data['menu'] = $this->db->get('user_menu')->result_array();

        // load page
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/role_access', $data);
        $this->load->view('templates/footer');
    }

    public function change_access()
    {
        // get post variables
        $menu_id = $this->input->post('menuId');
        $role_id = $this->input->post('roleId');

        // create an array to store variables
        $data = [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ];

        $result = $this->db->get_where('user_access_menu', $data); // get user access for menus

        // checks if the access exists or not
        if ($result->num_rows() < 1) {
            $this->db->insert('user_access_menu', $data);
        } else {
            $this->db->delete('user_access_menu', $data);
        }
        // gives message to action
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Access Changed!</div>');
    }

    ################################# Announcement #################################

    public function create_announcement()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        // Sets rules from form validation

        // Sets rules for title {required: the field cannot be empty}
        $this->form_validation->set_rules('title', 'Title', 'required');
        // Sets rules for announcement {required: the field cannot be empty}
        $this->form_validation->set_rules('announcement', 'Announcement', 'required');

        // Checks if form_validation has not run, shows create announcement page. Else run _login funtion
        if ($this->form_validation->run()) {
            $newdata = [
                // name is filtered through XSS filter and htmlspecialchars
                'title' => htmlspecialchars($this->input->post('title', true)),

                // email is filtered through XSS filter and htmlspecialchars
                'announcement' => htmlspecialchars($this->input->post('announcement', true)),

                'date_created' => time()
            ];

            $this->db->insert('announcements', $newdata); // insert new announcement
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Success</div>'); // gives message to action
            redirect('practicum/announcements'); // go to announcements page
        } else {
            $data['title'] = "Create Announcements"; // add title page

            // load page
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/create_announcement', $data);
            $this->load->view('templates/footer');
        }
    }

    public function edit_announcement($announcement_id)
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['announcements'] = $this->db->get_where('announcements', ['id' => $announcement_id])->row_array(); // get the announcement

        // Sets rules from form validation (Check the inputs if valid)

        // Checks if there is no input, shows edit announcement page. Else get input form
        if ($this->input->post()) {
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
        } else {
            $data['title'] = "Announcements Edit";

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/edit_announcement', $data);
            $this->load->view('templates/footer');
        }
    }

    public function delete_announcement($id)
    {
        $this->db->delete('announcements', array('id' => $id));
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Announcement has been deleted</div>');
        redirect("practicum/announcements");
    }

    public function schedule()
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
