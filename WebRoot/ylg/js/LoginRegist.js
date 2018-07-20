var sessionid = '${not empty fns:getPrincipal() ? fns:getPrincipal().sessionid : ""}';
$(document).ready(function() {

    //登录
    $("#login").click(function() {
        var user = $(".userInput").val();
        var inputPassword = $(".passwordInput").val();

        if (user == "" || inputPassword == "") {
            $(".loginErrorMessage").html("<p>登录信息不能为空！</p>");
            return false;
        } else {
            $(".loginErrorMessage").html("");
        }
        $.ajax({
            url: 'user_info/login.do',
            type: 'post',
            dataType: 'json',
            data: {
                user_name: user,
                user_pwd: inputPassword
            },
            success:function(user){
            	console.log(user)
            	$('#username').append(user.username);
            	window.location.href="index.jsp"
            }
        })

    })


    //跳转注册
    $("#toRegist").click(
        function() {
            $(".loginFrme").css("display", "none");
            $(".registFrme").css("display", "block");
        }
    );

    $("#toLogin").click(
            function() {
                $(".registFrme").css("display", "none");
                $(".loginFrme").css("display", "block");
            }
        )
        //注册
    var tel;
    var email;
    var password;
    $("#regist").click(
            function() {
                tel = $(".userTel").val();
                email = $(".userEmail").val();
                password = $(".passwordRegistInput").val();
                repassword = $(".repasswordRegistInput").val();
                //不能为空
                if (tel == "" || email == "" || password == "" || repassword == "") {
                    $(".registErrorMessage").html("<p>注册信息不能为空！</p>");
                    return false;
                } else {
                    $(".registErrorMessage").html("");
                }
                //验证手机
                if (!(/^1(3|4|5|7|8)\d{9}$/.test(tel))) {
                    $(".registErrorMessage").html("<p>你输入的电话号码有误，请重新输入！</p>");
                    return false;
                } else {
                    $(".registErrorMessage").html("");
                }
                //验证邮箱
                if (!(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))) {
                    $(".registErrorMessage").html("<p>你输入的邮箱格式有误，请重新输入！</p>");
                    return false;
                } else {
                    $(".registErrorMessage").html("");
                }
                //验证密码
                if (!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(password))) {
                    $(".registErrorMessage").html("<p>密码格式有误，请重新输入！</p>");
                    return false;
                } else {
                    $(".registErrorMessage").html("");
                }
                //验证密码是否一致
                if (!password == repassword) {
                    $(".registErrorMessage").html("<p>两次密码不一致，请核对后输入！</p>");
                    return false;
                } else {
                    $(".registErrorMessage").html("");
                }
                $(".registFrme").css("display", "none");
                $(".protectFrme").css("display", "block");

            })
        //确认注册
    $("#sure").click(
        function() {
            problem = $(".select option:selected").text();
            answer = $(".answerInput").val();
            //不能为空
            if (problem == "" || answer == "") {
                $(".protectErrorMessage").html("<p>密保信息不能为空，该密保用于找回密码！</p>");
                return false;
            } else {
                $(".protectErrorMessage").html("");
            }
            var username = "ylg" + tel;
            var user_type=0
            console.log(username)
            $.ajax({
                url: 'user_info/save.do',
                data: {
                	user_type:0,
                	user_pwd: password,
                    user_name: username,
                    pwd_qus: problem,
                    pwd_asr: answer,
                    user_tel: tel,
                    user_email: email,
                    user_sex:""
                },
                type: 'post',
                cache: false,
                dataType: 'json',
                success: function(data) {
                    // if (data.userInfo) {
                    //     $('#loginmessage').html('登陆成功');
                    //     setTimeout(function() {
                    //         window.location.href = data.redirectUrl;
                    //     }, 1000)
                    // } else {
                    //     $('#loginmessage').html('登陆失败，用户名或者密码错误！');
                    // }
                    console.log('注册成功')
                },
                error: function(err) {
                    console.log(err);
                }
            });

        })
})