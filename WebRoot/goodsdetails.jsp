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

 <title>首页</title>
 <link rel="stylesheet" href="ylg/css/reset.css">
    <link rel="stylesheet" href="ylg/css/index.css">
    <link rel="stylesheet" href="ylg/css/details.css">
    <script src="ylg/js/jquery-3.1.1.min.js" type="text/javascript"></script>

</head>

<body>
    <div class="warpper">
        <div class="header">
            <div class="logo">
                <div class="logoImg"></div>
                <div class="search">
                    <div class="searchBox">
                        <input type="text">
                        <a href=""></a>
                    </div>
                    <div class="searchList">
                        <ul>
                            <li><a href="">电脑</a></li>
                            <li><a href="">手机</a></li>
                            <li><a href="">相机</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu">
                <ul class="menuList">
                    <li id="menuList1">全部商品分类</li>
                    <li>
                        <a href="./goodsdetails.jsp?brand=computer"></a>
                    </li>
                    <li><a href="./index.jsp">首页</a></li>
                    <li><a href="./goodslist.jsp?goods_id=1">智能手机</a></li>
                    <li><a href="./goodslist.jsp?goods_id=2">笔记本电脑</a></li>
                    <li><a href="./goodslist.jsp?goods_id=3">相机</a></li>
                    <li><a href="./goodslist.jsp?goods_id=4">更多配件</a></li>
                </ul>
            </div>
        </div>
        <div class="body">
            <div class="rollingGraph">
                <div class="siderMenu" id="siderMenu" style="opacity:0">
                    <ul class="siderBarMenu">
                        <li>
                            <a href="">手机类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuPhone">
            
                            </ul>
                        </li>
                        <li>
                            <a href="">相机类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuCarema">
                            
                            </ul>
                        </li>
                        <li>
                            <a href="">电脑类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuPc">
                                
                            </ul>
                        </li>
                        <li>
                            <a href="">配件类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuOther">
                                
                            </ul>
                        </li>
                        <li>
                            <a href="">热卖新品</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuNew">
                                
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="rollingImg">
                    <div class="viewPort" id="viewPort">
                        <ul class="boxSlider" id="boxSlider" style="left:-1920px;">
                            <li><img src="ylg/images/2.jpg" alt=""></li>
                            <li><img src="ylg/images/1.jpg" alt=""></li>
                            <li><img src="ylg/images/2.jpg" alt=""></li>
                            <li><img src="ylg/images/1.jpg" alt=""></li>
                        </ul>
                    </div>
                    <div class="control" style="display:none">
                        <a href="javascript:;" id="prev" class="prev"></a>
                        <a href="javascript:;" id="next" class="next"></a>
                    </div>
                </div>
            </div>
            <div class="goodsDetails">
                
            </div>
            <div class="allMsg">

            </div>
        </div>
    </div>
    <script src="ylg/js/indexMsg.js" type="text/javascript"></script>
    <script src="ylg/js/index.js" type="text/javascript"></script>
     <script src="ylg/js/goodsdetails.js" type="text/javascript"></script>
     <script src="ylg/js/brandlist.js" type="text/javascript"></script>
</body>

</html>