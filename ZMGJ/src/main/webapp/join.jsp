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
		<!--顶部-->
		<div id="head">
			<div class="w clearfloat">
				<div class="w clearfloat">
					<!--顶部菜单栏-->
					<ul id="nav" class="clearfloat">
						<li class="nav-items"><a href="${ctx }/index.jsp">首页</a></li>
						<li class="nav-items"><a href="${ctx }/business.jsp">走进知脉</a></li>
						<li class="nav-items"><a class="head-tivace" href="${ctx }/join.jsp">业务范围</a></li>
						<li class="nav-logo"><img src="${ctx }/images/logo.png"></li>
						<li class="nav-items"><a href="${ctx }/review.jsp">往期回顾</a></li>
						<li class="nav-items"><a href="${ctx }/#">招才引智</a></li>
						<li class="nav-items"><a href="${ctx }/Contactus.jsp">联系我们</a></li>
					</ul>
				</div>
				<div id="language">
					<a class="chinese" style="color: #e3c575;">中文</a> <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
					<a class="english">English</a>
				</div>
			</div>
		</div>
		<!--展示图片区-->
		<div class="banimg">
			<img src="images/banimg.jpg">
		</div>
		<!--走进知脉-->
		<div class="w clearfloat">
			<ul id="jo-menu">

			</ul>
			<ul id="jo-tab">
				<!--知脉商学院-->
				<li class="jo-tabshoose" style="display: block;">
					<ul class="jo-tabs" id="secondType">
					</ul> <!--内容切换-->
					<div class="jo-tabcon" id="infoList">
						<p class="jo-tabctit"></p>
						<ul class="jo-msglist" id="adv">

						</ul>
						<div id="fy" align="center" style="margin: 0; padding-top: 10px;">
							<a onclick="clickLastPage();" class="me_fy me_fypre"></a>
							<ul id="fyUl"
								style="display: inline-block; vertical-align: middle;">

							</ul>
							<a onclick="clickNextPage();" class="me_fy me_fynext"></a> <span>到第</span>
							<input type="text" id="nowPage"> <span>页</span>
							<input type="hidden" id="totalPages"> 
							<input type="button" value="跳转" id="goToBtn"
								onclick="jumpPage();" />

						</div>
					</div>
				</li>

			</ul>
		</div>
		<!--底部-->
		
    
<%@include file="/common/foot.jsp"%>
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/join.js"></script>
	<script>
		$("#jo-menu").on("click", "li.jo-mlist", function() {
			var r = $(this).index();
			$(".jo-mlist").removeClass("joactive");
			$(this).addClass("joactive");

		});
		function getQueryString(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) return unescape(r[2]); return null; 
			} 
		var type = getQueryString("type");
		if(type == null ||  type == "") {
			type = "zmsxy";
		}
		</script>
</body>
</html>