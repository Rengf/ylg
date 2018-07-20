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
				<label>学生姓名:</label> <input name="menuname" id = "name" class="easyui-validatebox"
					required="true">
			</div>
			
			<div class="fitem">
				<label>性别:</label> <input name="menurevel" id = "sex" class="easyui-combobox"
					required="true" >
			</div>
			<div class="fitem"  >
				<label>年龄:</label> <input name="prendid" id = "age" class="easyui-combobox"
					>
			</div>
			<div class="fitem">
				<label>地址:</label> <input name="menuaddress" id = "address" class="easyui-validatebox"
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
				url : 'student/list.do',
				title : '学生',
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
					field : 'id',
					checkbox:true},
					 {
					field : 'name',
					title : '学生姓名',
					width : 120,
					align : 'center'
				}, {
					field : 'sex',
					title : '性别',
					width : 120,
					align : 'center',
					formatter: function(value,row){
						if(value == 1){
							return "男";
						}else{
							return "女";
						}
					}
				}, {
					field : 'age',
					title : '年龄',
					width : 80,
					align : 'center'
				}, {
					field : 'address',
					title : '地址',
					width : 80,
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
	  		/* $.ajax({
	             url:"student/list.do",
	             dataType:"json",
				 method : 'post',
	             async:false,  
	             success:function (data){
	            	  var hh = "<table><tr><td>逐渐</td><td>姓名</td><td>姓别</td><td>年龄</td><td>地址</td></tr>";
	            	
	            	 for(var i = 0 ; i < data.length ; i++){
	            		 var id = data[i].id;
	            		 var name = data[i].name;
	            		 var sex = data[i].sex;
	            		 var age = data[i].age;
	            		 var address = data[i].address;
	            		 hh+= "<tr>";
	            		 hh+="<td>"+id+"</td>"
	            		 hh+="<td>"+name+"</td>"
	            		 hh+="<td>"+sex+"</td>"
	            		 hh+="<td>"+age+"</td>"
	            		 hh+="<td>"+address+"</td>"
	            		 hh+="</tr>";
	            	 }
	            	 hh+="</table>";
	            	 $("#tableDiv").html(hh); 
	             }
	            }) */
	  	}
	  	function newMenu(){
            $('#dlg').dialog('open').dialog('setTitle','新增菜单');
            $('#fm').form('clear');
            $("#prendidDiv").hide();
        }	
	  	function saveMenu(){
	  		var name = $("#name").val();
	  		var sex = $("#sex").val();
	  		var age = $("#age").val();
	  		var address = $("#address").val();
	  		$.ajax({
	             url:"student/save.do",
	             data:{"name":name,"sex":sex,"age":age,"address":address},
	             dataType:"json",
				 method : 'post',
	             async:false,  
	             success:function (data){
	            	 alert(data.msg);
	             }
	  		})
	           
	  	}
	  </script>
</body>
</html>
