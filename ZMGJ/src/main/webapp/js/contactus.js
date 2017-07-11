$(function() {
	loadAdInfo(6,"联系我们");
})
var typeId,typeName;

// 加载详情
function loadAdInfo(id,name) {
	if(id != null) {
		typeId = id;
	}
	if(name != null ) {
		typeName = name;
	}
	$.ajax({
		url : ctx + "/zmgj/getAdvertiseWithoutPage.do",
		dataType : "json",
		data : {
			"id" : id
		},
		type : "post",
		success : function(data) {
			if (data.success) {
				// 加载详情
				$(".conus-text").html(data.list.remark1);
			} else{
				$(".conus-text").html("<p>qwq(^_−)☆(^_−)☆c(^_−)☆数据君粗去玩了(^_−)☆(^_−)☆c(^_−)☆qwq</p>");
			}
		}
	})
}
