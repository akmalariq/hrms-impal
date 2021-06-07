<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Assistant extends CI_Controller
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

        $data['title'] = "Finance";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('assistant/finance', $data);
        $this->load->view('templates/footer');
    }

    public function finance()
    {
        $data['user'] = $this->db->get_where('user', ['id' => $this->session->userdata('id')])->row_array();
        // echo "selamat datang " . $data['user']['name'];

        $data['title'] = "Finance";

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('assistant/finance', $data);
        $this->load->view('templates/footer');
    }
}
