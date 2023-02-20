<?php

class Streams_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_streams(): MysqliDb|array|string
    {
        $this->db->where("school", $this->session->data("school"));
        return $this->db->get("streams");
    }

}