$(function() {
	loadAdInfo(4,1);
})

// 加载详情
var typeId = 4;
function loadAdInfo(id,page) {
	$.ajax({
		url : ctx + "/zmgj/getAdvertise.do",
		dataType : "json",
		data : {
			"id" : id,
			"page":page
		},
		type : "post",
		success : function(data) {
			$("#infoList p").eq(0).text("往期回顾");
			if (data.success) {
				// 加载详情
				var str = "";
				$.each(data.list, function(index,item) {
					var time = new Date(item.createTime).Format("yyyy-MM-dd hh:mm");
					var name = encodeURI("往期回顾");   
					str += "<li class='jo-msglists clearfloat'>"+
				               "    <a href='"+ ctx+"/joindetail.jsp?adId="+item.adId+"&typeName=" + name +"' >"+
				              "      <p>"+item.adDetailDesc+"</p>"+
				             "       <span class='jo-msgltime'>"+time+"</span>"+
				                "</a>"+
				            "</li>";
				});
				var fy = "";
				for(var i = 1; i <= data.totalPages; i++) {
					if(i == page) {
						fy += "<li class='fyUlli active' id='pageli"+i+"' onclick='upPage("+i+");'>"+i+"</li>";
					}else {
						fy += "<li class='fyUlli' id='pageli"+i+"' onclick='upPage("+i+");'>"+i+"</li>";
					}
							
				}
				$("#nowPage").val(data.nowPage);
				$("#totalPages").val(data.totalPages);
				$("#fyUl").html(fy);
				$(".jo-msglist").html(str);
				$("#fy").show();
			} else{
				$("#fy").hide();
				$(".jo-msglist").html("暂无数据");
			}
		}
	})
}

function loadDetails(id) {
	location.href=ctx + "/zmgj/loadAdDetails.do?adId=" + id;
}


function clickLastPage(){
	var nowpage = parseInt($("#nowPage").val())-1;
	if(nowpage != 0){
		loadAdInfo(typeId,nowpage);
	}
}
function clickNextPage(){
	var nowpage = parseInt($("#nowPage").val())+1;
	if(nowpage <= parseInt($("#totalPages").val()) ){
		loadAdInfo(typeId,nowpage);
	}
}

function jumpPage(){
	var nowpage = parseInt($("#nowPage").val());
	if(nowpage != 0 && nowpage <= parseInt($("#totalPages").val() ) ){
		loadAdInfo(typeId,nowpage);
	}
}
function clickFirst(page){
	var nowpage = 1;
	loadAdInfo(typeId,nowpage);
}
function clickLast(page){
	var nowpage = parseInt($("#totalPages").val());
	loadAdInfo(typeId,nowpage);
}
function upPage(page) {
	loadAdInfo(typeId,page);
}
