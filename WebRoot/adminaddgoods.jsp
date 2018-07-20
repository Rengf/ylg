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

 <title>商品添加</title>
 <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="ylgadmin/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="ylgadmin/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="ylgadmin/css/amazeui.min.css" />
    <link rel="stylesheet" href="ylgadmin/css/admin.css">
    <script src="ylgadmin/js/jquery.min.js"></script>
    <script src="ylgadmin/js/app.js?dd=123"></script>
</head>

<body>
    <!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->






    </head>

    <body>
        <header class="am-topbar admin-header">
            <div class="am-topbar-brand"><img src="ylgadmin/i/logo.png"></div>

             <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
            <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
                <li class="kuanjie">
                    <a href="./userlist.html">用户管理</a>
                    <a href="./orderlist.html">订单管理</a>
                    <a href="./admingoodslist.jsp">商品管理</a>
                    <a href="#">个人中心</a>
                    <a href="./systemsetup.html">系统设置</a>
                </li>
                <li class="soso">
                    <p>
                        <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                                <option value="b">全部</option>
                                <option value="o">商品</option>
                                <option value="o">用戶</option>
                            </select>
                    </p>
                    <p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="圆角表单域" /></p>
                    <p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
                </li>
                <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
            </ul>
        </div>
    </header>
    <div class="am-cf admin-main">
        <div class="nav-navicon admin-main admin-sidebar">
            <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"></div>
            <div class="sideMenu">
                <h3 class="am-icon-users"><em></em> <a href="#">会员管理</a></h3>
                <ul>
                    <li><a href="./userlist.html">用戶列表</a> </li>
                    <li><a href="">激活管理员</a></li>
                </ul>
                <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
                <ul>
                    <li><a href="./admingoodslist.jsp">商品列表</a></li>
                    <li class="func" dataType='html' dataLink='msn.htm' iconImg='ylgadmin/images/msn.gif'>添加新商品</li>
                    <li><a href="./goodscategory.html">商品分类</a></li>
                    <li><a href="./comments.html">用户评论</a></li>
                    <li><a href="">商品回收站</a></li>
                    <li><a href="./kucun.html">库存管理 </a></li>
                </ul>
                <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
                <ul>
                    <li><a href="./order.html">订单列表</a></li>
                    <li><a href="">合并订单</a></li>
                    <li><a href="">订单打印</a></li>
                    <li><a href="">添加订单</a></li>
                    <li><a href="">发货单列表</a></li>
                    <li><a href="">换货单列表</a></li>
                </ul>
            </div>

            <script type="text/javascript">
                jQuery(".sideMenu").slide({
                    titCell: "h3", //鼠标触发对象
                    targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                    effect: "slideDown", //targetCell下拉效果
                    delayTime: 300, //效果时间
                    triggerTime: 150, //鼠标延迟触发时间（默认150）
                    defaultPlay: true, //默认是否执行效果（默认true）
                    returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
                });
            </script>
        </div>

        <div class=" admin-content">
            <div class="daohang">
                <ul>
                    <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 你要添加的商品 </li>
				    <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs phone">手机</button></li>
                    <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs computer">电脑</button></li>
                    <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs camera">相机</button></li>
                    <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs other">其它</button></li>
                </ul>
            </div>

            <div class="admin-biaogelist">

                <div class="listbiaoti am-cf">
                    <ul class="am-icon-flag on"> 栏目名称</ul>
                    <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > <a href="#">商品列表</a></dl>
                </div>
                <!-- 添加手机 -->
                <div class="fbneirong addPhone" style="display:none">
                    <form class="am-form">
                    <input name = "PID"  id = "PID" value  = ""  style = "display:none">
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机名：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone1" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机价格：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone2" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">缩略图：</div>
                            <div class="you"><input type="file" id="slt"> </div>
                        </div>

                        <div class="am-form-group am-cf">
                            <div class="zuo">产品图片：</div>
                            <div class="you" style="height: 45px;">
                                <input type="file" id="cpt">
                                <p class="am-form-help">请选择要上传的文件...</p>
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机品牌：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone3" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机特性：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone4" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电池容量：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone5" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机上市时间：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone6" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">快充：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone7" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机操作系统：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone8" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">屏幕尺寸：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone9" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机运行内存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone10" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">存储内存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone11" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机CPU：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone12" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">前置摄像头：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone13" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">后置摄像头：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone14" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">手机颜色：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone15" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">NFC：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone16" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">蓝牙：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone17" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">耳机接口：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone18" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">充电接口：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone19" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">指纹识别：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone20" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">GPS：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone21" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电子罗盘：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone22" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">陀螺仪：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone23" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">包装清单：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone24" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">库存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone25" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">压力感应：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone26" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">网络支持：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone27" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">Sim卡类型：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm phone28" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>

                        <div class="am-form-group am-cf">
                            <div class="you" style="margin-left: 11%;">
                                <span type="submit" class="am-btn am-btn-success am-radius addPhoneSure">发布</span>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 添加电脑 -->
                <div class="fbneirong addComputer" style="display:none">
                    <form class="am-form">
                    <input name = "CID"  id = "COID" value  = ""  style = "display:none">
                        <div class="am-form-group am-cf">
                            <div class="zuo">电脑名：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer1" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电脑简介：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer2" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电脑品牌：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer3" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电脑颜色：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer4" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电池屏幕尺寸：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer5" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">缩略图：</div>
                            <div class="you"><input type="file" id="slt"> </div>
                        </div>

                        <div class="am-form-group am-cf">
                            <div class="zuo">产品图片：</div>
                            <div class="you" style="height: 45px;">
                                <input type="file" id="cpt">
                                <p class="am-form-help">请选择要上传的文件...</p>
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">上市时间：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer6" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">价格：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer7" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">CPU：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer8" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">CPU速度：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer9" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">显卡类型：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer10" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">分辨率：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer11" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">操作系统：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer12" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电池类型：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer13" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">内存容量：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer14" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">机械硬盘容量：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer15" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">显存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer16" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电脑适配器：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer17" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">质保时间：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer18" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">光驱：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer19" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">硬盘：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer20" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">屏幕类型：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer21" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">端口：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer22" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">音效系统：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer23" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">包装清单：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer24" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">重量：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer25" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">库存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm computer26" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="you" style="margin-left: 11%;">
                                <span type="submit" class="am-btn am-btn-success am-radius addComputerSure">发布</span>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- 相机添加 -->
                <div class="fbneirong addCamera" style="display:none">
                    <form class="am-form">
                    <input name = "CID"  id = "Cdid" value  = ""  style = "display:none">
                        <div class="am-form-group am-cf">
                            <div class="zuo">相机名：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera1" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">相机价格：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera2" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">缩略图：</div>
                            <div class="you"><input type="file" id="slt"> </div>
                        </div>

                        <div class="am-form-group am-cf">
                            <div class="zuo">产品图片：</div>
                            <div class="you" style="height: 45px;">
                                <input type="file" id="cpt">
                                <p class="am-form-help">请选择要上传的文件...</p>
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">单反级别：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera4" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">尺寸：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera5" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">像素：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera6" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">存储介质：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera7" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">是否防抖：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera8" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">品牌：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera9" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">上市时间：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera10" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">简介：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera11" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">镜头卡口：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera12" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">屏幕类型：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera13" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">接口参数：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera14" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">电池续航：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera15" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">包装清单：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera16" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">库存：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera17" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">连拍速度：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera1" id="doc-ipt-email-1" placeholder="请输入  ">
                            </div>
                        </div>
                        <div class="am-form-group am-cf">
                            <div class="zuo">特性：</div>
                            <div class="you">
                                <input type="text" class="am-input-sm camera1" id="doc-ipt-pwd-1" placeholder="请输入  ">
                            </div>
                        </div>

                        <div class="am-form-group am-cf">
                            <div class="you" style="margin-left: 11%;">
                                <span type="submit" class="am-btn am-btn-success am-radius addCameraSure">发布</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="foods">
                    <ul>
                        版权所有@2015. 模板收集自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - More Templates<a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                    </ul>
                    <dl>
                        <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
                    </dl>
                </div>




            </div>

        </div>




    </div>

        <!--[if lt IE 9]>
	<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
	<script src="ylgadmin/js/polyfill/rem.min.js"></script>
	<script src="ylgadmin/js/polyfill/respond.min.js"></script>
	<script src="ylgadmin/js/amazeui.legacy.js"></script>
	<![endif]-->

        <!--[if (gte IE 9)|!(IE)]><!-->
        <script src="ylgadmin/js/amazeui.min.js"></script>
        <!--<![endif]-->


        <script src="ylgadmin/js/addgood.js?dd=123"></script>
    </body>

</html>