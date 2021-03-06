<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Kill3rCoder-Lapi
 * Date: 3/17/13
 * Time: 12:20 PM
 * To change this template use File | Settings | File Templates.
 */

class Dashboard extends Admin_Controller{
    function __construct(){
        parent::__construct();
    }
    public function System(){
        $this->session->set_userdata('activetb','System');
        $this->data['title']="Dashboard";
        $this->parser->parse('admin/systemDashboard.tpl',$this->data);
        //echo "admin Dashboard is here.";
    }

    public function Users(){
        $this->session->set_userdata('activetb','Users');
        $this->data['title']="Users Dashboard";
        $this->parser->parse('admin/usersDashboard.tpl',$this->data);
        //echo "admin Dashboard is here.";
    }

    public function HRS(){
        $this->session->set_userdata('activetb','HRS');
        $this->data['title']="HRS Dashboard";
        $this->parser->parse('admin/hrsDashboard.tpl',$this->data);
        //echo "admin Dashboard is here.";
    }
}