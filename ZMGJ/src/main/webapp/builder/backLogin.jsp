<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/common/include.jsp" %>
<head lang="en">
    <meta name="renderer" content="webkit">   
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>网站助手</title>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        #bgi{
            background: url('${ctx}/images/login/backLogin/bgimg.jpg') no-repeat center;
            -webkit-background-size: 100% 100%;
            background-size: 100% 100%;
         
        }
        #loginBoxBgi{
            width: 508px;
            height: 330px;
            position: absolute;
            left: 36%;
            top: 25%;
            opacity: 0.9;
            border: 1px solid #271f1f;
    		background: rgba(31, 23, 23, 0.7);
        }
        #loginBox{
            width: 508px;
            height: 330px;
            position: absolute;
            left: 36%;
            top: 25%;
            opacity: 0.9;
            font-family: "Microsoft YaHei"
        }
        #Label{
            display: block;
            width: 300px;
           position: relative;
            top: 130px;
            left: 70px;
            color: #fff;
        }
        #pwd,#userName{
            width: 200px;
            height: 25px;
            border: 1px solid #dddddd;
            margin-top: 20px;
            border-radius: 3px;
            padding-left: 25px;
            line-height: 25px;
        }
        #loginBut{
            background-image: url('${ctx}/images/login/backLogin/loginBut.png');
            width: 60px;
            height: 60px;
            border: 0;
        
             -moz-border-radius: 60px; /* Firefox */
          -webkit-border-radius: 60px; /* Safari 和 Chrome */
          border-radius: 60px; /* Opera 10.5+, 以及使用了IE-CSS3的IE浏览器 */

            position: relative;
            left: 380px;
            top: 40px;
            color: white;
            font-size: 18px;
            line-height: 60px;
        }
        #usernameImg{
            position: absolute;
            left: 70px;
            top: 27px;
        }
        #pwdImg{
              position: absolute;
            left: 70px;
            top: 77px;
        }
        #CheckBox{
            position: relative;
            top: 115px;
            left: 50px;
            font-size: 14px;
        }
        #CheckB{
            position: relative;
            top: 2px;
        }
    </style>
</head>
<script>
	$(function(){
		var userName="<%=request.getSession().getAttribute("userName")%>";
		if(userName!="null"){
			window.open('${ctx}/builder/adManage.jsp',"_self");
		}
	});
</script>
<!-- 登陆页面flag -->
<body>
<form action="${ctx}/system/login/tohome.do" method="post" id="loginForm" name="loginForm">
   <div id="bgi">
       <div id="loginBoxBgi">
       </div>
       <div id="loginBox">
           <div id="Label">
           	<div style="width: 100%;overflow: hidden;">
           		<span style="display:block;float:left; 64px;text-align: right;margin-top: 20px;">用户名：</span>
               <input id="userName" type="text" style="position: relative;float:left;">
               <img id="usernameImg" src="${ctx}/images/login/backLogin/username.png" alt="">
           	</div>
           	<div>
               	<span style="display:block;float:left;width: 64px;text-align: right;margin-top: 20px;">密&nbsp;&nbsp;&nbsp;码：</span>
               	<input id="pwd" name="pwd" type="password" style="position: relative;float:left;">
               <img id="pwdImg" src="${ctx}/images/login/backLogin/pwd.png" alt="">
           	</div>
           	<div>
          	 <span id="yz" style="padding-left: 66px;font-size: 14px;line-height: 22px;"></span> </div>
           	</div>
           <button id="loginBut"  onclick="if(check()==false) return false;">登录</button>
       </div>
   </div>
   </form>
   
</body>
 <script>
   var bgi=$("#bgi");
   var H=$(document).height();
   var W=$(document).width();
   bgi.css({
       height:H,
       width:W
   });
   window.onresize = function() {
       var H=$(this).height();/*浏览器高度*/
       var W=$(this).width();/*浏览器宽度*/
       bgi.css({
           height:H,
           width:W
       });
   }

    function check(){
		 if($("#pwd").val()=="" && $("#userName").val()==""){
		        $("#yz").text("请输入用户名和密码").css({
		        	align:"center",
		        	color:"red"
		        });
		        return false;
		    }else if($("#pwd").val()==""){
		    	$("#yz").text("请输入密码").css({
		    		color:"red"
		        });
		    	 return false;
		    }else if($("#userName").val()==""){
		    	$("#yz").text("请输入用户名").css({
		    		color:"red"
		        });
		    	 return false;
		    }else{
		    	$.ajax({
					type:"post",
					dataType:"json",
					url:"${ctx}/system/login/login.do",
					data:{
						"userName":$("#userName").val(),
						"pwd":$("#pwd").val()},
					success:function(data){
		 		    	if(data.success){
		 		    		$("#loginForm").submit();
		 		    		return true;
		 		    	}else{
	 		    		document.getElementById('pwd').value="";
		 		    		$("#yz").text("用户名密码不匹配").css({
		 	 		    		color:"red"
		 	 		        });
		 		    		return false;
	 		    		}
					}
				});
						return false;
		      }
     }
   </script>
</html>