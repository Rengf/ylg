<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
 <title>商品列表页</title>
 <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="ylgadmin/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="ylgadmin/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="ylgadmin/css/amazeui.min.css" />
    <link rel="stylesheet" href="ylgadmin/css/amazeui.min.css" />
    <link rel="stylesheet" href="ylgadmin/css/admin.css">
    <script src="ylgadmin/js/jquery.min.js"></script>
    <script src="ylgadmin/js/app.js"></script>
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
                        <a href="./adminuserlist.jsp">用户管理</a>
                        <a href="./adminorderlist.jsp">订单管理</a>
                        <a href="./admingoodslist.jsp">商品管理</a>
                        <a href="#">个人中心</a>
                        <a href="./adminsystemsetup.jsp">系统设置</a>
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
                    <h3 class="am-icon-users"><em></em> <a href="#">用户管理</a></h3>
                    <ul>
                        <li><a href="./adminuserlist.jsp">用戶列表</a> </li>
                        <li><a href="./adminchangeuser.jsp">激活管理员</a></li>
                    </ul>
                    <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
                    <ul>
                        <li><a href="admingoodslist.jsp">商品列表</a></li>
                        <li class="func" dataType='html' iconImg='adminylg/images/msn.gif'><a href="./adminaddgoods.jsp">添加商品</a></li>
                        <li><a href="./admingoodscategory.jsp">商品分类</a></li>
                        <li><a href="./admincomments.jsp">用户评论</a></li>
                        <li><a href="">商品回收站</a></li>
                        <li><a href="./kucun.jsp">库存管理 </a></li>
                    </ul>
                    <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
                    <ul>
                        <li><a href="./order.jsp">订单列表</a></li>
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
                        <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页 </li>
						<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心</button></li>
                        <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">用戶管理</button></li>
                        <li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">商品管理</button></li>
                    </ul>
                </div>

                <div class="admin-biaogelist">

                    <div class="listbiaoti am-cf" id="listtitle">
                        <ul class="am-icon-flag on"> 商品列表</ul>
                        <dl class="am-icon-home" style="float: right;"> 当前位置：商品列表 > <a href="#">商品列表</a></dl>
                    </div>

                    <form class="am-form am-g">
                        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
                            <thead>
                                <tr class="am-success">
                                    <th class="table-check"><input type="checkbox" /></th>
                                    <th class="table-id">编号</th>
                                    <th class="table-type">商品名</th>
                                    <th class="table-type">价格</th>
                                    <th class="table-type">品牌</th>
                                    <th class="table-type">颜色</th>
                                    <th class="table-type">尺寸</th>
                                    <th class="table-type">上市时间</th>
                                    <th class="table-type">库存</th>
                                    <th width="163px" class="table-set">操作</th>
                                </tr>
                            </thead>
                            <tbody class="goodslist">
                                
                            </tbody>
                        </table>

                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 删除</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 上架</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 下架</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 移动</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
                        </div>

                        <ul class="am-pagination am-fr">
                            <li class="am-disabled"><a href="#">«</a></li>
                            <li class="am-active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">»</a></li>
                        </ul>




                        <hr />
                        <p>注：.....</p>
                    </form>




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
		<script src="WebRoot/ylgadmin/js/polyfill/rem.min.js" type="text/javascript"></script>
		<script src="ylgadmin/js/polyfill/respond.min.js"></script>
		<script src="ylgadmin/js/amazeui.legacy.js"></script>
		<![endif]-->

        <!--[if (gte IE 9)|!(IE)]><!-->
        <script src="ylgadmin/js/amazeui.min.js"></script>
        <!--<![endif]-->

        <script src="ylgadmin/js/goodsList.js"></script>
        <script src="ylgadmin/js/admincategory.js"></script>

    </body>

</html>