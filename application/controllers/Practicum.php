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
        is_logged_in();
    }

    public function index()
    {
        $id = $this->session->userdata('id');
        $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

        $this->db->select('user.id as id, name, sid, class, role, course, modul, modul.date, attend');
        $this->db->from('user');
        $this->db->join('schedule', 'user.id = schedule.user_id');
        $this->db->join('user_role', 'schedule.role_id = user_role.id');
        $this->db->join('modul', 'schedule.modul_id = modul.id');
        $this->db->join('course', 'modul.course_id = course.id');
        $this->db->where('user_id', $id);
        $this->db->where('schedule.role_id', 2);
        $this->db->order_by("date", "ASC");
        $this->db->order_by("modul_id", "ASC");
        $data['schedule'] = $this->db->get()->result_array();

        $data['title'] = "Schedule";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('practicum/schedule', $data);
        $this->load->view('templates/footer');
    }

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
}
