<?php

class Classes_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_classes(): MysqliDb|array|string
    {
        $this->db->where("school", $this->session->data("school"));
        return $this->db->get("classes");
    }

}