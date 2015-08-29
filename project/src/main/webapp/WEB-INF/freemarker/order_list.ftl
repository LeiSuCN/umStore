<#assign p=JspTaglibs["/WEB-INF/u.tld"]>
<link rel="stylesheet" href="${APP.ROOT}/style/css/jquery-ui.min.css" />
<style type="text/css">
</style>
<div class="row" style="margin: 10px 0;    max-width: 980px;">
	<label for="from" class="label label-lg label-pink arrowed-right" style="float:left">起始时间</label>
	<div class="col-xs-2">
		<div class="input-group input-group-sm">
			<input type="text" id="from" name="from"  class="form-control"  value="${condition.dateFrom }"  type="date" pattern="yyyy-MM-dd"/>
			<span class="input-group-addon">
				<i class="ace-icon fa fa-calendar"></i>
			</span>
 			</div>
  	</div>
  	
  	<label for="to" class="label label-lg label-pink arrowed-right" style="float:left">截至时间</label>
 	<div class="col-xs-2">
		<div class="input-group input-group-sm">
			<input type="text" id="to" name="to"  class="form-control"   value="${condition.dateTo }"  type="date" pattern="yyyy-MM-dd"/>
			<span class="input-group-addon">
				<i class="ace-icon fa fa-calendar"></i>
			</span>
 		</div>
  	</div>
  	
  	<label for="serviceType" class="label label-lg label-pink arrowed-right" style="float:left">业务类型</label>
 	<div class="col-xs-2">
		<select id="serviceType" name="serviceType" style="width: 100%;">
			<option value=0>全部</option>
			<option value=1>母婴用品</option>
			<option value=6>个护美妆</option>
		</select>
  	</div>
  	
  	<label for="orderStatus" class="label label-lg label-pink arrowed-right" style="float:left">订单状态</label>
 	<div class="col-xs-1">
		<select id="orderStatus" name="orderStatus" >
			<option value=-1>全部</option>
			<option value=0>待支付</option>
			<option value=1>待确认</option>
			<option value=2>已确认</option>
			<option value=5>已发货</option>
			<option value=6>已完成</option>
			<option value=9>已取消</option>
		</select>
  	</div>
 	
 	<div class="col-xs-1">
		<button class="btn btn-info btn-xs" id="search_btn">
		<i class="ace-icon fa fa-check-square-o  bigger-110 icon-only"></i>
	</button>
  	</div>

</div>

<div class="table-header">查询结果</div><!--
--><div>
    <table id="result_table" class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>订单号</th>
                <th>运单号</th>
                <th>物流商</th>
                <th>创建时间</th>
                <th>订单状态</th>
                <th>客户姓名</th>
                <th>金额</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
<#list orders as order>
            <tr>
                <td>${order.mid}</td>
				<td>${order.expressId}</td>
				<td>${order.expressName}</td>
                <td>${order.createTime?datetime}</td>
                <td><span data-order_status="${order.status}"  
                	class="label <#if order.status == 6>label-success<#elseif order.status == 9>label-danger<#else>label-info</#if>">
					<#switch order.status>
						<#case 0>待支付<#break>
						<#case 1>待确认<#break>
						<#case 2>已确认<#break>
						<#case 5>已发货<#break>
						<#case 6>已完成<#break>
						<#case 9>已取消<#break>
					</#switch>
                </span></span></td>
                <td>${order.customerName }</td>
                <td>${order.revenue }</td>
                <td>
                    <div class="hidden-sm hidden-xs action-buttons">
                        <a class="blue" href="javascript:void(0)">
                            <i class="ace-icon fa fa-search-plus bigger-130"></i>
                        </a>
                    </div>
                 </td>
            </tr>
</#list>
        </tbody>
    </table>
</div>

<script src="${APP.ROOT}/js/jquery.dataTables.min.js"></script>
<script src="${APP.ROOT}/js/jquery.dataTables.bootstrap.js"></script>
<script src="${APP.ROOT}/js/jquery-ui.min.js"></script>
<script src="${APP.ROOT}/js/jquery.ui.touch-punch.min.js"></script>
<script src="${APP.ROOT}/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
    var dateFrom = $( "#from" );
    var dateTo = $( "#to" );
    var serviceType = $("#serviceType");
    var orderStatus = $("#orderStatus");
    var searchBtn = $('#search_btn');

    function jump(){
    	var df = dateFrom.val();
    	var dt = dateTo.val();
    	var type = serviceType.val();
    	var status =  orderStatus.val();
    	var href = "?dateFrom=" + df + "&dateTo=" + dt + "&type=" + type + "&status=" + status;
    	window.location.href = href;
    }

	$(document).ready(function(){
        		
		currentBreadcrumb([ { name:"订单列表", href:"#"} ]);
             	
        var datepickerOptions = {
    			showOtherMonths: true,
    			selectOtherMonths: false,
             	dateFormat: "yy-mm-dd",
        	   // changeMonth: true,
        	    numberOfMonths: 1	
        };
        
        dateFrom.datepicker($.extend({},datepickerOptions, {
              onClose: function( selectedDate ) {
            	  dateTo.datepicker( "option", "minDate", selectedDate );
              }
         }));
        
        dateTo.datepicker($.extend({},datepickerOptions, {
              onClose: function( selectedDate ) {
            	  dateFrom.datepicker( "option", "maxDate", selectedDate );
              }
         }));
 
        var resultTable = $('#result_table').dataTable( {
        	"bSort": false,
        	"bLengthChange": false,
            "oLanguage": {
            	"sZeroRecords":  "没有匹配的记录",
            	"sLengthMenu": "显示 _MENU_ 条",
            	"sSearch": "搜索:",
                "sInfo": "_START_ 至 _END_ , 共_TOTAL_条"
            }
        } );
        		        
        $('#menu_1_1').css('display','block');
        
        searchBtn.click(jump);
        
    	serviceType.val(${condition.type });
    	orderStatus.val(${condition.status });
	});
	
</script>