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
	   <form id = "tableHead">
		<table style = "height:60%;">
			<tr>
				<td>用户名</td>
				<td><input class="easyui-textbox" id="username" /></td>
				<td>密码</td>
				<td><input class="easyui-textbox" id="password" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dataGrid()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newUser()" iconcls="icon-add">增加</a> 
			<a href="javascript:void(0)"class="easyui-linkbutton" 
				onclick="updateUser()" iconcls="icon-edit">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteUser()" iconcls="icon-remove">删除</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="UserToRole()" iconcls="icon-add">分配角色</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="QUeryUserToRole()" iconcls="icon-search" >角色查询</a>
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
				<label>用户名:</label> <input name="username" id = "username2" class="easyui-validatebox"
					required="true">
			</div>
			
			<div class="fitem">
				<label>密&nbsp;&nbsp;&nbsp;码:</label> <input name="password" id = "password2" class="easyui-validatebox"
					required="true" >
			</div>
			
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">提交</a> <a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<div id="dlg2" class="easyui-dialog"
		style="width:1000px;height:500px;"closed="true"
		>
		<form id="fm2"  novalidate>
		  <table style = "height:5%;padding-top:5px">
			<tr>
				<td>启用角色</td>
				<td><input class="easyui-textbox" id="IsNoRole" /></td>
				<td>角色名称</td>
				<td><input class="easyui-textbox" id="rolename" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="DataGrid2()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest2()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div style= "padding:5px 10px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newToRole()" iconcls="icon-add">分配该角色</a> 
			<a href="javascript:void(0)"class="easyui-linkbutton" 
				onclick="restToRole()" iconcls="icon-edit">撤回该角色</a>
		</div>
		<div style = "height:80%">
		<div id="dataGrid2" ></div>
		</div>
	</div>
	<script type="text/javascript">
	var  sysmenuList = null;
	var combobox = null;
	var userAndRole ;
	
		$(function() {
			init();
			dataGrid();

		})
		function dataGrid(){
			$('#dataGrid').datagrid({
				url : 'sys/sysUserList.do',
				title : '系统用户配置',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                username: $("#username").val(), 
                password: $("#password").val()         
              	},
				columns : [ [ {
					field : 'id',
					checkbox:true},
					 {
					field : 'username',
					title : '用户名',
					width : 120,
					align : 'center'
				}, {
					field : 'password',
					title : '密码',
					width : 120,
					align : 'center'
				}/*  , {
					field : 'caozuo',
					title : '操作',
					width : 120,
					align : 'center',
					formatter: function(value,row){
					return ' <a href="javascript:void(0)" class="easyui-linkbutton" onclick="newUser()" iconcls="icon-add">查看权限</a> ';
					}
				} */ ] ],
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
		function init(){
			 $.ajax({
             url:"sys/initUser.do",
             dataType:"json",
			 method : 'post',
             async:false,  
             success:function (data){
            	}
            })
		}
		function newUser(){
            $('#dlg').dialog('open').dialog('setTitle',"新增用户");
            $('#fm').form('clear');
        }	
        function updateUser(){
        	var rows = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var id = rows[0].id;
        	$.ajax({
             url:"sys/queryUserOne.do",
             dataType:"json",
             data:{
             "id":id
             },
             success:function (data){//data  相当于  java里面的  object 
             	 $('#dlg').dialog('open').dialog('setTitle','新增数据字典');
          		 $('#fm').form('clear');
          		 var User = data.User;
          		 $("#formId").val(User.id);
          		 $("#username2").val(User.username);
          		 $("#password2").val(User.password);
         	 }
         	 })
        }
      	function saveUser(){
      		$("#fm").form("submit", {
    			url:"sys/saveUser.do",
    			dataType:"json",
    			method : 'post',
   				success:function(data){
   				data = eval("(" + data + ")");
   				$.messager.alert('提示',data.msg);
   				if(data.flag == true){
   					dataGrid();
            		$('#dlg').dialog('close');
   				}
    			}
			});
      	}
      	function deleteUser(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var oneflag = false;
      		var Twoflag = false;
      		var ids = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			
      			ids+=","+rows[i].id;
      		}
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"sys/deleteUser.do",
            			dataType:"json",
             			data:{
             			"ids":ids
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
      	function rest(){
      	  $("#tableHead").form('clear'); 
      	}
      	function rest2(){
            $('#fm2').form('clear');
      	}
      	function UserToRole () {
      	var rows = $('#dataGrid').datagrid('getSelections');
		if(rows == null || rows.length!=1){
   			$.messager.alert('提示',"请选择一行数据");
   			return;
		}
      	var userid = $('#dataGrid').datagrid('getSelections')[0].id;
      		$.ajax({
             	url:"sys/getUserToRoleOne.do",
            	dataType:"json",
             	async:false,  
             	data:{
             	"id":userid
             	},
             	success:function (data){//data  相当于  java里面的  object 
            		userAndRole = data.userList;
            	}
            })
            $('#dlg2').dialog('open').dialog('setTitle',"系统角色查询");
            DataGrid2();
      	}
      	function DataGrid2(){
      	    var userid = $('#dataGrid').datagrid('getSelections')[0].id;
      		$('#dataGrid2').datagrid({
				url : 'sys/sysRoleList.do',
				title : '系统角色配置',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                   rolename:$("#rolename").val()
              	},
				columns : [ [ {
					field : 'id',
					checkbox:true},
					 {
					field : 'rolename',
					title : '用户名称',
					width : 120,
					align : 'center'
				}  , {
					field : 'caozuo',
					title : '是否拥有',
					width : 120,
					align : 'center',
					formatter: function(value,row){
					if(userAndRole == null || userAndRole == ""){
						return "<a href = 'javascript:void(0)' onclick = 'ToRole(\""+userid+"\",\""+row.id+"\")' >未拥有</a>";
					}
					for(var i = 0 ; i < userAndRole.role.length ; i++){
						if(userid == userAndRole.id && row.id == userAndRole.role[i].id){
							return "已启用";
						}
					}
					return "<a href = 'javascript:void(0)' onclick = 'ToRole(\""+userid+"\",\""+row.id+"\")' >未拥有</a>";
					}
				}  ] ],
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
			$('#dataGrid2').datagrid('clearSelections');
      	}
      	function ToRole(userid,roleId){
      		$.messager.confirm("提示","确定要拥有该角色吗？",function(data) {
      			if(data){
      				$.ajax({
             			url:"sys/ToRole.do",
            			dataType:"json",
             			data:{
             			"UserId":userid,
             			"RoleId":roleId,
             			"flag":true
             			},
             			success:function (data){//data  相当于  java里面的  object 
            				//$.messager.alert('提示',data.msg);
   							if(data.flag == true){
   								UserToRole () ;
   							}
            			}
            		})
      				}
      			})
      	}
      	function newToRole(){
      		var rows = $('#dataGrid2').datagrid('getSelections');
      		var row1 = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var userid = row1[0].id;
			var roleid = rows[0].id;
			ToRole(userid,roleid);
      	}
      	function restToRole(){
      	var rows = $('#dataGrid2').datagrid('getSelections');
      	var row1 = $('#dataGrid').datagrid('getSelections');
		if(rows == null || rows.length!=1){
   			$.messager.alert('提示',"请选择一行数据");
   			return;
		}
		var userid = row1[0].id;
		var roleid = rows[0].id;
		$.messager.confirm("提示","确定要撤回该角色吗？",function(data) {
      		if(data){
      			$.ajax({
             		url:"sys/ToRole.do",
            		dataType:"json",
             		data:{
             		"UserId":userid,
             		"RoleId":roleid,
             		"flag":false
             		},
             		success:function (data){//data  相当于  java里面的  object 
            			//$.messager.alert('提示',data.msg);
   						if(data.flag == true){
   							UserToRole () ;
   						}
            		}
            	})
      		}
      	})
      	}
	</script>
</body>
</html>
