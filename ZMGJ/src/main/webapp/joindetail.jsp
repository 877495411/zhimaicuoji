<!--  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<%@include file="/common/include.jsp"%>
<head lang="en">
<meta charset="UTF-8">
<title>知脉国际-业务范围</title>
<link rel="stylesheet" href="${ctx }/css/CommonCss.css">
<link rel="stylesheet" href="${ctx }/css/common.css">
<link rel="stylesheet" href="${ctx }/css/index.css">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
</head>
<body>
	<div id="page">
		<div id="head">
			<!--顶部-->
			<div class="w clearfloat">
				<!--顶部菜单栏-->
				<ul id="nav" class="clearfloat">
					<li class="nav-items"><a href="${ctx }/index.jsp">首页</a></li>
					<li class="nav-items"><a href="${ctx }/business.jsp">走进知脉</a></li>
					<li class="nav-items"><a class="head-tivace" href="${ctx }/join.jsp">业务范围</a></li>
					<li class="nav-logo"><img src="${ctx }/images/logo.png"></li>
					<li class="nav-items"><a id="wqhg" href="${ctx }/review.jsp">往期回顾</a></li>
					<li class="nav-items"><a href="#">招才引智</a></li>
					<li class="nav-items"><a href="${ctx }/Contactus.jsp">联系我们</a></li>
				</ul>
			</div>
			<div id="language">
				<a class="chinese" style="color: #e3c575;">中文</a> <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<a class="english">English</a>
			</div>
		</div>
		<!--走进知脉详情页-->
		<div class="w">
			<div class="de-tit">
				<a href="#" id="title"></a>&gt; <span>正文</span>
			</div>
			<div id="de-con">
				<p class="de-tits"></p>
				<p class="de-time"></p>
				<div class="de-ctext"></div>
			</div>
		</div>
		<!--底部-->


		<%@include file="/common/foot.jsp"%>
	</div>
	<script type="text/javascript">
	window.onload=function() {
		function UrlSearch() 
		{
		   var name,value; 
		   var str=location.href; //取得整个地址栏
		   var num=str.indexOf("?") 
		   str=str.substr(num+1); //取得所有参数   stringvar.substr(start [, length ]

		   var arr=str.split("&"); //各个参数放到数组里
		   for(var i=0;i < arr.length;i++){ 
		    num=arr[i].indexOf("="); 
		    if(num>0){ 
		     name=arr[i].substring(0,num);
		     value=arr[i].substr(num+1);
		     this[name]=value;
		     } 
		    } 
		} 
		var Request=new UrlSearch(); //实例化
			$.ajax({
				url:ctx + "/zmgj/loadAdDetails.do",
				data:{"adId":Request.adId,"typeName":Request.typeName},
				dataType:"json",
				type:"post",
				success:function(data) {
					if(data.success) {
						$(".de-tits").text(data.adv.adDetailDesc);
						$(".de-time").text(data.adv.remark);
						$("#title").text(data.typeName);
						if(data.typeName == "往期回顾") {
							$(".nav-items a").removeClass("head-tivace");
							$("#wqhg").addClass("head-tivace");
						}
						$(".de-ctext").html(data.adv.remark1);
					}
				}
			})
		}
		
	</script>
</body>
</html>