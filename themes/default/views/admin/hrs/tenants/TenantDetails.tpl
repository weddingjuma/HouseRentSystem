{{extends file="adminLayout.tpl"}}
{{block name="header"}}
    <title>{{$title}}</title>
    {{css('admin/avatar.css')}}
    {{css('admin/jasny/jasny-bootstrap.min.css')}}
{{/block}}
{{block name="content"}}
    {{*Start of the Main View*}}
    <div class="outer">
        <div class="inner">
            {{*Tenant Details Main Section Starts Here*}}
            <div class="row ui-sortable">

                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Tenant Details</h5>
                        </header>
                        <div class="body" id="collapse4">
                            {{*User Profile*}}
                            <div class="row ui-sortable">
                                <div class="col-lg-12">
                                    <div class="row ui-sortable">
                                        {{*left section division*}}
                                        <div class="col-lg-3">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    {{*<pre>{{var_dump($TenantData)}}</pre>*}}
                                                    <h3 class="panel-title">{{$TenantData[0]->FullName}}</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="holder">
                                                            <div class="avatar">
                                                                <a href="#">
                                                                    <img id="userDefaultAvatars"
                                                                         src="{{url}}uploads/users/d/defaultAvatar.jpg"
                                                                         class="user"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <span class="user-name">{{$TenantData[0]->FullName}}</span>
                                                    </div>
                                                    <div class="list-group">
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-12" style="text-align: center;font-weight: bold;">
                                                                <span>{{$TenantData[0]->GroupName}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                            <b >CNIC:</b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span>{{$TenantData[0]->CNIC}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                                <b >Cell:</b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span>{{$TenantData[0]->Mobile}}</span>
                                                            </div>
                                                        </a>
                                                        <a href="#" class="list-group-item row">
                                                            <div class="col-lg-3">
                                                                <b>Last Login: </b>
                                                            </div>
                                                            <div class="col-lg-9">
                                                                <span>
                                                                    {{if $TenantData[0]->LastActivity|default:FALSE}}
                                                                        {{$TenantData[0]->LastActivity}}
                                                                        {{else}}
                                                                        Never
                                                                        {{/if}}
                                                                     </span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            {{* End of Panel Code Here*}}
                                        </div>
                                        {{*End of Left Section Division*}}
                                        {{*Start of Right Section Division*}}
                                        <div class="col-lg-9">
                                            {{*Panel Code Here*}}
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Detail Info</h3>
                                                </div>
                                                <div class="panel-body">
                                                    {{*Details View Start Here*}}
                                                    <div class="well well-sm customWellBox">
<div class="row">
                                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                                            <span class="fa fa-tags" style="color: darkred; font-size: 16pt;" aria-hidden="true"></span> <h3 style="display: inline-block">0</h3>
                                                            <p style="font-weight: bold;margin-left: 10px;">Payments Late</p>
                                                        </div>
                                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                                            <span class="fa fa-tags" style="color: darkorange; font-size: 16pt;" aria-hidden="true"></span><h3 style="display: inline-block">0</h3>
                                                            <p style="font-weight: bold;margin-left: 10px;">Payments Pending</p>
                                                        </div>
                                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                                            <span class="fa fa-tags" style="color: #338f33; font-size: 16pt;" aria-hidden="true"></span> <h3 style="display: inline-block">0</h3>
                                                            <p style="font-weight: bold;margin-left: 10px;">Payments Paid</p>
                                                        </div>
                                                        <div class="col-lg-3 col-md-6 col-sm-6">
                                                            <span class="fa fa-envelope" style="color: black; font-size: 16pt;" aria-hidden="true"></span> <h3 style="display: inline-block">0</h3>
                                                            <p style="font-weight: bold;margin-left: 10px;">Notices Sent</p>
                                                        </div>
</div>
                                                    </div>
                                                    {{*Panel Here which Should Hold a Table/Grid*}}
                                                    <div class="row" style="margin-top:20px;">
                                                        <div class="col-lg-12">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading">
                                                                    <div class="row">
                                                                        <div class="panel-title col-xs-6" style="display: inline-block;">Payments (month - month)</div>
                                                                        <div class="customPanelHeaderSearch col-xs-6"><input type="text" class="form-control" placeholder="Search..."> </div>
                                                                    </div>
                                                                </div>
                                                                {{*Main Grid Here*}}
                                                                <table id="TenantPaymentDetails" class="table table-bordered table-condensed table-hover table-striped">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>PaymentID</th>
                                                                        <th data-class="expand">Status</th>
                                                                        <th data-hide="phone">Due Date</th>
                                                                        <th data-hide="phone,tablet">Property</th>
                                                                        <th data-hide="phone,tablet">Period Start</th>
                                                                        <th data-hide="phone,tablet">Period End</th>
                                                                        <th data-hide="phone">Due</th>
                                                                        <th data-hide="phone,tablet">Remaining</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tfoot>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th colspan="7">Total Remaining:</th>
                                                                    </tr>
                                                                    </tfoot>
                                                                    <tbody></tbody>
                                                                </table>
                                                                {{*End of Main Grid*}}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {{*Details Views Ends Here*}}
                                                </div>

                                            </div>
                                        </div>
                                        {{*End of Right Section Division*}}

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{*End of Tenant Details Main Section*}}
        </div>
    </div>
    {{*End of the Main View*}}
{{/block}}
{{block name="scripts"}}
    {{js('holder/holder.js')}}
    {{js('datatables/fnReloadAjax.js')}}
    <script>
        var oTable;
        $('document').ready(function (e) {
            oTable = '';
            //Data Tables Script Here.
            var selector = $('#TenantPaymentDetails');
            var url = "{{base_url()}}admin/hrsTenants/listTenantPaymentDetails_DT/{{$TenantData[0]->TenantID}}";
            var aoColumns =  [
                /* Payment ID */   {
                    "bVisible":    false,
                    "bSortable":   false,
                    "bSearchable": false
                },
                /* Status */  null,
                /* Due Date */  null,
                /* Property */  null,
                /* Period Start */  null,
                /* Period End */  null,
                /* Due */  null,
                /* Remaining */  null

            ];
            commonDataTablesWithFooter(selector,url,aoColumns);
            //End Of dataTables Script..



            //Option To Redirect to Payment Details
            selector.on('click','.paymentInfo',function(e){
                var paymentRecordID = $(this).parents('tr').attr('data-id');
                window.location.href= "{{base_url()}}admin/payments/details/"+paymentRecordID
                console.log(paymentRecordID);
            });

        });//End of Document Ready Function
    </script>
{{/block}}