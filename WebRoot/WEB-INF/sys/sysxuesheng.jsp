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
				<td> </td>
				<td><input class="easyui-textbox" id="dictremark" /></td>
				<td>字典类型</td>
				<td><input class="easyui-textbox" id="dicttype" /></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dataGrid()" iconcls="icon-search" >查询</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="rest()" >重置</a></td>
			</tr>
		</table>
		</form>
		<div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="newDataDictionary()" iconcls="icon-add">增加</a> 
				<a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="updateDataDictionary()" iconcls="icon-edit">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="deleteDataDictionary()" iconcls="icon-remove">删除</a> 
				
		</div>
	</div>
	<div data-options="region:'center'" style="height:80%;">
		
		<div id="dataGrid"  ></div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:200px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm"  novalidate>
		  <input id="formId" name = "xsid" style = "display:none">
			<div class="fitem">
			
			
			<div class="fitem">
				<label>班级名称:</label> <input name="bjmc" id = "bjmc2" class="easyui-combobox"
					required="true" >
			</div>
			<div class="fitem">
				<label>学生名称:</label> <input name="xsmc" id = "xsmc2" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>学生年龄:</label> <input name="xsnn" id = "xsnn2" class="easyui-validatebox"
					>
			</div>
			<div class="fitem">
				<label>手机:</label> <input name="sjhm" id = "sjhm2" class="easyui-validatebox"
					>
			</div>
			<div class="fitem">
				<label>省份证好:</label> <input name="sfzhm" id = "sfzhm2" class="easyui-validatebox"
					>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveDataDictionary()">提交</a> <a href="javascript:void(0)" class="easyui-linkbutton"
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
		
		$('#dataGrid').datagrid({
				url : 'sys/sysxuesheng.do',
				title : '数据字典配置',
				iconCls : 'icon-save',
             	async:false,  
				fit: true, 
				fitColumns : true,
				singleSelect:false,
				idField : 'xsid',
				queryParams: {          
                dicttype: $("#dicttype").val(), 
                dictremark: $("#dictremark").val()         
              	},
				columns : [ [ {
					field : 'xsid',
					checkbox:true},
					 {
					field : 'xsmc',
					title : '名称',
					width : 120,
					align : 'center'
				}, {
					field : 'xsnn',
					title : '学生年龄',
					width : 120,
					align : 'center'
				}, {
					field : 'sjhm',
					title : '手机号码',
					width : 120,
					align : 'center'
				}, {
					field : 'sfzhm',
					title : '省份证好啊么',
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
		}
		function init(){
			 $.ajax({
             url:"sys/initxuesheng.do",
             dataType:"json",
			 method : 'post',
             async:false,  
             success:function (data){
            	var bjmc =  data.bjmc;
            	$("#bjmc2").combobox({
       			 	data:bjmc,
        			valueField:'id',
       				textField:'text'
       			});
            	}
            })
		}
		function newDataDictionary(){
            $('#dlg').dialog('open').dialog('setTitle','新增菜单');
            $('#fm').form('clear');
        }	
        function updateDataDictionary(){
        	var rows = $('#dataGrid').datagrid('getSelections');
			if(rows == null || rows.length!=1){
   				$.messager.alert('提示',"请选择一行数据");
   				return;
			}
			var id = rows[0].xsid;
        	$.ajax({
             url:"sys/queryxueshengOne.do",
             dataType:"json",
             data:{
             "xsid":id
             },
             success:function (data){//data  相当于  java里面的  object 
             	 $('#dlg').dialog('open').dialog('setTitle','新增数据字典');
          		 $('#fm').form('clear');
          		 var DataDictionary = data.list;
          		 $("#formId").val(DataDictionary.xsid);
          		 $("#xsmc2").val(DataDictionary.xsmc);
          		 $("#xsnn2").val(DataDictionary.xsnn);
          		 $("#sfzhm2").val(DataDictionary.sfzhm);
          		 $("#sjhm2").val(DataDictionary.sjhm);
          		 $("#bjmc2").combobox("setValue",DataDictionary.bjid);
         	 }
         	 })
        }
      	function saveDataDictionary(){
      		$("#fm").form("submit", {
    			url:"sys/savexuesheng.do",
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
      	function deleteDataDictionary(){
      		var rows = $('#dataGrid').datagrid('getSelections');
      		var oneflag = false;
      		var Twoflag = false;
      		var ids = "";
      		for(var i = 0 ; i < rows.length ; i++){
      			
      			ids+=","+rows[i].xsid;
      		}
      			$.messager.confirm("提示","确定删除数据吗？",function(data) {
      				if(data){
      					$.ajax({
             			url:"sys/deletexuesheng.do",
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
	</script>
</body>
</html>
