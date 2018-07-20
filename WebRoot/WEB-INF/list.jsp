<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
   <table id = "mytable">
       <thead>
    		<tr>
    		  <th>编号</th>
    		  <th>用户名</th>
    		  <th>密码</th>
    		  <th>年龄</th>
    		  <th>性别</th>
    		  <th>操作</th>
    		</tr>
    	</thead>	
    		<tbody id  = "mytbody">
    		   
    		</tbody>
   </table>
   <div id = "myxiugai">
     
   
   </div>
 <!--   <button onclick = "add()">添加</button> -->
   <script type="text/javascript">
   
    /*  function add(){
       
       var aa = "";
       aa+="<tr>";
       aa+="<td style = 'color:red'>1</td>";
       aa+="<td>陈佳伟</td>";
       aa+="<td>123456</td>";
       aa+="<td>24</td>";
       aa+="<td>男</td>";
       aa+="<td>无</td>";
       aa+="</tr>";
       
        $("#mytbody").html(aa);
     } */
   
   	var list ;
   //当页面的html标签和css样式加载完之后就会执行下面的这个事件
       $(function(){
          //初始化这个页面信息
          init();
      })
      function init(){
         $.ajax({
             url:"query.do",
             dataType:"json",
             success:function (data){//data  相当于  java里面的  object 
                list =  data.gg;
              	var aa = "";
                 for( var i =  0 ; i < list.length;i++){
                 
                    aa+="<tr>";
    				aa+="<td style = 'color:red'>"+list[i].id+"</td>";
     				aa+="<td>"+list[i].name+"</td>";
     				aa+="<td>"+list[i].password+"</td>";
     		 		aa+="<td>"+list[i].age+"</td>";
      				aa+="<td>"+list[i].sex+"</td>";
                    aa+="<td><button  onclick = 'update("+list[i].id+")'>修改</button><button>删除</button></td>";
                    aa+="</tr>";
                   
                
                }
                $("#mytable").show(); 
                 $("#mytbody").html(aa);
                 $("#myxiugai").hide();
             }
         })
         
      } 
      function update(fff){
       var aa = "";
            for(var i=0;i<list.length;i++){
              if(list[i].id==fff){//list[i]
                var name =  list[i].name;
                var age =  list[i].age;
                var sex =  list[i].sex;
                var password =  list[i].password;
               
                aa+="用户名<input value = "+name+" id = 'username'>";
                aa+="密码<input value = "+password+" id = 'password'>";
                aa+="年龄<input value = "+age+" id = 'age'>";
                aa+="性别<input value = "+sex+"  id = 'sex'>";
                aa+="<button onclick = 'tijiao("+list[i].id+")'>提交</button>";
                 break;
                
              }
            }
              $("#myxiugai").show();
            $("#mytable").hide();
            $("#myxiugai").html(aa);
      }
      function tijiao(tempid){
         
        
            $.ajax({
             url:"tijiao.do",
             dataType:"json",
             data:{
             "id":tempid,
             "name":$("#username").val(),
             "password":$("#password").val(),
             "age":$("#age").val(),
             "sex": $("#sex").val()},
             success:function (data){//data  相当于  java里面的  object 
             
             if(data.msg){
             
                init();
             }else{
                alert("请联系陈佳伟");
             
             }
                
              }
         
         });
      }
   </script>
</body>
</html>