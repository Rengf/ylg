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

 <title>登录</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="ylg/css/reset.css">
    <link rel="stylesheet" href="ylg/css/LoginRegist.css">
    <script src="ylg/js/jquery-3.1.1.min.js" type="text/javascript"></script>
</head>

<body>
    <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <div class="warpper">
        <div class="header"></div>
        <div class="body">
            <div class="login">
                <div class="loginAdvertising">

                </div>
                <!-- 登录 -->
                <div class="loginFrme" style="display:block">
                    <div class="loginHeader">
                        <span>登录</span>
                    </div>
                    <div class="loginBody">
                        <div class="loginErrorMessage">
                            <p>登录信息不能为空</p>
                        </div>
                        <div class="loginForm">
                            <form>
                                <div class="user">
                                    <label for="user" class="userLable"></label>
                                    <input type="text" class="userInput" placeholder="请输入邮箱/电话">
                                </div>
                                <div class="password">
                                    <label for="password" class="passwordLable"></label>
                                    <input type="password" class="passwordInput" placeholder="请输入密码">
                                </div>
                                <div class="forget">
                                    <p><a href="#">忘记密码？</a>还没有账户，去<a href="javascript:;" id="toRegist">注册</a>！</p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="loginFooter">
                        <form style="display:none">
                            <label for="code">
                                    <span>验证码</span>
                                    <input type="text" placeholder="输入验证码">
                                </label>
                        </form>
                        <div class="submit">
                            <input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" id="login">
                        </div>
                    </div>
                </div>
                <!-- 注册 -->
                <div class="registFrme" style="display:none">
                    <div class="registHeader">
                        <span>注册</span>
                    </div>
                    <div class="registBody">
                        <div class="registErrorMessage">
                            <p>注册信息不能为空</p>
                        </div>
                        <div class="registForm">
                            <form>
                                <div class="tel inputBox">
                                    <label for="user" class="userTelLable"><span>电话：</span></label>
                                    <input type="text" class="userTel" placeholder="请输入电话号码">
                                </div>
                                <div class="email inputBox">
                                    <label for="user" class="userEmailLable"><span>邮箱：</span></label>
                                    <input type="text" class="userEmail" placeholder="请输入邮箱地址">
                                </div>
                                <div class="registPassword inputBox">
                                    <label for="password" class="userPasswordLable"><span>密码：</span></label>
                                    <input type="password" class="passwordRegistInput" placeholder="请输入密码">
                                </div>
                                <div class="repassword inputBox">
                                    <label for="repassword" class="userPasswordLable"><span>密码：</span></label>
                                    <input type="password" class="repasswordRegistInput" placeholder="请再次输入密码">
                                </div>
                                <div class="forget">
                                    <p>已经拥有账户，去<a href="javascript:;" id="toLogin">登录</a>！</p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="loginFooter">
                        <div class="submit">
                            <input type="submit" value="注&nbsp;&nbsp;&nbsp;&nbsp;册" id="regist">
                        </div>
                    </div>
                </div>
                <!-- 密保 -->
                <div class="protectFrme" style="display:none">
                    <div class="registHeader">
                        <span>密保</span>
                    </div>
                    <div class="registBody">
                        <div class="protectErrorMessage">
                            <p>密保信息不能为空，该密保用于找回密码！</p>
                        </div>
                        <div class="registForm">
                            <form>
                                <div class="inputBox">
                                    <label for="user" class="problem"><span>问题：</span></label>
                                    <select name="" class="select">
                                        <option value="1">香瓜</option>
                                        <option value="2">黄瓜</option>
                                        <option value="3">西瓜</option>
                                        <option value="4">南瓜</option>
                                        <option value="5">冬瓜</option>
                                    </select>
                                </div>
                                <div class="inputBox">
                                    <label for="user" class="answer"><span>答案：</span></label>
                                    <input type="text" class="answerInput" placeholder="请输入答案">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="loginFooter">
                        <div class="submit">
                            <input type="submit" value="确&nbsp;&nbsp;&nbsp;&nbsp;定" id="sure">
                        </div>
                    </div>
                </div>
            </div>




        </div>
        <div class="footer">
            <p>Copyright 2018 by Renguofeng 渝ICP备18004455号</p>
        </div>
    </div>
    <script src="ylg/js/LoginRegist.js" async defer></script>
</body>

</html>