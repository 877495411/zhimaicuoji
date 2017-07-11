$(function() {
	loadModules();
})
function loadModules() {
	$.ajax({
		url:ctx + "/zmgj/loadModules.do",
		async:false,
		dataType:"json",
		type:"post",
		success:function(data) {
			if(data.success) {
				var str = "";
				str = "<li class='nav-items'>  <a id='"+data.list[0].id+"' class='head-tivace' href='"+ctx+"/index.jsp'>"+data.list[0].dicName+"</a></li> " +
						"<li onclick='loadBusinessCollegeType("+data.list[1].id+")' class='nav-items'><a id='"+data.list[1].id+"' href='javascript:void(0)'>"+data.list[1].dicName+"</a></li>" +
						"<li class='nav-items'><a id='"+data.list[2].id+"' href='"+ctx+"/business.jsp'>"+data.list[2].dicName+"</a></li>" +
						"<li class='nav-logo'><img src='"+ctx+"/images/logo.png'></li>" +
						"<li class='nav-items'><a id='"+data.list[3].id+"' href='"+ctx+"/review.jsp'>"+data.list[3].dicName+"</a></li>" +
						"<li class='nav-items'><a id='"+data.list[4].id+"' href='#'>"+data.list[4].dicName+"</a></li>" +
						"<li class='nav-items'><a id='"+data.list[5].id+"' href='"+ctx+"/Contactus.jsp'>"+data.list[5].dicName+"</a></li>";
				$("#nav").html(str);
			}
		}
	})
}