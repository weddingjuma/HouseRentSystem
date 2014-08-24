/**
 * Created by HaiderHassan on 8/22/14.
 */
/*----------- BEGIN toggleButtons CODE -------------------------*/
$.each($('.make-switch'), function () {
    $(this).bootstrapSwitch({
        onText: $(this).data('onText'),
        offText: $(this).data('offText'),
        onColor: $(this).data('onColor'),
        offColor: $(this).data('offColor'),
        size: $(this).data('size'),
        labelText: $(this).data('labelText')
    });
});
/*----------- END toggleButtons CODE -------------------------*/


/*----------- DataTables Common Script only will need parameters to send and call the function -------------------------*/
function commonDataTables(selector,url,aoColumns){
    var responsiveHelper;
    var breakpointDefinition = {
        tablet: 1024,
        phone : 480
    };
      oTable = selector.dataTable({
        sPaginationType: 'bootstrap',
        oLanguage      : {
            sLengthMenu: '_MENU_ records per page'
        },
        "autoWidth" : false,
        "aoColumns":aoColumns,
        "bServerSide":true,
        "bProcessing":true,
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "sAjaxSource": url,
        "iDisplayLength": 25,
        "aLengthMenu": [[2, 25, 50, -1], [2, 25, 50, "All"]],
        'fnServerData'   : function(sSource, aoData, fnCallback){
            $.ajax ({
                'dataType': 'json',
                'type'    : 'POST',
                'url'     : sSource,
                'data'    : aoData,
                'success' : fnCallback
            }); //end of ajax
        },
        'fnRowCallback': function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $(nRow).attr("data-id",aData[0]);
            responsiveHelper.createExpandIcon(nRow);
            return nRow;
        },
        fnPreDrawCallback: function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper) {
                responsiveHelper = new ResponsiveDatatablesHelper(selector, breakpointDefinition);
            }
        },
        fnDrawCallback : function (oSettings) {
            // Respond to windows resize.
            responsiveHelper.respond();
        }
    });
}

/*----------- END DataTables Common Script -------------------------*/


/*----------- Select2 DropDown Common Script  -------------------------*/
//For ServerSide Script
function commonSelect2(selector,url,id,text,minInputLength,placeholder){
    selector.select2({
        minimumInputLength:minInputLength,
        placeholder:placeholder,
        ajax: {
            type:"post",
            url: url,
            dataType: 'json',
            quietMillis: 100,
            data: function(term, page) {
                return {
                    term: term, //search term
                    page_limit: 10 // page size
                };
            },
            results: function(data, page) {
                var newData = [];
                $.each(data, function (index,value) {
                    newData.push({
                        id: value[id],  //id part present in data
                        text: value[text]  //string to be displayed
                    });
                });
                return { results: newData };
            }
        }
    });
}
//For General Purpose without serverSide Processing
    $(".commonGeneralSelect2").select2({
        placeholder: "Select a State",
        allowClear: true
    });
/*----------- End of Select2 DropDown Common Script  -------------------------*/