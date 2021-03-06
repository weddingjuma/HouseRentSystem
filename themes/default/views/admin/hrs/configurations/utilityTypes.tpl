{{extends file="adminLayout.tpl"}}
{{block name="header"}}
<title>{{$title}}</title>
{{/block}}

{{block name="content"}}
    <div class="outer">
        <div class="inner">
            {{*DataTables Grid Start Here*}}
            <div class="row ui-sortable">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Manage Utility Types</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;"><a data-original-title="" href="#addNewUtilityTypeModal" data-toggle="modal" class="btn btn-metis-5 btn-sm btn-grad btn-rect">Add New Utility Type</a></div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageUtilityTypes" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Utility ID</th>
                                    <th><input type="checkbox" id="UtilityTypesCheckAll" value="" />&nbsp;All</th>
                                    <th data-class="expand">Utility Type Name</th>
                                    <th data-hide="phone">Description</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <button type="button" id="testButton">Test For CheckBoxes.</button>
                        </div>
                    </div>
                </div>
            </div>
            {{*End of DataTables Grid Coding*}}
        </div>
    </div>
    {{*End of the Main Content View*}}

    {{*Hidden Models Below for Actions of the View*}}

    {{*Add New Utility Type Modal*}}
    <div id="addNewUtilityTypeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Add Utility Type</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal" id="addNewUtilityTypeForm" accept-encoding="utf-8">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cUtilityTypeName">Utility Type</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required" name="cUtilityTypeName" placeholder="Type Name" id="cUtilityTypeName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="cUtilityDescription">Description</label>
                                <div class="col-lg-8">
                                    <textarea name="cUtilityDescription" id="cUtilityDescription" placeholder="Type any Description Related to the Utility Type" class="form-control"></textarea>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="AddUtilityTypeBtn">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Add New Utility Type Modal -->


    {{*Edit Utility Type Modal*}}
    <div id="editUtilityTypeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i style='color: #666666' class='fa fa-edit fa-fw fa-1x'></i>Edit Utility Type</h4>
                </div>
                <div class="modal-body">
                    <div class="body collapse in" id="div-1">
                        <form class="form-horizontal" id="editUtilityTypeForm" accept-encoding="utf-8">
                            <input type="hidden" id="eUtilityTypeID" style="display: none;"/>
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="eUtilityTypeName">Utility Type</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control required" name="eUtilityTypeName" placeholder="Type Name" id="eUtilityTypeName">
                                </div>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="eUtilityDescription">Description</label>
                                <div class="col-lg-8">
                                    <textarea name="eUtilityDescription" id="eUtilityDescription" placeholder="Type any Description Related to the Utility Type" class="form-control"></textarea>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="updateUtilityTypeBtn">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal --><!-- /#Edit Utility Type Modal -->

{{/block}}
{{block name="scripts"}}
    {{js('datatables/fnReloadAjax.js')}}
<script>
    var oTable;
    $('document').ready(function (e) {
        oTable = '';
        //Data Tables Script Here.
        var selector = $('#ManageUtilityTypes');
        var url = "{{base_url()}}admin/hrsConfigurations/listUtilityTypes_DT/";
        var aoColumns =  [
            /* ID */   {
                "mData": "UTID",
                "bVisible":    false,
                "bSortable":   false,
                "bSearchable": false
            },
            {
                "mData": "CheckBoxes",
                "bSortable": false,
                "bSearchable": false
            },

            /* Utility Type Name */  {
                "mData": "UName"
            },
            /* Description */  {
                "mData": "UDescription"
            },
            /* Actions */  {
                "mData": "Actions"
            }
        ];
        var HiddenColumnID = 'UTID';
        commonDataTablesWithCheckBoxes(selector,url,aoColumns,HiddenColumnID);

        //Little Script for CheckBox in Datatables.
        $("#UtilityTypesCheckAll").click(function () {
            $('#ManageUtilityTypes tbody input[type="checkbox"]').prop('checked', this.checked);
        });

        $('#testButton').on('click', function (e) {
            var UTID = $(this).closest('tr').attr('data-id');
            var ids = new Array();
            var array = $('#ManageUtilityTypes input:checked');
            $.each(array, function (i, e) {
                if ($(e).attr("id") != 'UtilityTypesCheckAll') {
                    ids.push($(e).closest('tr').attr('data-id'))
                }
            });
            console.log(ids);
        });

        //End Of dataTables Script..
        $('#AddUtilityTypeBtn').on('click', function (e) {
            e.preventDefault();
            var selector = $('#addNewUtilityTypeForm');
            HRS.formValidation(selector);
            if(selector.valid()){
                console.log('im working also');
                var formData = {
                    UTName: $('#cUtilityTypeName').val(),
                    UTDescription: $('#cUtilityDescription').val()
                };
            $.ajax({
               url: "{{url}}/admin/hrsConfigurations/addUtilityType",
                data: formData,
                type: "POST",
                success: function (output) {
                    var data = output.split('::');
                    if(data[0]==="OK"){
                        oTable.fnReloadAjax();
                        HRS.notification(data[1],data[2]);
                        $('#addNewUtilityTypeModal').modal('hide');
                        $("#addNewUtilityTypeForm")[0].reset();
                    }
                    else if(data[0]==="FAIL"){
                        HRS.notification(data[1],data[2]);
                    }
                }
            });
            }
        });
        $('#updateUtilityTypeBtn').on('click', function (e) {
            e.preventDefault();
            var formData = {
                UT: $('#eUtilityTypeID').val(),
                UTName: $('#eUtilityTypeName').val(),
                UTDescription: $('#eUtilityDescription').val()
            };
            var selector = $('#editUtilityTypeForm');
            HRS.formValidation(selector);
            if (selector.valid()) {
                $.ajax({
                    url: "{{url}}/admin/hrsConfigurations/updateUtilityType",
                    data: formData,
                    type: "POST",
                    success: function (output) {
                        var data = output.split('::');
                        if (data[0] === "OK") {
                            oTable.fnReloadAjax();
                            HRS.notification(data[1], data[2]);
                            $('#editUtilityTypeModal').modal('hide');
                            $("#editUtilityTypeForm")[0].reset();
                        }
                        else if (data[0] === "FAIL") {
                            HRS.notification(data[1], data[2]);
                        }
                    }
                });
            }
        });

        $('#ManageUtilityTypes').on('click','.editBtnFunc', function (e) {
            e.preventDefault();
            var UTID = $(this).closest('tr').attr('data-id');
            var data = {
                ID :UTID
            };
            //Ajax Call to Get the Edit Modal Data for the Currently Selected Row.
            $.ajax({
               url:"{{url}}/admin/hrsConfigurations/editUtilityType",
               dataType:"json",
               type: "POST",
                data:data,
                success: function (response) {
                    if(!($.isEmptyObject(response))){
                        $.each(response,function(key,value){
                            $('#eUtilityTypeID').val(value.UTID);
                            $('#eUtilityTypeName').val(value.UName);
                            $('#eUtilityDescription').val(value.UDescription);
                        });
                    }
                }
                
            });
        });

        $('#ManageUtilityTypes').on('click','.deleteBtnFunc', function (e) {
            e.preventDefault();
            var UTID = $(this).closest('tr').attr('data-id');
            var data = {
              ID :UTID
            };
            //Ajax Call to Delete the Selected Row from the Database.
            $.ajax({
                url:"{{url}}/admin/hrsConfigurations/deleteUtilityType",
                data:data,
                type:"POST",
                success: function(output){
                    var data = output.split('::');
                    if (data[0] === "OK") {
                        oTable.fnReloadAjax();
                        HRS.notification(data[1], data[2]);
                    }
                    else if (data[0] === "FAIL") {
                        HRS.notification(data[1], data[2]);
                    }
                }
            });
        });
    });
</script>
{{/block}}
