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
    <script src="ylg/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="ylg/js/index.js" type="text/javascript"></script>
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
                            <li><a href="./goodslist.jsp?brand=computer">电脑</a></li>
                            <li><a href="./goodslist.jsp?brand=phone">手机</a></li>
                            <li><a href="./goodslist.jsp?brand=camera">相机</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu">
                <ul class="menuList">
                    <li>全部商品分类</li>
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
                <div class="siderMenu">
                    <ul class="siderBarMenu">
                        <li>
                            <a  href="./goodsdetails.jsp?brand=phone">手机类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuPhone">
                            </ul>
                        </li>
                        <li>
                            <a  href="./goodsdetails.jsp?brand=camera">相机类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuCarema">
                            </ul>
                        </li>
                        <li>
                            <a href="./goodsdetails.jsp?brand=computer">电脑类</a>
                            <i></i>
                            <ul class="siderBarSubMenu siderBarSubMenuPc">
                            </ul>
                        </li>
                        <li>
                            <a href="./goodsdetails.jsp?brand=other">配件类</a>
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
                    <div class="control">
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
                    <div class="phoneBody">
                        <div class="phoneMessage">
                            <div class="phoneMsgImg"><img src="ylg/images/phone.jpg" alt=""></div>
                            <div class="phoneMsg">
                                <h3>智能手机</h3>
                                <i></i>
                                <p>智能手机（Smartphone），是指像个人电脑一样，具有独立的操作系统，大多数是大屏机，而且是触摸电容屏，也有部分是电阻屏，功能强大实用性高</p>
                            </div>
                        </div>
                    </div>
                    <div class="phoneFooter">

                    </div>
                </div>
                <div class="camera">
                    <div class="cameraHeader">
                        <div class="line"></div>
                        <div class="cameraCategory">
                            <h3>相机类</h3>
                            <span>新品上市，强势进入</span>
                        </div>
                    </div>
                    <div class="cameraBody">
                        <div class="cameraBox">
                            <div class="newCameraLeft">
                                
                            </div>
                        </div>
                        <div class="cameraMessage">
                            <div class="cameraMsgImg"><img src="ylg/images/camera.jpg" alt=""></div>
                            <div class="cameraMsg">
                                <h3>单反相机</h3>
                                <i></i>
                                <p>单镜头反光式取景照相机，（SingleLens Reflex Camera，缩写为SLR camera）又称作单反相机。它是指用单镜头并通过此镜头反光取景的 相机</p>
                            </div>
                        </div>
                        <div class="cameraBox">
                            <div class="newCameraRight">
                                
                            </div>
                        </div>
                    </div>
                    <div class="cameraFooter">
                        
                    </div>
                </div>
                <div class="pc">
                    <div class="pcHeader">
                        <div class="line"></div>
                        <div class="pcCategory">
                            <h3>电脑类</h3>
                            <span>新品上市，强势进入</span>
                        </div>
                    </div>
                    <div class="pcBody">
                        <div class="newPc">
                            
                        </div>
                        <div class="pcMessage">
                            <div class="pcMsgImg"><img src="ylg/images/pc.jpg" alt=""></div>
                            <div class="pcMsg">
                                <h3>笔记本电脑</h3>
                                <i></i>
                                <p>笔记本电脑（NoteBook Computer，简称为：NoteBook），亦称笔记型、手提或膝上电脑（英语：LaptopComputer，可简为Laptop），是一种小型、可方便携带的个人电脑。</p>
                            </div>
                        </div>
                    </div>
                    <div class="pcFooter">

                    </div>
                </div>
                <div class="other">
                    <div class="cameraHeader">
                        <div class="line"></div>
                        <div class="otherCategory">
                            <h3>配件类</h3>
                            <span>新品上市，强势进入</span>
                        </div>
                    </div>
                    <div class="otherFooter">

                        <div class="otherListbox">
                            <div class="otherList">
                                <div class="otherImg">
                                    <img src="ylg/images/newPhone.jpg" alt="">
                                </div>
                                <div class="otherName">
                                    <span>苹果 iPhone 6 Plus 128 G</span>
                                </div>
                                <div class="otherBuy">
                                    <span>￥1599.00</span>
                                    <a href="">购买</a>
                                </div>
                            </div>
                        </div>
                        <div class="otherListbox">
                            <div class="otherList">
                                <div class="otherImg">
                                    <img src="ylg/images/newPhone.jpg" alt="">
                                </div>
                                <div class="otherName">
                                    <span>苹果 iPhone 6 Plus 128 G</span>
                                </div>
                                <div class="otherBuy">
                                    <span>￥1599.00</span>
                                    <a href="">购买</a>
                                </div>
                            </div>
                        </div>
                        <div class="otherListbox">
                            <div class="otherList">
                                <div class="otherImg">
                                    <img src="ylg/images/newPhone.jpg" alt="">
                                </div>
                                <div class="otherName">
                                    <span>苹果 iPhone 6 Plus 128 G</span>
                                </div>
                                <div class="otherBuy">
                                    <span>￥1599.00</span>
                                    <a href="">购买</a>
                                </div>
                            </div>
                        </div>
                        <div class="otherListbox">
                            <div class="otherList">
                                <div class="otherImg">
                                    <img src="ylg/images/newPhone.jpg" alt="">
                                </div>
                                <div class="otherName">
                                    <span>苹果 iPhone 6 Plus 128 G</span>
                                </div>
                                <div class="otherBuy">
                                    <span>￥1599.00</span>
                                    <a href="">购买</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="siderBar">
            <div class="siderBarHeader">
                <ul class="siderBarUser">
                    <li class="likeList">
                        <a href="">
                            <span id="username">我的资料</span>
                            <i></i>
                        </a>
                    </li>
                    <li class="likeList">
                        <a href="">
                            <span>我的收藏</span>
                            <i></i>
                        </a>
                    </li>
                    <li class="car">
                        <a href="">
                            <span></span>
                            <p>购物车</p>
                            <i>0</i>
                        </a>
                    </li>
                    <li>
                        <a href=""></a>
                    </li>
                    <li class="likeList">
                        <a href="">
                            <span>我的订单</span>
                            <i></i>
                        </a>
                    </li>
                    <li class="likeList">
                        <a href="">
                            <span>留言</span>
                            <i></i>
                        </a>
                    </li>
                    <li>
                        <a href=""></a>
                    </li>
                    <li class="likeList">
                        <a href="">
                            <span>回到顶部</span>
                            <i></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer">
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
    </div>
    <script src="ylg/js/LoginRegist.js" type="text/javascript"></script>
    <script src="ylg/js/usermessage.js" type="text/javascript"></script>
    <script src="ylg/js/indexMsg.js" type="text/javascript"></script>
</body>

 </html>