$(function() {
	loadBusinessCollegeType(2);
})
var typeId,typeName;
// 加载一级分类
function loadBusinessCollegeType(id) {
	$.ajax({
		url : ctx + "/zmgj/getBusinessCollege.do",
		dataType : "json",
		data : {
			"id" : id
		},
		type: "post",
		async:false,
		success : function(data) {
			if(data.success) {
				// 加载第一个模块分类
				var str = "";
				$.each(data.list, function(index, item) {
						str += '<li class="jo-tabsitem" onclick="loadAdInfo('+ "'" +  item.id + "'" + ','+ "'" + item.dicName + "'" +')" >' + item.dicName + '</li>';
				})
				typeId = data.list[0].id;
				typeName = data.list[0].dicName;
				$(".jo-tabs").html(str);
				loadAdInfo(typeId,typeName);
		}
		}
	})
}

// 加载详情
function loadAdInfo(id,name) {
	$("#info").remove();
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
			$(".jo-tabcon p").eq(0).text(typeName);
			if (data.success) {
				$("#context").html(data.list.remark1);
				$(".jo-tabcon").append("<iframe id='info' name='childIframe' style='width:100%;min-height:400px;overflow-y: hidden;' src='"+ctx+"/businessInfo.jsp'></iframe>");
			} else{
				$(".bu-ctext").html("暂无数据");
			}
		}
	})
}
