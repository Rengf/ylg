$(function()
{
	$("#agreeRegist").click(
			function(){
			  var user_name=$('#phoneNum').val();
			  var user_pwd=$('#phonePwd').val();
			  //var id=name+1;
			  console.log(user_name,user_pwd)
			    	$.ajax({url : "user_info/save.do",
	                     dataType:"json",
	                     method:'post',
	                     
			             data:{"user_name":user_name,"user_pwd":user_pwd},
			                 success:function (data){
			                	 alert(data.msg);
			                	 window.location.href="Login.jsp"
			                 },
			                 error:function(){
			                	 console.log("注册失败")
			                 }
			                 })

		   })	
			$("#agreelogin").click(
					function(){
					  var user_name=$('#phoneNum').val();
					  var user_pwd=$('#phonePwd').val();
					  //var id=name+1;
					  console.log(user_name,user_pwd)
					    	$.ajax({url : "user_info/userlogin.do",
			                     dataType:"json",
			                     method:'post',
			                     
					             data:{"user_name":user_name,"user_pwd":user_pwd},
					                 success:function(data){
					                	 if(data==1){
					                		 alert("登录成功");
					                		 window.location.href="shouye.do"
					                	 }else{		 
					                		 alert("密码不正确");
					                		 window.location.href="Login.do"}
					                 }
					    	})
					})})