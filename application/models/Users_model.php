<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Users_model extends CI_Model
{
    public function search($search)
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->join('user_role', 'user.role_id = user_role.id');
        $this->db->like('name', $search);
        $this->db->or_like('email', $search);
        $this->db->or_like('role', $search);
        $query = $this->db->get();
        return $query->result_array();
    }
}
