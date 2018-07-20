<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'sysmenu.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<jsp:include page="/commonality/commonalityEasyUi.jsp" />
	<div data-options="region:'north'" style="height: 20%;">

		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newMenu()" iconcls="icon-add">增加</a> 
				<a href="javascript:void(0)" 
				 class="easyui-linkbutton"
				onclick="update()" iconcls="icon-edit">修改</a>
		 <a     href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteorder()" iconcls="icon-remove">删除</a>

		</div>
	</div>
	<div data-options="region:'center'" style="height: 80%;">

		<div id="dataGrid"></div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 200px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" novalidate>
			 <input name="order_id" id = "order_id" type="hidden" >
			
			<div class="fitem">
				<label>用户编号:</label> <input name="user_id" id="user_id"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>订单姓名:</label> <input name="order_user_name"
					id="order_user_name" class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>地址编号:</label> <input name="order_user_address_id"
					id="order_user_address_id" class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>订单发送方式:</label> <input name="order_good_sent_type"
					id="order_good_sent_type" class="easyui-validatebox">
				<div class="fitem">
					<label>订单支付方式:</label> <input name="order_good_pay_type"
						id="order_good_pay_type" class="easyui-validatebox">
				</div>
				<div class="fitem">
					<label>订单状态:</label> <input name="order_status" id="order_status"
						class="easyui-validatebox">
				</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-ok" onclick="saveMenu()">提交</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
	  	$(function(){
	  		init();
	  	})
	  	function init(){
	  		$('#dataGrid').datagrid({
				url : 'order/list.do',
				title : '订单',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'order_id',
				queryParams: {          
                /* menuname: $("#menuName").val(), 
                prendid:$("#prendId").combobox("getValue"),           
                menurevel:level,           
                menuaddress: $("#menuAddress").val()         
              	 */},
				columns : [ [ {
					field : 'order_id',
					checkbox:true},
					 {
					field : 'user_id',
					title : '用户姓名',
					width : 60,
					align : 'center'
				}, {
					field : 'order_user_name',
					title : '用户编号',
					width : 60,
					align : 'center',
				}, {
					field : 'order_user_address_id',
					title : '地址编号',
					width : 60,
					align : 'center'
				}, {
					field : 'order_good_sent_type',
					title : '发货方式',
					width : 60,
					align : 'center'
				},{
					field : 'order_good_pay_type',
					title : '支付方式',
					width : 60,
					align : 'center'
				},{
					field : 'order_status',
					title : '订单状态',
					width : 60,
					align : 'center'
				} ] ],
				onHeaderContextMenu : function(e, field) {
					e.preventDefault();
					if (!cmenu) {
						createColumnMenu();
					}
					cmenu.menu('show', {
						left : e.pageX,
						top : e.pageY
					});
				},
				
				pageList : [ 5, 10, 20, 30, 40, 50, 100 ],// 可以设置每页记录条数的列表
                pageSize : 10,// 每页显示的记录条数，默认为10
                pagination : true, // 分页工具栏
			});
			//取消选择行  
			$('#dataGrid').datagrid('clearSelections');
	  	}
	  	function newMenu(){
            $('#dlg').dialog('open').dialog('setTitle','新增菜单');
            $('#fm').form('clear');
            $("#prendidDiv").hide();
        }	
	  	function saveMenu(){
	  		/* //var order_id = $("#order_id").val();
	  	    var user_id = $("#user_id").val();
	  		var order_user_name = $("#order_user_name").val();
	  		var order_user_address_id = $("#order_user_address_id").val();
	  		var order_good_sent_type = $("#order_good_sent_type").val();
	  		var order_good_pay_type = $("#order_good_pay_type").val();
	  		var order_status = $("#order_status").val();
	  		$.ajax({
	             url:"order/save.do",
	            // data:{"order_id":order_id,"user_id":user_id,"order_user_name":order_user_name,"order_user_address_id":order_user_address_id,"order_good_sent_type":order_good_sent_type,"order_good_pay_type":order_good_pay_type,"order_status":order_status},
	         data:{"user_id":user_id,"order_user_name":order_user_name,"order_user_address_id":order_user_address_id,"order_good_sent_type":order_good_sent_type,"order_good_pay_type":order_good_pay_type,"order_status":order_status},
	             dataType:"json",
				 method : 'post',
	             async:false,  
	             success:function (data){
	            	 $.messager.alert('提示',data.msg);
	            	 if(data.flag == true){
							init();
							$('#dlg').dialog('close');
						}
	             }
	  		}) */
      		$("#fm").form("submit", {
    			url:"order/save.do",
    			dataType:"json",
    			method : 'post',
   				success:function(data){
   				data = eval("(" + data + ")");
   				$.messager.alert('提示',data.msg);
   				if(data.flag == true){
   					init();
   				}
    			}
			});
	  	}
	  	function deleteorder(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var oneflag = false;
      		var Twoflag = false;
      		var ids = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			
      			ids+=","+rows[i].order_id;
      		}
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"order/delete1.do",
            			dataType:"json",
             			data:{
             			"ids":ids
             			},
             			success:function (data){//data  相当于  java里面的  object 
            				$.messager.alert('提示',data.msg);
   							if(data.flag == true){
   								init();}
            			}
            			})
      				}
      			})
      	}
		function update() {
        	var rows = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var order_id = rows[0].order_id;
        	$.ajax({
             url:"order/queryOrder.do",
             dataType:"json",
             data:{
             "order_id":order_id
             },
             success:function (data){//data  相当于  java里面的  object 
             	 $('#dlg').dialog('open').dialog('setTitle','修改');
          		 $('#fm').form('clear');
          		 var Order = data.order;
          		 console.info(Order)
          		 $("#order_id").val(Order.order_id);
          		 $("#user_id").val(Order.user_id);
          		 $("#order_user_name").val(Order.order_user_name);
          		 $("#order_user_address_id").val(Order.order_user_address_id);
          		 $("#order_good_sent_type").val(Order.order_good_sent_type);
          		 $("#order_good_pay_type").val(Order.order_good_pay_type);
          		 $("#order_status").val(Order.order_status);
                 
         	 }
         	 })
        }
	  </script>
</body>
</html>
