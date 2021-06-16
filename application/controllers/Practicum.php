<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Practicum extends CI_Controller
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

    ################################# Assistant Schedule #################################

    public function index()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $this->db->select('user.id as id, schedule.id as schedule_id, name, sid, class, role, course, modul, modul_id, modul.date, attend');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->join('schedule', 'user.id = schedule.user_id');
        $this->db->join('user_role', 'schedule.role_id = user_role.id');
        $this->db->join('modul', 'schedule.modul_id = modul.id');
        $this->db->join('course', 'modul.course_id = course.id');
        $this->db->where('user_id', $id);
        $this->db->where('schedule.role_id', 3);
        $this->db->order_by("date", "ASC");
        $this->db->order_by("modul_id", "ASC");
        $data['schedule'] = $this->db->get()->result_array();
        $querySchedule = "SELECT    COUNT(attend) AS attend
                            FROM    schedule
                           WHERE    user_id = $id
                             AND    role_id = 3
                             AND    attend = 1
        ";
        $data["attendance"] = $this->db->query($querySchedule)->row_array();

        $data['title'] = "Assistant Schedule";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('practicum/schedule', $data);
        $this->load->view('templates/footer');
    }

    public function finance()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $data['title'] = "Finance";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('assistant/finance', $data);
        $this->load->view('templates/footer');
    }

    public function validateattendance($modul_id)
    {

        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $this->db->select('course, modul');
        $this->db->from('modul');
        $this->db->join('course', 'course.id = modul.course_id');
        $this->db->where('modul.id', $modul_id);
        $data['modul'] = $this->db->get()->row_array();

        $data['title'] = "Validate Attendance";

        $keyword = $this->input->post('keyword');
        if (!$keyword) {
            $this->db->select('name, sid, class, modul.date, attend, schedule.id as schedule_id, schedule.modul_id as modul_id ');
            $this->db->from('user');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('schedule', 'user.id = schedule.user_id');
            $this->db->join('user_role', 'schedule.role_id = user_role.id');
            $this->db->join('modul', 'schedule.modul_id = modul.id');
            $this->db->join('course', 'modul.course_id = course.id');
            $this->db->where('schedule.modul_id', $modul_id);
            $this->db->where('schedule.role_id', 2);
            $data['schedule'] = $this->db->get()->result_array();
        } else {
            $this->db->select('name, sid, class, modul.date, attend, schedule.id as schedule_id, schedule.modul_id as modul_id ');
            $this->db->from('user');
            $this->db->join('class', 'user.class_id = class.id');
            $this->db->join('schedule', 'user.id = schedule.user_id');
            $this->db->join('user_role', 'schedule.role_id = user_role.id');
            $this->db->join('modul', 'schedule.modul_id = modul.id');
            $this->db->join('course', 'modul.course_id = course.id');
            $this->db->where('schedule.modul_id', $modul_id);
            $this->db->where('schedule.role_id', 2);
            $this->db->like('name', $keyword);
            $this->db->or_like('sid', $keyword);
            $this->db->or_like('class', $keyword);
            $data['schedule'] = $this->db->get()->result_array();
        }

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('assistant/validateattendance', $data);
        $this->load->view('templates/footer');
    }

    public function attend($schedule_id, $modul_id, $attend)
    {
        if ($attend) {
            $this->db->where('id', $schedule_id);
            $this->db->update('schedule', array('attend' => 0));
        } else {
            $this->db->where('id', $schedule_id);
            $this->db->update('schedule', array('attend' => 1));
        }
        redirect("assistant/validateattendance/" . $modul_id);
    }


    ################################# Announcement #################################

    public function announcements()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();

        $this->db->select('*');
        $this->db->from('announcements');
        $this->db->order_by('date_created', 'desc');
        $data['announcements'] = $this->db->get()->result_array();


        $data['title'] = "Announcements";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('practicum/announcements', $data);
        $this->load->view('templates/footer');
    }


    ################################# Recruitment #################################

    public function recruitment()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array(); // get this session's credentials

        $data['title'] = "Recruitment Phase";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('practicum/recruitment', $data);
        $this->load->view('templates/footer');
    }

    public function upload_document()
    {
        $id = $this->session->userdata('id');
        $this->db->select('user.id as id, name, sid, class, email, role');
        $this->db->from('user');
        $this->db->join('class', 'user.class_id = class.id');
        $this->db->join('user_role', 'user.role_id = user_role.id');
        $this->db->where('user.id', $id);
        $data['user'] = $this->db->get()->row_array(); // get this session's credentials

        $data['class'] = $this->db->get('class')->result_array(); // get all class

        $data['title'] = "Upload Document";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('practicum/upload_document', $data);
        $this->load->view('templates/footer');
    }

    public function do_upload()
    {
        $id = $this->session->userdata('id');
        $this->db->select('sid');
        $this->db->from('user');
        $this->db->where('user.id', $id);
        $user = $this->db->get()->row_array(); // get this session's credentials

        $dir = $user['sid']; // use sid as a directory name

        // check if directory exist
        if (is_dir('./uploads/' . $dir) === false) {
            mkdir('./uploads/' . $dir); // create directory
        }

        // Motivation Letter

        $config['upload_path']          = './uploads/' . $dir;  // path for uploaded file
        $config['allowed_types']        = 'pdf|docx';           // file types allowed to be uploaded
        $config['max_size']             = 500;                  // max file size (500 kb)


        $this->load->library('upload', $config); // load library with config

        // checks if file has been uploaded
        if (!$this->upload->do_upload('ml')) {

            // if not show error message
            $error = array('error' => $this->upload->display_errors());
            $this->session->set_flashdata('message_ml', '<div class="alert alert-danger" role="alert">' . $error . '</div>');
        } else {

            // show success message
            $this->session->set_flashdata('message_ml', '<div class="alert alert-success" role="alert">Motivation Letter Upload Successful </div>');
        }

        // CV

        $config['upload_path']          = './uploads/' . $dir;  // path for uploaded file
        $config['allowed_types']        = 'pdf|docx';           // file types allowed to be uploaded
        $config['max_size']             = 500;                  // max file size (500 kb)

        $this->load->library('upload', $config); // load library with config

        // checks if file has been uploaded
        if (!$this->upload->do_upload('cv')) {

            // if not show error message
            $error = array('error' => $this->upload->display_errors());
            $this->session->set_flashdata('message_cv', '<div class="alert alert-danger" role="alert">' . $error . '</div>');
        } else {

            // show success message
            $this->session->set_flashdata('message_cv', '<div class="alert alert-success" role="alert">CV Upload Successful </div>');
        }





        redirect('practicum/upload_document');
    }
}
