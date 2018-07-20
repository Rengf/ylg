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

<title></title>

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
	<div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'north',title:'North Title',split:true"
			style="height:20%;">234234</div>
		<div data-options="region:'south',title:'South Title',split:true"
			style="height:15%;">4324</div>
		<div data-options="region:'west',title:'菜单栏',split:true"
			style="width:14%;">
			<div id="RightAccordion" class="easyui-accordion"></div>
		</div>
		<div data-options="region:'center',title:'center title'"
			style="padding:5px;background:#eee;">
			<div class="easyui-tabs" fit="true" border="false" id="tabs">
				<div title="首页">欢迎来到益乐购后台管理平台</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		jQuery("#RightAccordion").accordion({ //初始化accordion
			fillSpace : true,
			fit : true,
			border : false,
			animate : false
		});
		 $.ajax({
             url:"sys/queryMenu.do",
             dataType:"json",
             data:{},
             success:function (data){//data  相当于  java里面的  object 
             	var menuOne = data.menuOne;
             	var menuTwo = data.menuTwo;
             	for(var  i = 0 ; i < menuOne.length ; i++){
             		$('#RightAccordion').accordion('add', {
						title : menuOne[i].menuname,
						content : "<ul id='"+menuOne[i].id+"' ></ul>",
						selected : true,
						iconCls : ""//e.Icon
					});
					var dataTree = "[";
					for(var j = 0 ; j <menuTwo.length ; j++ ){
						//根据第一级目录找到第二级目录
						if(menuOne[i].id == menuTwo[j].prendid){ 
							dataTree+="{";
							dataTree+="text : '"+menuTwo[j].menuname+"',";
							dataTree+="iconCls : 'icon-blan',";
							dataTree+="attributes : {";
							dataTree+="url : '<iframe width=\"100%\" height=\"100%\" frameborder=\"0\"  src=\"sys/goToMenu.do?menuaddress="+menuTwo[j].menuaddress+"\" style=\"width:100%;height:100%;margin:0px 0px;\"></iframe>'";
							dataTree+="}";
							dataTree+="},";
						}
					}
					dataTree+="]";
       		      	//实例化树形菜单  
					$("#"+menuOne[i].id+"").tree({
					data : eval(dataTree),
					onClick : function(node) {
						if (node.attributes) {
							Open(node.text, node.attributes.url);
						}
						}
					});
             	}
            	
             }
         });
		

		var treeData = [
				{
					text : "Hbase查询功能列表",
					iconCls : "icon-blan",
					attributes : {
						url : '<iframe width="100%" height="100%" frameborder="0"  src="jsp/queryPriceStock.jsp" style="width:100%;height:100%;margin:0px 0px;"></iframe>'
					}
				}];
		
		//在右边center区域打开菜单，新增tab  
		function Open(text, url) {
			if ($("#tabs").tabs('exists', text)) {
				$('#tabs').tabs('select', text);
			} else {
				$('#tabs').tabs('add', {
					title : text,
					closable : true,
					content : url
				});
			}
		}

		//绑定tabs的右键菜单  
		$("#tabs").tabs({
			onContextMenu : function(e, title) {
				e.preventDefault();
				$('#tabsMenu').menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data("tabTitle", title);
			}
		});

		//实例化menu的onClick事件  
		$("#tabsMenu").menu({
			onClick : function(item) {
				CloseTab(this, item.name);
			}
		});

		//几个关闭事件的实现  
		function CloseTab(menu, type) {
			var curTabTitle = $(menu).data("tabTitle");
			var tabs = $("#tabs");

			if (type === "close") {
				tabs.tabs("close", curTabTitle);
				return;
			}

			var allTabs = tabs.tabs("tabs");
			var closeTabsTitle = [];

			$.each(allTabs, function() {
				var opt = $(this).panel("options");
				if (opt.closable && opt.title != curTabTitle
						&& type === "Other") {
					closeTabsTitle.push(opt.title);
				} else if (opt.closable && type === "All") {
					closeTabsTitle.push(opt.title);
				}
			});

			for (var i = 0; i < closeTabsTitle.length; i++) {
				tabs.tabs("close", closeTabsTitle[i]);
			}
		}
	});
</script>
</html>
