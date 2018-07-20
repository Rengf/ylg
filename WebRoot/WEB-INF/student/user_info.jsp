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
		<div data-options="region:'north'" style="height:20%;">
	   
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newMenu()" iconcls="icon-add">增加</a> 
				<a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="updateMenu()" iconcls="icon-edit">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteuser_info()" iconcls="icon-remove">删除</a> 
				
		</div>
	</div>
	<div data-options="region:'center'" style="height:80%;">
		
		<div id="dataGrid"  ></div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:200px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm"  novalidate>
		  <input id="formId" name = "id" style = "display:none">
			<div class="fitem">
				<label>用户类型:</label> <input name="user_type" id = "user_type" class="easyui-combobox"
					required="true" >
			</div>
			<div class="fitem"  >
				<label>用户密码:</label> <input name="user_pwd" id = "user_pwd" class="easyui-combobox"
					>
			</div>
			<div class="fitem">
				<label>用户姓名:</label> <input name="user_name" id = "user_name" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>用户问题:</label> <input name="menupwd_qus" id = "pwd_qus" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>用户答案:</label> <input name="menupwd_asr" id = "pwd_asr" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>用户电话:</label> <input name="menuuse_tel" id = "use_tel" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>用户邮箱:</label> <input name="menuuser_email" id = "user_email" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>用户性别:</label> <input name="menuuser_sex" id = "user_sex" class="easyui-validatebox"
					required="true">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveMenu()">提交</a> <a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	  <script type="text/javascript">
	  	$(function(){
	  		init();
	  	})
	  	function init(){
	  		$('#dataGrid').datagrid({
				url : 'user_info/list.do',
				title : '用户',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                /* menuname: $("#menuName").val(), 
                prendid:$("#prendId").combobox("getValue"),           
                menurevel:level,           
                menuaddress: $("#menuAddress").val()         
              	 */},
				columns : [ [ {
					field : 'user_id',
					checkbox:true},
					 {
					field : 'user_type',
					title : '用户类别',
					width : 44,
					align : 'center'
				}, {
					field : 'user_pwd',
					title : '密码',
					width : 44,
					align : 'center',
					
				}, {
					field : 'user_name',
					title : '用户姓名',
					width : 44,
					align : 'center'
				}, {
					field : 'pwd_qus',
					title : '用户问题',
					width : 44,
					align : 'center'
				}, {
					field : 'pwd_asr',
					title : '用户答案',
					width : 44,
					align : 'center'
				}, {
					field : 'use_tel',
					title : '用户电话',
					width : 44,
					align : 'center'
				}, {
					field : 'user_email',
					title : '用户email',
					width : 44,
					align : 'center'
				}, {
					field : 'user_sex',
					title : '用户性别',
					width : 44,
					align : 'center',
					formatter: function(value,row){
						if(value == 1){
							return "男";
						}else{
							return "女";
						}
					}
				}] ],
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
	  		//var user_id = $("#user_id").val();
	  		var user_type = $("#user_type").val();
	  		var user_pwd = $("#user_pwd").val();
	  		var user_name = $("#user_name").val();
	  		var pwd_qus = $("#user_qus").val();
	  		var pwd_asr = $("#user_asr").val();
	  		var use_tel = $("#use_tel").val();
	  		var user_email = $("#user_email").val();
	  		var user_sex = $("#user_sex").val();
	  		$.ajax({
	             url:"user_info/save.do",
	             data:{"user_id":user_id,"user_type":user_type,"user_pwd":user_pwd,"user_name":user_name,"pwd_qus":pwd_qus,"pwd_asr":pwd_asr,"use_tel":use_tel,"user_email":user_email,"user_sex":user_sex},
	             dataType:"json",
				 method : 'post',
	             async:false,  
	             success:function (data){
	            	 alert(data.msg);
	             }
	  		})
	           
	  	}
	  	
      	function deleteuser_info(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var oneflag = false;
      		var Twoflag = false;
      		var user_id = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			
      			user_id+=","+rows[i].user_id;
      		}
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"user_info/deleteuser_info.do",
            			dataType:"json",
             			data:{
             			"user_id":user_id
             			},
             			success:function (data){//data  相当于  java里面的  object 
            				$.messager.alert('提示',data.msg);
   							if(data.flag == true){
   								dataGrid();
   							}
            			}
            			})
      				}
      			})
      	}
	  </script>
</body>
</html>
