<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Users_model extends CI_Model
{
    public function search($search)
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->like('name', $search);
        $this->db->or_like('email', $search);
        $query = $this->db->get();
        return $query->result_array();
    }
}
