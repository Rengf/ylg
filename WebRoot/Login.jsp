<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="<%=basePath%>/easyUIRoot/jquery-1.7.2.min.js"></script>
<script src="js/Regist.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
   <table>
            <tr>
                <td>用户名:</td>
                <td><input id="phoneNum" name="phoneNum" type="text"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input id="phonePwd" name="phonePwd" type="password"></td>
            </tr>
            <tr>
                <button id="agreelogin">登录</button>
            </tr>
        </table>
<!--      <script type="text/javascript">
     $(function () {
     	window.location.href = "shouye.do";
     })
       
     </script> -->
</body>
</html>