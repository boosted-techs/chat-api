<?php

class Students extends Controller
{
    private $user;
    function __construct()
    {
        parent::__construct();
        $this->model(["Users_model", "Houses_model", 'Classes_model',
            'Streams_model', 'School_settings_model']);
        $this->user = $this->model->Users_model->is_logged_in();
        if (empty($_POST))
            $this->smarty->assign("user", $this->user);
    }

    /**
     * @throws SmartyException
     */
    function index() {
        $this->smarty->display("students/students.tpl");
    }

    /**
     * @throws SmartyException
     */
    function add_student() {
        $religions = $this->model->Users_model->get_religions();
        $level_types = $this->model->Users_model->get_school_levels();
        $classes = $this->model->Classes_model->get_classes();
        $streams = $this->model->Streams_model->get_streams();
        $houses = $this->model->Houses_model->get_houses();

        $this->smarty->display("students/add-student.tpl",
            ['religions' => $religions, 'levels' => $level_types, 'classes' => $classes, 'streams' => $streams,
                'houses' => $houses]);
    }

    function save_student() {
        $this->model->Users_model->is_admin();
        $this->model->Users_model->add_student($this->model->School_settings_model->get_term_settings());
    }

}