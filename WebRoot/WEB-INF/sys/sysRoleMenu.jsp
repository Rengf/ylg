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
				<td>角色名称</td>
				<td><input class="easyui-textbox" id="rolename" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dataGrid()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newRole()" iconcls="icon-add">增加</a> 
			<a href="javascript:void(0)"class="easyui-linkbutton" 
				onclick="updateRole()" iconcls="icon-edit">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteRole()" iconcls="icon-remove">删除</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="MenuToMenu()" iconcls="icon-add">分配菜单</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="QUeryMenuToMenu()" iconcls="icon-search" >菜单查询</a>
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
				<label>角色名称:</label> <input name="rolename" id = "Rolename2" class="easyui-validatebox"
					required="true">
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveRole()">提交</a> <a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<div id="dlg2" class="easyui-dialog"
		style="width:1000px;height:500px;"closed="true"
		>
		<form id="fm2"  novalidate>
		  <table style = "height:5%;padding-top:5px">
			<tr>
				<td>启用菜单</td>
				<td><input class="easyui-textbox" id="IsNoMenu" /></td>
				<td>菜单名称</td>
				<td><input class="easyui-textbox" id="Menuname" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="DataGrid2()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest2()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div style= "padding:5px 10px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newToMenu()" iconcls="icon-add">角色分配菜单</a> 
			<a href="javascript:void(0)"class="easyui-linkbutton" 
				onclick="restToMenu()" iconcls="icon-edit">撤回分配菜单</a>
		</div>
		<div style = "height:80%">
		<div id="dataGrid2" ></div>
		</div>
	</div>
	<script type="text/javascript">
	var  sysmenuList = null;
	var combobox = null;
	var MenuAndMenu ;
		$(function() {
			init();
			dataGrid();

		})
		function dataGrid(){
			$('#dataGrid').datagrid({
				url : 'sys/sysRoleList.do',
				title : '系统角色配置',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                rolename: $("#rolename").val()
              	},
				columns : [ [ {
					field : 'id',
					checkbox:true},
					 {
					field : 'rolename',
					title : '角色名称',
					width : 120,
					align : 'center'
				}/*  , {
					field : 'caozuo',
					title : '操作',
					width : 120,
					align : 'center',
					formatter: function(value,row){
					return ' <a href="javascript:void(0)" class="easyui-linkbutton" onclick="newMenu()" iconcls="icon-add">查看权限</a> ';
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
             url:"sys/initMenu.do",
             dataType:"json",
			 method : 'post',
             async:false,  
             success:function (data){
            	}
            })
		}
		function newRole(){
            $('#dlg').dialog('open').dialog('setTitle',"新增用户");
            $('#fm').form('clear');
        }	
        function updateRole(){
        	var rows = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var id = rows[0].id;
        	$.ajax({
             url:"sys/queryRoleOne.do",
             dataType:"json",
             data:{
             "id":id
             },
             success:function (data){//data  相当于  java里面的  object 
             	 $('#dlg').dialog('open').dialog('setTitle','新增数据字典');
          		 $('#fm').form('clear');
          		 var Role = data.Role;
          		 $("#formId").val(Role.id);
          		 $("#Rolename2").val(Role.rolename);
         	 }
         	 })
        }
      	function saveRole(){
      		$("#fm").form("submit", {
    			url:"sys/saveRole.do",
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
      	function deleteRole(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var ids = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			
      			ids+=","+rows[i].id;
      		}
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"sys/deleteRole.do",
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
      	function MenuToMenu () {
      	var rows = $('#dataGrid').datagrid('getSelections');
		if(rows == null || rows.length!=1){
   			$.messager.alert('提示',"请选择一行数据");
   			return;
		}
      	var Roleid = $('#dataGrid').datagrid('getSelections')[0].id;
      	
      		$.ajax({
             	url:"sys/getRoleToMenuOne.do",
            	dataType:"json",
             	async:false,  
             	data:{
             	"id":Roleid
             	},
             	success:function (data){//data  相当于  java里面的  object 
            		MenuAndMenu = data.roleList;
            	}
            })
            $('#dlg2').dialog('open').dialog('setTitle',"角色菜单查询");
            DataGrid2();
      	}
      	
      	function DataGrid2(){
      	    var Roleid = $('#dataGrid').datagrid('getSelections')[0].id;
      		$('#dataGrid2').datagrid({
				url : 'sys/sysmenuList.do',
				title : '角色菜单配置',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                   menuname:$("#Menuname").val()
              	},
				columns : [ [ {
					field : 'id',
					checkbox:true},
					 {
					field : 'menuname',
					title : '菜单名称',
					width : 120,
					align : 'center'
				}  , {
					field : 'caozuo',
					title : '是否拥有',
					width : 120,
					align : 'center',
					formatter: function(value,row){
					if(MenuAndMenu == null || MenuAndMenu == ""){
						return "<a href = 'javascript:void(0)' onclick = 'ToMenu(\""+Roleid+"\",\""+row.id+"\")' >未拥有</a>";
					}
					for(var i = 0 ; i < MenuAndMenu.menu.length ; i++){
						if(Roleid == MenuAndMenu.id && row.id == MenuAndMenu.menu[i].id){
							return "已启用";
						}
					}
					return "<a href = 'javascript:void(0)' onclick = 'ToMenu(\""+Roleid+"\",\""+row.id+"\")' >未拥有</a>";
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
      	function ToMenu(Roleid,MenuId){
      		$.messager.confirm("提示","确定要拥有该菜单吗？",function(data) {
      			if(data){
      				$.ajax({
             			url:"sys/ToMenu.do",
            			dataType:"json",
             			data:{
             			"RoleId":Roleid,
             			"MenuId":MenuId,
             			"flag":true
             			},
             			success:function (data){//data  相当于  java里面的  object 
            				//$.messager.alert('提示',data.msg);
   							if(data.flag == true){
   								MenuToMenu () ;
   							}
            			}
            		})
      				}
      			})
      	}
      	function newToMenu(){
      		var rows = $('#dataGrid2').datagrid('getSelections');
      		var row1 = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var Roleid = row1[0].id;
			var Menuid = rows[0].id;
			ToMenu(Roleid,Menuid);
      	}
      	function restToMenu(){
      	var rows = $('#dataGrid2').datagrid('getSelections');
      	var row1 = $('#dataGrid').datagrid('getSelections');
		if(rows == null || rows.length!=1){
   			$.messager.alert('提示',"请选择一行数据");
   			return;
		}
		var RoleId = row1[0].id;
		var Menuid = rows[0].id;
		$.messager.confirm("提示","确定要撤回该菜单吗？",function(data) {
      		if(data){
      			$.ajax({
             		url:"sys/ToMenu.do",
            		dataType:"json",
             		data:{
             		"RoleId":RoleId,
             		"MenuId":Menuid,
             		"flag":false
             		},
             		success:function (data){//data  相当于  java里面的  object 
            			//$.messager.alert('提示',data.msg);
   						if(data.flag == true){
   							MenuToMenu () ;
   						}
            		}
            	})
      		}
      	})
      	}
	</script>
</body>
</html>
