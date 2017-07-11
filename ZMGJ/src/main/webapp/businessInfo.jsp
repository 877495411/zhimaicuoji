<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<%@include file="/common/include.jsp"%>
<body>
	<div id="buCText">111</div>
	<script>
		$(function() {
			document.getElementById("buCText").innerHTML = parent.document
					.getElementById("context").innerHTML;
// 			parent.document.getElementById("info").style.height = document
// 					.getElementById("buCText").offsetHeight
// 					+ 50 + "px";
			$("#buCText img").css({
				"width" : "100%"
			});
			$("#buCText img").css({
				"height" : "auto;"
			});
			 var h=$(document).height()+201;
			console.log(h);
			 parent.document.getElementById("info").style.height = h +"px";
		})
	</script>
</body>
</html>