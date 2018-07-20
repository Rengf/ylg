<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	 <link rel="stylesheet" type="text/css" href="<%=basePath%>/easyUIRoot/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/easyUIRoot/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/easyUIRoot/demo.css">
 	<link href="<%=basePath%>/easyUIRoot/themes/icon.css" rel="stylesheet">
<%--   <link href="<%=basePath%>/easyUIRoot/themes/bootstrap/easyui.css" rel="stylesheet">
 --%>  
	<script src="<%=basePath%>/easyUIRoot/jquery-1.7.2.min.js"></script>
				<script type="text/javascript" src="<%=basePath%>/easyUIRoot/easyloader.js"></script>
	
			<script type="text/javascript" src="<%=basePath%>/easyUIRoot/jquery.easyui.mobile.js"></script>
	
		<script type="text/javascript" src="<%=basePath%>/easyUIRoot/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/easyUIRoot/src/jquery.menu.js"></script>
	<script type="text/javascript" src="<%=basePath%>/easyUIRoot/jquery.easyui.min.js"></script>
  
   </head>
  
  <body>
        
  </body>
</html>
