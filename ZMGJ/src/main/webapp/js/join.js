$(function() {
	loadBusinessCollegeType(3);
})
// 加载一级分类
function loadBusinessCollegeType(id) {
	$.ajax({
				url : ctx + "/zmgj/getBusinessCollege.do",
				dataType : "json",
				data : {
					"id" : id
				},
				type : "post",
				success : function(data) {
					if (data.success) {
						// 加载第一个模块分类
						var str = "";
						var pid = "";
						$.each(data.list,function(index, item) {
											if (index == 0) {
												pid = item.id;
												str += '<li class="jo-mlist joactive" onclick="loadThirdTypeById('
														+ item.id
														+ ')" id="'
														+ item.id
														+ '">'
														+ item.dicName
														+ '</li>'
											} else {
												str += '<li class="jo-mlist" onclick="loadThirdTypeById('
														+ item.id
														+ ')" id="'
														+ item.id
														+ '">'
														+ item.dicName
														+ '</li>'
											}
										})
						$("#jo-menu").html(str);
						if (type == "zmsxy") {
							$("#jo-menu li").eq(0).click();
						}
						if (type == "zmwllx") {
							$("#jo-menu li").eq(1).click();
						}
						if (type == "acesff") {
							$("#jo-menu li").eq(3).click();
						}
						if (type == "nzxx") {
							$("#jo-menu li").eq(2).click();
						}
					} 
				}
			})
}
var typeId;
var typeName;
// 二级分类
function loadThirdTypeById(id) {
	$.ajax({
		url : ctx + "/zmgj/getBusinessCollege.do",
		dataType : "json",
		data : {
			"id" : id
		},
		async : false,
		type : "post",
		success : function(data) {
			if (data.success) {
				$("#secondType").show();
				// 加载第二个模块分类
				var str = "";
				$.each(data.list, function(index, item) {
					str += '<li class="jo-tabsitem" onclick="loadAdInfo('
							+ item.id + ',1,' + "'" + item.dicName + "'"
							+ ')" id="' + item.id + '">' + item.dicName
							+ '</li>';
				});
				$("#secondType").html(str);
				typeName = data.list[0].dicName;
				typeId = data.list[0].id;
				loadAdInfo(data.list[0].id, 1, typeName);
				$("#jo-tab .jo-tabcon").css({"width":""});
				$("#jo-tab .jo-msglists").css({"width":""});
			}else {
				$("#secondType").hide();
				$("#jo-tab .jo-tabcon").css({"width":"100%"});
				$(".jo-msglists").attr("style","width:100%;");
				//没有下级分类
				if(id == "7") {
					typeName = "知脉企业融通平台";
				}
				if(id == "8") {
					typeName = "知脉未来领袖";
				}
				if(id == "9") {
					typeName = "A.C.E.S.F.F.";
				}
				if(id == "10") {
					typeName = "知脉女子学院";
				}
				loadAdInfo(id,1);
			}
		}
	})
}

// 加载详情
function loadAdInfo(id, page, name) {
	$("#jo-tab").show();
	$("#adv").html("");
	if (id != null) {
		typeId = id;
	}
	if (name != null) {
		typeName = name;
	}
	$.ajax({
		url : ctx + "/zmgj/getAdvertise.do",
		dataType : "json",
		data : {
			"id" : id,
			"page" : page
		},
		type : "post",
		success : function(data) {
			$("#infoList p").eq(0).text(typeName);
			if (data.success) {
				// 加载详情
				var str = "";
				$.each(data.list, function(index, item) {
					var time = new Date(item.createTime)
							.Format("yyyy-MM-dd hh:mm");
					var name = encodeURI(typeName);   
					str += "<li  class='jo-msglists clearfloat'>"
							+ "     <a href='"+ ctx+"/joindetail.jsp?adId="+item.adId+"&typeName="+name +"' >"
							+ "      <p>" + item.adDetailDesc + "</p>"
							+ "       <span class='jo-msgltime'>" + time
							+ "</span>" + "</a>" + "</li>";
				});
				var fy = "";
				for ( var i = 1; i <= data.totalPages; i++) {
					if (i == page) {
						fy += "<li class='fyUlli active' id='pageli" + i
								+ "' onclick='upPage(" + i + ");'>" + i
								+ "</li>";
					} else {
						fy += "<li class='fyUlli' id='pageli" + i
								+ "' onclick='upPage(" + i + ");'>" + i
								+ "</li>";
					}

				}
				$("#nowPage").val(data.nowPage);
				$("#totalPages").val(data.totalPages);
				$("#fyUl").html(fy);
				$("#adv").html(str);
				$("#fy").show();
				$("#adv").show();
			} else {
				$("#fy").hide();
				$("#adv").html("暂无数据");
			}
		}
	})
}


// 上一页
function clickLastPage() {
	var nowpage = parseInt($("#nowPage").val()) - 1;
	if (nowpage != 0) {
		loadAdInfo(typeId, nowpage, typeName);
	}
}
// 下一页
function clickNextPage() {

	var nowpage = parseInt($("#nowPage").val()) + 1;
	if (nowpage <= parseInt($("#totalPages").val())) {
		loadAdInfo(typeId, nowpage, typeName);
	}
}

function jumpPage() {
	var nowpage = parseInt($("#nowPage").val());
	if (nowpage != 0 && nowpage <= parseInt($("#totalPages").val())) {
		loadAdInfo(typeId, nowpage, typeName);
	}
}

// 点击页数
function upPage(page) {
	loadAdInfo(typeId, page, typeName);
}

