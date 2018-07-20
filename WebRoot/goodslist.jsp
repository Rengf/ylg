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

  <title>商城</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="ylg/css/reset.css">
    <link rel="stylesheet" href="ylg/css/index.css">
    <script src="ylg/js/jquery-3.1.1.min.js" type="text/javascript"></script>
</head>

<body style="overflow-y:scroll;">
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
                            <li><a href="./goodslist.jsp?goods_id=1">电脑</a></li>
                            <li><a href="./goodslist.jsp?goods_id=2">手机</a></li>
                            <li><a href="./goodslist.jsp?goods_id=3">相机</a></li>
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
            <div class="category">
                <div class="phone">
                    <div class="phoneHeader">
                        <div class="line"></div>
                        <div class="phoneCategory">
                            <h3>手机类</h3>
                            <span>新品上市，强势进入</span>
                        </div>
                    </div>
                    <div class="phoneFooter phonesNewList" style="top:50px;">
                        
                        
                    </div>
                </div>
            </div>
            <div class="category" style="top:-370px;">
                <div class="phone">
                    <div class="phoneHeader">
                        <div class="line"></div>
                        <div class="phoneCategory">
                            <h3>更多选择</h3>
                            <span>服务至上，包你满意</span>
                        </div>
                    </div>
                    <div class="phoneFooter phonesList" style="top:50px;">
                        
                    </div>
                    <div class="phoneFooter" style="top:50px;">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" style="margin-top:-350px;">
        <div class="footerLeft">
            <span>益乐购系统</span>
            <p>15928221807</p>
            <a href="">24小时服务热线</a>
        </div>
        <i></i>
        <div class="footerRight">
            <div class="footerRightHeader">
                <div class="server">
                    <span>服务保障</span>
                    <ul>
                        <li>
                            <a href="">正品保证</a>
                        </li>
                        <li>
                            <a href="">7天无理由退货</a>
                        </li>
                        <li>
                            <a href="">退货返运费</a>
                        </li>
                        <li>
                            <a href="">7*15小时客服服务</a>
                        </li>
                    </ul>
                </div>
                <div class="server">
                    <span>支付方式</span>
                    <ul>
                        <li>
                            <a href="">公司转账</a>
                        </li>
                        <li>
                            <a href="">货到付款</a>
                        </li>
                        <li>
                            <a href="">在线支付</a>
                        </li>
                        <li>
                            <a href="">分期付款</a>
                        </li>
                    </ul>
                </div>
                <div class="server">
                    <span>商家服务</span>
                    <ul>
                        <li>
                            <a href="">商家入驻</a>
                        </li>
                        <li>
                            <a href="">培训中心</a>
                        </li>
                        <li>
                            <a href="">广告服务</a>
                        </li>
                        <li>
                            <a href="">市场服务</a>
                        </li>
                    </ul>
                </div>
                <div class="server">
                    <span>服务保障</span>
                    <ul>
                        <li>
                            <a href="">正品保证</a>
                        </li>
                        <li>
                            <a href="">7天无理由退换</a>
                        </li>
                        <li>
                            <a href="">退货返运费</a>
                        </li>
                        <li>
                            <a href="">7*15小时客服服务</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="copyright"><span>Copyright 2018 by Renguofeng <a href="http://www.miitbeian.gov.cn">渝ICP备18004455号</a></span></div>
        </div>
    </div>
    <script src="ylg/js/brandlist.js" type="text/javascript"></script>
    <script src="ylg/js/index.js" type="text/javascript"></script>
     <script src="ylg/js/header.js" type="text/javascript"></script>
    <script src="ylg/js/goodslist.js" type="text/javascript"></script>
</body>

</html>