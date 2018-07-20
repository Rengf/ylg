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
				<td>菜单名称</td>
				<td><input class="easyui-textbox" id="menuName" /></td>
				<td>父级菜单</td>
				<td><input class="easyui-combobox" id="prendId" /></td>
				<td>菜单级别</td>
				<td><input class="easyui-combobox" id="menuLevel" /></td>
				<td>菜单地址</td>
				<td><input class="easyui-textbox" id="menuAddress" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dataGrid()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newMenu()" iconcls="icon-add">增加</a> 
				<a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="updateMenu()" iconcls="icon-edit">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteMenu()" iconcls="icon-remove">删除</a> 
				
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
				<label>菜单名称:</label> <input name="menuname" id = "menuname2" class="easyui-validatebox"
					required="true">
					
			</div>
			
			<div class="fitem">
				<label>菜单级别:</label> <input name="menurevel" id = "menurevel" class="easyui-combobox"
					required="true" >
			</div>
			<div class="fitem" id = "prendidDiv" >
				<label>父类菜单:</label> <input name="prendid" id = "prendid" class="easyui-combobox"
					>
			</div>
			<div class="fitem">
				<label>菜单地址:</label> <input name="menuaddress" id = "menuaddress2" class="easyui-validatebox"
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
	var  sysmenuList = null;
	var combobox = null;
		$(function() {
			init();
			dataGrid();

		})
		function dataGrid(){
		var level = $("#menuLevel").combobox("getValue");
		if("" == level){
			level = -1;
		}
		$('#dataGrid').datagrid({
				url : 'sys/sysmenuList.do',
				title : '菜单管理页面',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'id',
				queryParams: {          
                menuname: $("#menuName").val(), 
                prendid:$("#prendId").combobox("getValue"),           
                menurevel:level,           
                menuaddress: $("#menuAddress").val()         
              	},
				columns : [ [ {
					field : 'id',
					checkbox:true},
					 {
					field : 'menuname',
					title : '菜单名称',
					width : 120,
					align : 'center'
				}, {
					field : 'prendid',
					title : '父级菜单',
					width : 120,
					align : 'center',
					formatter: function(value,row){
						 for(var i = 0 ; i < sysmenuList.length ; i++ ){
							if(value == sysmenuList[i].id){
								return sysmenuList[i].text;
							}
						}
					}
				}, {
					field : 'menurevel',
					title : '菜单级别',
					width : 80,
					align : 'center',
					formatter: function(value,row){
						 for(var i = 0 ; i < combobox.length ; i++ ){
							if(value == combobox[i].id){
								return combobox[i].text;
							}
						}
					}
				}, {
					field : 'menuaddress',
					title : '菜单地址',
					width : 80,
					align : 'center'
				}, ] ],
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
                combobox = data.combobox;
             	sysmenuList = data.sysMenulist;
             	$("#prendid,prendId").combobox({
       			 	data:sysmenuList,
        			valueField:'id',
       				textField:'text'
       			});
       			$("#menuLevel").combobox({
       			 	data:combobox,
        			valueField:'id',
       				textField:'text',
       			});
             	$("#menurevel").combobox({
       			 	data:combobox,
        			valueField:'id',
       				textField:'text',
       				onSelect:function(record){
       					//选择父级菜单
                    	if( "2" == record.id){
            			   $("#prendidDiv").show();
                    	}else{
            			   $("#prendidDiv").hide();
                    	}
                	}
    				});
            	}
            })
		}
		function newMenu(){
            $('#dlg').dialog('open').dialog('setTitle','新增菜单');
            $('#fm').form('clear');
            $("#prendidDiv").hide();
        }	
        function updateMenu(){
        	var rows = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var id = rows[0].id;
        	$.ajax({
             url:"sys/queryMenuOne.do",
             dataType:"json",
             data:{
             "id":id
             },
             success:function (data){//data  相当于  java里面的  object 
             	 $('#dlg').dialog('open').dialog('setTitle','新增菜单');
          		 $('#fm').form('clear');
          		 var menu = data.menu;
          		 $("#formId").val(menu.id);
          		 $("#menuname2").val(menu.menuname);
          		 $("#menurevel").combobox("setValue",menu.menurevel);
          		 $("#prendid").combobox("setValue",menu.prendid);
          		 $("#menuaddress2").val(menu.menuaddress);
         	 }
         	 })
        }
      	function saveMenu(){
      		$("#fm").form("submit", {
    			url:"sys/saveMenu.do",
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
      	function deleteMenu(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var oneflag = false;
      		var Twoflag = false;
      		var ids = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			if(rows[i].menurevel == 1 ){
      			  oneflag = true;
      			}
      			if(rows[i].menurevel == 2 ){
      			  Twoflag = true;
      			}
      			ids+=","+rows[i].id;
      		}
      		if(oneflag && Twoflag){
   				$.messager.alert("提示","多行数据里面存在一级菜单和二级菜单，不可删除");
   				return;
      		}
      		if(oneflag || Twoflag){
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"sys/deleteMenu.do",
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
      	}
      	function rest(){
      	  $("#tableHead").form('clear'); 
      	}
	</script>
</body>
</html>
