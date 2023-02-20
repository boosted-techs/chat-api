<?php

class Home extends Controller
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws SmartyException
     */
    function index()
    {
        echo "Welcome";
    }

    /**
     * @throws SmartyException
     */
    function forgot_password() {
        $this->smarty->display("forgot-password.tpl");
    }





}