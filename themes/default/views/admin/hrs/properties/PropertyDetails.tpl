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
        {{*Property Details Main Section Starts Here*}}
        <div class="row ui-sortable">

            <div class="col-lg-12">
                <div class="box">
                    <header>
                        <div class="icons">
                            <i class="fa fa-table"></i>
                        </div>
                        <h5>Property Details</h5>
                    </header>
                    <div class="body" id="collapse4">
                    {{*Main Section Body of View Starts Here*}}
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
                                                                     src="{{url}}uploads/properties/d/defaultHouseDP.jpg"
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
                                    </div>
                                </div>
                            </div>
                    {{*End of Main Body View*}}
                        </div>
                    </div>
                </div>
            </div>
        {{*End of Property Details Main Section*}}
        </div>
    </div>
{{/block}}
{{block name="scripts"}}
<script>

</script>
{{/block}}