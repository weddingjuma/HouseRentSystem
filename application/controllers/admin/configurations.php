<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: HaiderHassan
 * Date: 2/4/14
 * Time: 4:09 PM
 */
class Configurations extends Admin_Controller{
    function __construct(){
        parent::__construct();
        $this->load->library('Datatables.php');
        $this->load->library('table');
        $this->load->helper('dataTables');
        $this->load->model('system/configuration');
    }


    //Function:ManageForms will load the view of Manage Forms.
    function ManageForms(){
        $this->data['title']="Manage Forms";
        $this->data['activeMenu']="ManageForms";
        //echo "'".$this->uri->segment(1)."'";
        //exit;
        $this->parser->parse('admin/systemConfigurationManageForms.tpl',$this->data);
    }

    //Function:ManageForms will load the view of Manage Forms.
    function ManageTabs(){
        $this->data['title']="Manage Tabs";
        $this->data['activeMenu']="ManageTabs";
        $this->parser->parse('admin/systemConfigurationManageTabs.tpl',$this->data);
    }

    //List all the forms in DataTables if belong to the certain role..
    //DT= Data Tables
 function listForms_DT(){
     $this->datatables->select('FormID, FormName, FormPath, FormCIPath')
         //->unset_column('FormID')
         ->add_column("Actions", "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "FormID")
         ->from('sys_forms');
     echo $this->datatables->generate();
}//end of list_forms_view
    function listTabs_DT(){
        $this->datatables->select('TabID, TabName, TabOrder, TabDesc')
            //->unset_column('FormID')
            ->add_column("Actions", "<a href='#editBtnModal' data-toggle='modal' class='editBtnFunc'><i style='color: #666666' class='fa fa-pencil fa-fw fa-2x'></i></a><a href='#' id='deleteBtn' class='deleteBtnFunc'><i style='color: #ff0000' class='fa fa-times fa-fw fa-2x'></i></a>", "TabID")
            ->from('sys_tabs');
        echo $this->datatables->generate();
    }

    function GetFormData($id)
    {
        $where = array(
            'FormID' => $id
        );
        $tbl='sys_forms';
        $data=('FormName,FormPath,FormCIPath,IsMenuLink');
        $result = $this->Common_Model->select_fields_where($tbl,$data,$where);
        print json_encode($result);
    }
    function UpdateFormData()
    {
        $FormID = $this->input->post('FormID');
        $FormName = $this->input->post('FormName');
        $FormPath = $this->input->post('FormPath');
        $FormCIPath = $this->input->post('FormCIPath');
        $IsMenuLink = $this->input->post(mysql_real_escape_string('IsMenuLink'));
        $tbl="sys_forms";
        $data=array(
            'FormName' => $FormName,
            'FormPath' => $FormPath,
            'FormCIPath' => $FormCIPath,
            'IsMenuLink' => $IsMenuLink,
        );
        $field = "FormID";
        $affected_row = $this->Common_Model->update_query($tbl,$field,$FormID,$data);
        if($affected_row)
        {
            echo true;

        }else{
            echo false;
        }
    }
    function deleteFormData($FormID)
    {
        $columns = "MenuID";
        $where = array(
            'FormID' =>$FormID
        );
        $MenuIDs = $this->Common_Model->select_fields_where('sys_forms',$columns,$where,TRUE);
        //echo $MenuIDs->MenuID;
        $tbl = "sys_forms";
        $where = array(
                'FormID' => $FormID
            );
        $result1 = $this->Common_Model->delete($tbl,$where);
        $tbl = "sys_menus";
        $where = array(
            'MenuID' => $MenuIDs->MenuID
        );
        $result2 = $this->Common_Model->delete($tbl,$where);
        if ($result1==true && $result2==true){
            echo "true";
        }
        else{
            echo "false";
        }

    }
    function addNewForm(){
        $MenuName = $this->input->post('MenuName');
        $FormName = $this->input->post('FormName');
        $FormPath = $this->input->post('FormPath');
        $FormCIPath = $this->input->post('FormCIPath');
        $IsMenuLink = $this->input->post('IsMenuLink');
        $TabID = $this->input->post('TabID');
        $MenuOrder = $this->input->post('MenuOrder');
        $ParentMenuID = $this->input->post('ParentMenuID');

        $data_sysMenus = array(
            'TabID' => $TabID,
            'MenuName' => $MenuName,
            'MenuOrder' => $MenuOrder,
            'ParentID' => $ParentMenuID
        );
        $data_sysForms = array(
            'FormName' => $FormName,
            'FormPath' => $FormPath,
            'FormCIPath' => $FormCIPath,
            'IsMenuLink' => $IsMenuLink
        );
        $result = $this->Common_Model->insertInToMultipleTables($data_sysMenus,$data_sysForms);

        if($result=true){
            echo 'Imma Working';
        }
    }
    function loadAllParentFormNames($TabID){
        $value = $this->input->post('term');
        $PTable='sys_menus';
        $data=array('FormID','FormName');
        $field='FormName';
        $where = array(
            'TabID' =>$TabID
        );
        $joins=array(
            array(
                'table' => 'sys_forms',
                'condition' => 'sys_forms.MenuID = sys_menus.MenuID',
                'jointype' => 'INNER'
            )
        );
        $searchResults = $this->Common_Model->get_autoCompleteJoin($PTable, $joins, $where, $data, $field, $value,$group_by=false);
        print json_encode($searchResults);
    }
    function loadAllTabNames(){
        $value = $this->input->post('term');
        $tbl='sys_tabs';
        $data=('TabID,TabName');
        $field='TabName';
        $searchResults = $this->Common_Model->get_autoComplete($tbl, $data, $field, $value, $where='',$group_by=false,$limit='');
        print json_encode($searchResults);
    }

}