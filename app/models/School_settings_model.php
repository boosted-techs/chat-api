<?php

class School_settings_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_term_settings(): array|string|null
    {
        $this->db->orderBy("id", "desc");
        $this->db->where("school", $this->session->data->school);
        return $this->db->getOne("terms_of_study");
    }

}