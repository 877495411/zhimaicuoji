<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="/common/include.jsp" %>
<head>
    <title>与果商家助手</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/css/backStage.css">
   
    <link rel="shortcut icon" href="http://yuguoimages.com/images/other/green.ico" type="image/x-icon" /> 
    <script src="${ctx}/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/js/changePasswordMain.js"></script>
</head>
<script>
	var pageIs="";
	var flag=true;
	$(document).ready(
	
			

		function(){
			var userName="${userName}";
			if(userName=="null"){
				window.open('${ctx}/backLogin.jsp',"_self");
			}
		}
	);
	
	function createMB(id) {
		$("#" + id).append('<div id="loadMB_'+id+'" style="position: absolute;top: 0;left: 0;width:1240px;height:915px;background-color: #ffffff;filter: alpha(opacity=40);-moz-opacity: 0.4;-khtml-opacity: 0.4;opacity: 0.4;z-index:99999999999;"><div class="lvju"><img src="${ctx}/images/backStage/lvju.gif" /></div></div>');
		 
	}
	function showMain(id) {
		$("#" + id).attr("style","display:block;min-height:800px;");
	}
	var tempPage='orderManagementMain';
	/*判断商品,交易,图片,广告,分类页面*/
	function loadAdManager(){
		$("#"+tempPage).css("display","none");
		tempPage="adManagementMain";
		showMain(tempPage);
		createMB(tempPage);
		 $("#adManagementMain").load('${ctx}/adManage.jsp');
		 $("#classifyManagementMain").empty();
		 $("#dealManagementMain").empty();
		 $("#imgManagementMain").empty();
		 $("#activityPromotionMain").empty();
		 $("#dictionaryMain").empty();
		 $("#productAudiMain").empty();
		 $("#dataAnalyzeMain").empty();
		 $("#myStoreMain").empty(); 
		 $("#everyoneIndiana").empty(); 
		 $("#changePasswordMain").empty(); 
		 $("#storeAudiBtMain").empty();		
		 $("#layOutManageMain").empty();
		 $("#uploadApkMain").empty();
		 pageIs="ad";
		 document.cookie="pageIs="+pageIs;
		  
	}
	function loadClassfy(){
		$("#"+tempPage).css("display","none");
		tempPage="classifyManagementMain";
		showMain(tempPage);
		createMB(tempPage);
		 $("#classifyManagementMain").load('${ctx}/classifyManage.jsp');
		 $("#adManagementMain").empty();
		 $("#dealManagementMain").empty();
		 $("#imgManagementMain").empty();
		 $("#activityPromotionMain").empty();
		 $("#dictionaryMain").empty();
		 $("#productAudiMain").empty();
		 $("#dataAnalyzeMain").empty();
		 $("#myStoreMain").empty();
		 $("#everyoneIndiana").empty(); 
		 $("#changePasswordMain").empty(); 
		 $("#storeAudiBtMain").empty();
		 $("#uploadApkMain").empty();
		 $("#layOutManageMain").empty();
		 pageIs="classfy";
		 document.cookie="pageIs="+pageIs;
			 
	}
	function loadDeal(child){
		if(child!=""){
			 pageIs="deal";
			 document.cookie="pageIs="+pageIs;
			 location.reload();
		}else{
			$("#"+tempPage).css("display","none");
			tempPage="dealManagementMain";
			showMain(tempPage);
			createMB(tempPage);
			 $("#dealManagementMain").load('${ctx}/dealManage.jsp');
			 $("#adManagementMain").empty();
			 $("#classifyManagementMain").empty();
			 $("#imgManagementMain").empty();
			 $("#activityPromotionMain").empty();
			 $("#dictionaryMain").empty();
			 $("#productAudiMain").empty();
			 $("#dataAnalyzeMain").empty();
			 $("#myStoreMain").empty(); 
			 $("#everyoneIndiana").empty(); 
			 $("#changePasswordMain").empty(); 
			 $("#storeAudiBtMain").empty();
			 $("#uploadApkMain").empty();
			 $("#layOutManageMain").empty();
			 pageIs="deal";
			 document.cookie="pageIs="+pageIs;
				 
		}
	}
	function loadDetail(){
		$("#"+tempPage).css("display","none");
		tempPage="orderManagementMain";
		showMain(tempPage);
		createMB(tempPage);
		 $("#orderManagementMain").load('${ctx}/user/order/toOrderManage.do');
		 $("#adManagementMain").empty();
		 $("#classifyManagementMain").empty();
		 $("#dealManagementMain").empty();
		 $("#activityPromotionMain").empty();
		 $("#dictionaryMain").empty();
		 $("#productAudiMain").empty();
		 $("#dataAnalyzeMain").empty();
		 $("#myStoreMain").empty(); 
		 $("#everyoneIndiana").empty(); 
		 $("#changePasswordMain").empty(); 
		 $("#layOutManageMain").empty();
		
		 $("#uploadApkMain").empty();
		 pageIs="detail";
		 document.cookie="pageIs="+pageIs;
			 
	}
	/**图片管理*/
	function loadPicManage(){
		$("#"+tempPage).css("display","none");
		tempPage="imgManagementMain";
		showMain(tempPage);
		createMB(tempPage);
	　	$("#imgManagementMain").load('${ctx}/pictureManage.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#dictionaryMain").empty();
		$("#productAudiMain").empty();
		$("#dataAnalyzeMain").empty();
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty();
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="pic";
		document.cookie="pageIs="+pageIs;
		 
	}
	/**商品审核**/
	function loadProductAudi(){
		$("#"+tempPage).css("display","none");
		tempPage="productAudiMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#productAudiMain").load('${ctx}/mall/goods/toProcuctAudi.do');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#dictionaryMain").empty();
		$("#imgManagementMain").empty();
		$("#dictionaryMain").empty();
		$("#activityPromotionMain").empty();
		$("#dataAnalyzeMain").empty();
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty(); 
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="pa";
		document.cookie="pageIs="+pageIs;	
		 
	}
	/**活动促销**/
	function  loadActivityPromotion(){
		$("#"+tempPage).css("display","none");
		tempPage="activityPromotionMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#activityPromotionMain").load('${ctx}/system/activity/toActivityPromotion.do');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#dictionaryMain").empty();
		$("#productAudiMain").empty();
		$("#dataAnalyzeMain").empty();
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty();
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="activity";
		document.cookie="pageIs="+pageIs;
		 
	}
	/**字典**/
	function loadDictionary(){
		$("#"+tempPage).css("display","none");
		tempPage="dictionaryMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#dictionaryMain").load('${ctx}/system/dictionary/toDictionary.do');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dataAnalyzeMain").empty();
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty(); 
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="dic";
		document.cookie="pageIs="+pageIs;
		 
	}

	/**数据分析**/
	function loaddataAnalyze(){
		$("#"+tempPage).css("display","none");
		tempPage="dataAnalyzeMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#dataAnalyzeMain").load('${ctx}/dataAnalyze.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty(); 
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="data";
		document.cookie="pageIs="+pageIs;
		 
	}
	/**店铺管理**/
	function  loadstoreManagement(){
		$("#"+tempPage).css("display","none");
		tempPage="myStoreMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#myStoreMain").load('${ctx}/storeManagement.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#dataAnalyzeMain").empty();
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty();
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="store";
		document.cookie="pageIs="+pageIs;
		 
	}
	/**人人夺宝**/
	function loadsEveryoneIndiana(){
		$("#"+tempPage).css("display","none");
		tempPage="everyoneIndiana";
		showMain(tempPage);
		createMB(tempPage);
		$("#everyoneIndiana").load('${ctx}/everyoneIndiana.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#dataAnalyzeMain").empty(); 
		$("#myStoreMain").empty(); 
 		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty();
		$("#storeAudiBtMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="everyone";
		document.cookie="pageIs="+pageIs;		 
	}
	/**商家审核**/
	function  loadStoreAudit(){
		$("#"+tempPage).css("display","none");
		tempPage="storeAudiBtMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#storeAudiBtMain").load('${ctx}/merchantAudit.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#dataAnalyzeMain").empty();
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty(); 
		$("#myStoreMain").empty();
		$("#uploadApkMain").empty();
		$("#layOutManageMain").empty();
		pageIs="storeAudit";
		document.cookie="pageIs="+pageIs;
		 
	}	
	
	/**加载修改密码changePasswordMain*/
	function loadChangePasswordMain(){
		$("#"+tempPage).css("display","none");
		tempPage="changePasswordMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#changePasswordMain").load('${ctx}/changePasswordMain.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#dataAnalyzeMain").empty(); 
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty();
		$("#layOutManageMain").empty();
		$("#uploadApkMain").empty();
		pageIs="changePassword";
		document.cookie="pageIs="+pageIs;
		 
	}
	/*广告布局管理*/
	function LoadlayOutManage(){
		$("#"+tempPage).css("display","none");
		tempPage="dictionaryMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#dictionaryMain").load('${ctx}/APPmanage.jsp');
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dataAnalyzeMain").empty();
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		$("#changePasswordMain").empty(); 
		$("#storeAudiBtMain").empty();
		$("#dictionaryMain").empty(); 
		pageIs="layOutManage";
		document.cookie="pageIs="+pageIs;
		 
	}
	
	/**加载上传apk页面uploadApkMain*/
	function loadUploadApkMain(){
		$("#"+tempPage).css("display","none");
		tempPage="uploadApkMain";
		showMain(tempPage);
		createMB(tempPage);
		$("#uploadApkMain").load('${ctx}/apkUpload.jsp');
		$("#changePasswordMain").empty();
		$("#adManagementMain").empty();
		$("#classifyManagementMain").empty();
		$("#dealManagementMain").empty();
		$("#orderManagementMain").empty();
		$("#imgManagementMain").empty();
		$("#activityPromotionMain").empty();
		$("#productAudiMain").empty(); 
		$("#dictionaryMain").empty(); 
		$("#dataAnalyzeMain").empty(); 
		$("#myStoreMain").empty(); 
		$("#everyoneIndiana").empty(); 
		pageIs="uploadApk";
		document.cookie="pageIs="+pageIs;
		 
	}
	
	/*遍历cookie*/
	function getCookiePage(cookieValue){
		var array = cookieValue.split(";");
		var thisPage = "";
		for(var i =0;i<array.length;i++){
			var thisparm = array[i].split("=");
			if(thisparm[0].indexOf("pageIs")>-1){
				thisPage=thisparm[1];
				break;
			}
		}
		return thisPage;
	}
	$(function(){
		var allCookie = document.cookie;
		if(allCookie!=""){
			var cookieValue = getCookiePage(allCookie);
			
			if(cookieValue=="ad"){
				$("#adManagementBt").click();
			}else if(cookieValue=="classfy"){
				$("#classifyManagementBt").click();
			}else if(cookieValue=="deal"){
				$("#dealManagementBt").click();
			}else if(cookieValue=="detail"){
				$("#orderManagementBt").click();
			}else if(cookieValue=="pic"){
				$("#imgManagementBt").click();
			}else if(cookieValue=="activity"){
				$("#activityPromotionBt").click();
			}else if(cookieValue=="dic"){
				$("#dictionaryBt").click();
			}else if(cookieValue=="pa"){
				$("#productAudiBt").click();
			}else if(cookieValue=="store"){
				$("#storeManagementBt").click();
			}else if(cookieValue=="data"){
				$("#dataAnalyze").click();
			}else if(cookieValue=="everyone"){
				$("#everyoneIndianaBt").click();
			}else if(cookieValue=="changePassword") {
				$("#changePassword").click();
			}else if(cookieValue=="uploadApk"){
				$("#uploadApk").click();
			}else if(cookieValue=="layOutManage"){
				$("#layOutManage").click();
			}else{
				$("#orderManagementBt").click();
			}
		}else{
			$("#orderManagementBt").click();
		}
		$.ajax({
			type:"post",
			dataType:"json",
			data:{parentId:"0"},
			url:"${ctx}/mall/goods/getClass.do",
			success : function(data) {
				if(data.success){
					$.each(data.list3,function(i,item){
						$("#localAll").append("<li  id="+item.id+" onclick='showSingleClass(this)'>● "+item.className+"</li>"); 
					});
				}
			}
		});
		
	});
	function showGoodsAndValueEdit(xmlGoodId,value,goodsId,goodsValueId){
		$("#rightContent").append('<select id=selectSaleAttr'+valueCount+'></select>');
		$("#rightContent").append('<input type="text" id=value'+valueCount+' value='+value+' />');
		$("#rightContent").append("<input type='hidden' value="+goodsValueId+" id=goodsValueId"+valueCount+" /><br>");
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${ctx}/mall/goods/getMallGoodsByGoodsCode.do",
			data:{"goodsId":goodsId},
			success:function(data){
				$.each(data.spbmList,function(i,item){
					$("#selectSaleAttr"+valueCount).append('<option value='+item.goodsId+'>'+item.goodsTitle+'</option>');
					$("#selectSaleAttr"+valueCount).attr({value:xmlGoodId});
				});
				valueCount++;
			}
		});
	}
	function delName(nameIdOrValueId,goodsId,th,index){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${ctx}/mall/goods/delAttr.do",
			data:{"delId":nameIdOrValueId,"goodsId":goodsId},
			success:function(data){
				if(data.success){
					if(document.getElementById('parent'+nameIdOrValueId+'_'+index)){ 
						$("#parent"+nameIdOrValueId+'_'+index).parent("li").remove();
					}else{
						document.getElementById('child'+nameIdOrValueId+'_'+index).style.display="none";
						th.style.display="none";
					}
				}
			}
		});
	}
</script> 
<body bgcolor="CCE8CF" style="font-size: 14px;">
   <div id="headerBgc"></div>
   <div id="mb"></div>
   <div id="mb1"></div>
   <div id="mb2"></div>
   <div id="loadMB"><div class="lvju"><img src="${ctx}/images/backStage/lvju.gif" /></div></div>
    <div class="box container">
        <div class="header col-sm-12 col-lg-12 col-md-12 col-xs-12">
            <div class="headerLeft">
                <img src="${ctx}/images/backStage/logo.png" alt=""  style="cursor: pointer;position: relative;top:28px;" onclick="window.open('https://www.yg669.com','_blank')">
            </div>
            <div class="headerContent">
                <p><%=request.getSession().getAttribute("userName")%>您好，欢迎进入与果商家助手</p>
            </div>
            <div class="headerRight">
<!--                 <button id="Administrator" class="headerNav">管理员</button> -->
                <button id="inDex" class="headerNav" onclick="window.open('http://www.yg669.com','_blank')">网站首页</button>
                <button id="changePassword" class="headerNav">修改密码</button>
                <button id="Help" class="headerNav">帮助</button>
                <button id="End" class="headerNav">退出</button>
            </div>
        </div>
        <div id="bigNav" class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
            <div class="bigNavLeft">首页</div>
            <ul class="bigNavRight">
            	<c:forTokens items="${authority.roleAuthorityList}" delims=";" var="btn">
				   <li id="${btn}" class="navBt" style="background-color: rgb(12, 168, 127);">
	            		<c:if test="${btn eq 'orderManagementBt'}">
			            	订单管理
	            		</c:if>
	            		<c:if test="${btn eq 'commodityManagementBt'}">
			            	商品管理
	            		</c:if>
	            		<c:if test="${btn eq 'dealManagementBt'}">
			            	交易管理
	            		</c:if>
	            		<c:if test="${btn eq 'imgManagementBt'}">
			            	图片管理
	            		</c:if>
	            		<c:if test="${btn eq 'classifyManagementBt'}">
			            	分类管理
	            		</c:if>
	            		<c:if test="${btn eq 'adManagementBt'}">
			            	广告管理
	            		</c:if>
	            		<c:if test="${btn eq 'productAudiBt'}">
			            	商品审核
	            		</c:if>
	            		<c:if test="${btn eq 'activityPromotionBt'}">
			            	活动促销
	            		</c:if>
	            		<c:if test="${btn eq 'dictionaryBt'}">
			            	字典
	            		</c:if>
	            		<c:if test="${btn eq 'dataAnalyze'}">
			            	数据分析
	            		</c:if>
	            		<c:if test="${btn eq 'storeManagementBt'}">
			            	店铺管理
	            		</c:if>
	            		<c:if test="${btn eq 'everyoneIndianaBt'}">
			            	人人夺宝
	            		</c:if>
	            		<c:if test="${btn eq 'storeAudiBt'}">
			            	商家审核
	            		</c:if>
	            		<c:if test="${btn eq 'uploadApk'}">
			            	APK发布
	            		</c:if>
	            		<c:if test="${btn eq 'layOutManage'}">
			            	广告布局管理
	            		</c:if>
	            	</li>
				</c:forTokens>
            </ul>
            <span class="moreOrBack more"><span class="moreOrBackText">更多</span><span class="moreOrBackIco"></span></span>
        </div>
        <!--订单管理-->
        <div id="orderManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12">
            
        </div>
        <!--商品管理--> 
        <div id="commodityManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12">
          <div class="com_m_main_l">
                <p class="bt"><span style="background: url('${ctx}/images/backStage/sjx.png') 0px 50% no-repeat;"></span> 本地库存产品</p>
                <ul class="T30Ul" id="localAll">
                    <li class="active" id="showli11" onclick='showSingleClass("")'>● 所有产品</li>
                </ul>
                <p class="bt"><span></span>出售中产品</p>
                <ul>
                    <li id="cs1">● 所有产品</li>
                    <li id="cs2">● 默认分组</li>
                </ul>
                <p class="bt"><span></span>仓库中产品</p>
                <ul>
                    <li>● 所有产品</li>
                    <li>● 默认分组</li>
                </ul>
                 <p class="bt"><span></span>回收站</p>
                <ul>
                    <li onclick="allRecycleBin();">● 所有产品</li>
                </ul>
            </div>  
            <div class="com_m_main_r">
                <div id="com_m_main_r_box">
                    <button id="addcp">
                        <img src="${ctx}/images/backStage/backNav(1).png" alt="">创建产品</button>
                    <button id="uploadGoods">
                        <img src="${ctx}/images/backStage/backNav(7).png" alt="">提交审核</button>
                    <button id="batchUploadGoods">
                        <img src="${ctx}/images/backStage/backNav(8).png" alt="">批量提交</button>
                    <button id="uploadGoodsToYG">
                     	<img src="${ctx}/images/backStage/UploadFFF.png" alt="">上传产品</button>
                    <button id="importCSV">
                        <img src="${ctx}/images/backStage/backNav(6).png" alt="">导入CSV</button>
                    <button id="exportCSV">
                        <img src="${ctx}/images/backStage/backNav(5).png" alt="">导出CSV</button>
                    <button id="delGoods">
                        <img src="${ctx}/images/backStage/backNav(3).png" alt="">删除产品</button>
                    <button id="batchDelGoods">
                        <img src="${ctx}/images/backStage/backNav(3).png" alt="">批量删除</button>
                    <button id="upAndDown">
                        <img src="${ctx}/images/backStage/backNav(6).png" alt="">上/下架</button>
                </div>
                <div id="box_two">
                    <ul>
                        <li style=" border-bottom: 1px solid #ffffff; border-right: 1px solid #ffffff;cursor: pointer;" id="count"></li>
                    </ul>
                </div>
                <!-- 数据表格  jqGrid -->
                <div id="tableOne" class="table">
<%--                     <%@include file="/login/jqGrid.jsp"%> --%>
                </div>
                <iframe name="ifm1" id="ifm1" src="${ctx}/parameter.jsp" style="width: 100%;height: 548px;"></iframe>

            </div>
            <div id="yfmbAddTc">
            	<form action="" name="yfmbForm" id="yfmbForm" method="post">
            		<input type="hidden" id="hidTempId" name="hidTempId">
                    <p class="bt">运费模板<span class="close"></span>
                    </p>
                    <div id="yfmbAddTcMain">
                        <div id="yfmbAddTcUp">
                            <div class="name">
                                模板名称：
                                <input type="text" id="templateName" name="templateName">
                                <label style="font-weight: 100"><input type="checkbox" id="isDefault" name="isDefault">将此模板设为默认</label>
                            </div>
                            <div class="addr">
                                地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：
                                	<select id="s_1" name="s_1" onchange="changeId1('',this.id)">
										<option>请选择省</option>
									</select> 
									<select id="s_2" name="s_2" onchange="changeId2(this.id)">
										<option>请选择市</option>
									</select> 
									<select id="s_3" name="s_3">
										<option>请选择区县</option>
									</select>
                                <input type="text" placeholder="请填写详细地址" id="addressDetails" name="addressDetails">
                            </div>
                            <div class="time">
                                发货时间：
                                <select id="sendTime" name="sendTime">
                                </select>
                            </div>
                            <div class="mail">
                                是否包邮：
                                <label id="s">
                                    <input type="radio" name="mail" checked="checked" value="1">卖家承担运费
                                </label>
                                <label id="b">
                                    <input type="radio" name="mail" value="0">自定义运费
                                </label>
                            </div>
                           </div>
                        <div id="yfmbAddTcDown">
                            <div class="valuation">
                                计价方式：
                                <label >
                                    <input type="radio" name="valuation" checked="checked" value="1">按件计
                                </label>
                                <label>
                                    <input type="radio" name="valuation" value="2">按重量计
                                </label>
                                <label>
                                    <input type="radio" name="valuation" value="3">按体积计
                                </label>
                            </div>
                            <div class="moneyBaoyou">
                               金额包邮：满 <input type="text" id="baoyouMoney" name="baoyouMoney" > 元包邮（可不填）
                            </div>
                            <div class="transport" style="height:80px">
                                运送方式：
                                <label>
                                    <input type="radio" name="transport" checked="checked" value="1">快递
                                </label>
                                <label>
                                    <input type="radio" name="transport" value="2">与果配送
                                </label>
                                <div class="transport_in_box transport_in_box1">
                                    <input type="text" name="goodsCount" id="goodsCount"><span> 件内 </span>
                                    <input type="text" name="countRMB" id="countRMB"><span> 元,每增 </span>
                                    <input type="text" name="singleCount" id="singleCount"><span> 件 增加 </span>
                                    <input type="text" name="addCount" id="addCount"><span> 元</span>
                                </div>
                                  <div class="transport_in_box transport_in_box2">
                                    <input type="text" name="goodsKg" id="goodsKg"><span> 千克内</span>
                                    <input type="text" name="kgRMB" id="kgRMB"><span> 元,每增</span>
                                    <input type="text" name="singleKg" id="singleKg"><span> 千克 增加</span>
                                    <input type="text" name="addKg" id="addKg"><span> 元</span>
                                </div>   
                                <div class="transport_in_box transport_in_box3">
                                    <input type="text" name="goodsCube" id="goodsCube"><span> m³内</span>
                                    <input type="text" name="cubeRMB" id="cubeRMB"><span> 元, 每增</span>
                                    <input type="text" name="singleCube" id="singleCube"><span> 元m³  增加</span>
                                    <input type="text" name="addCube" id="addCube"><span> 元</span>
                                </div>
                            </div>
                            <label><input type="checkbox" id="isChecked">指定条件包邮可选</label>
                            <table id="baoYouTable">
                                <thead>
                                    <tr>
                                        <td>选择地区</td>
                                        <td>选择运送方式</td>
                                        <td>选择快递</td>
                                        <td>设置包邮条件</td>
                                        <td>操作</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="tr_0">
                                        <td class="td1">
                                        	<input type="hidden" id="hidCity_0" name="hidCity_0">
                                            <select id="sheng_0_0" onchange="changeSheng('',this.id)">
                                            	<option>请选择省</option>
                                            </select>
                                            <select id="shi_0_0">
                                            	<option>请选择市</option>
                                            </select>
                                            <span onclick="addCity(this);">+添加</span>
                                        </td>
                                        <td class="td2">
                                            <select id="sendWay_0" name="sendWay_0">
                                                <option value="1">快递</option>
                                                <option value="2">与果配送</option>
                                            </select>
                                        </td>
                                        <td class="td3">
                                            <select id="company_0" name="company_0">
                                            </select>
                                        </td>
                                        <td class="td4">
                                            <p>满
                                                <input type="text" id="fullCount_0" name="fullCount_0"> 件包邮</p>
                                        </td>
                                        <td class="td5">
                                            <span class="add" onclick="addTr()"></span>
<!--                                             <span class="del"></span> -->
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <span class="cancel" id="cancelTemp">取消</span>
                        <span class="save" id="saveTemp" onclick="saveTemp();">保存并返回</span>
                        <span class="save" id="updTemp" onclick="updTemp();" style="display: none;">修改并返回</span>
                    </div>
                    </form>
                </div>
        </div>
        <!-- 交易管理 -->
        <div id="dealManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		<!--图片管理-->
        <div id="imgManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
        <!-- 分类管理 -->
        <div id="classifyManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		 <!-- 广告管理 -->
		<div id="adManagementMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		 <!-- 商品审核 -->
		<div id="productAudiMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
         <!-- 活动促销 -->
		<div id="activityPromotionMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		<!-- 字典 -->
		<div id="dictionaryMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		<!--数据分析-->
		<div id="dataAnalyzeMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
		<!--店铺管理-->
		<div id="myStoreMain" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
        <!--人人夺宝-->
		<div id="everyoneIndiana" style="display:none;" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
        <div id="storeAudiBtMain" style="display: none;" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12">
        
        </div>
         <!--广告布局管理-->
        <div id="layOutManageMain" style="display:none;" class="bigMain col-sm-12 col-lg-12 col-md-12 col-xs-12"></div>
        <!--修改密码-->
        <div id="changePasswordMain" style="display:none;" class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
           
        </div>
        <!--上传APK-->
        <div id="uploadApkMain" style="display:none;" class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
           
        </div>
        <div id="addcp_yc" style="background-color: #ffffff">
           <p id="addcp_yc_biaoti"><img src="${ctx}/images/backStage/backNav(1).png" alt="">创建产品</p>
            	  
            	  <form id="formSub" action="${ctx}/mall/goods/addGoods.do" method="post" onsubmit="return saveReport();">
					<div id="parameter" style="height: 456px;">
					<!--parameter参数(基本信息) -->
					<ul id="parameterUl" >
					    <li  style="background-color: #DDDDDD;cursor: pointer;">基本信息</li>
					    <li id="extend" style="cursor: pointer;">扩展信息</li>
					    <li style="cursor: pointer;">销售属性</li>
					    <li style="cursor: pointer;">产品描述</li>
					    <li style="cursor: pointer;">规格参数</li>
					    <li style="cursor: pointer;">售后服务</li>
					</ul>
					<div id="jbxxBox" class="parameter">
					    <div id="jbxxLeft">
					    <label class="labelOne">
							<font color="red">*</font>商品名称
					  	 	 <input type="text" maxlength="20"  onkeyup="goodNameSize(this.id)" onchange="goodNameSize(this.id)" id="goodsName" class="spmc" name="goodsName" >
					  	 	 <span id="fontCountGoodName">0</span>/20
					    </label>
					        <label class="labelOne">
					        	<font color="red">*</font>类目 <input id="s1" class="s1"><br/>
					        	<input type="hidden" id="goodsClass" name="goodsClass"> 
					        </label>
					        <label class="labelOne">
					        移动端价格
					        	<input id="appPrice" name="appPrice" style="width: 200px;"> 
					        </label>
					        <br/>
					        
					        <label>
					           <font color="red">*</font> 商品价格
					            <input type="text" id="spjg" name="spjg">
					        </label>
					        <label>
					           <font color="red">*</font> 成本价
					            <input type="text" id="cbj" name="cbj">
					        </label>
					         <label class="labelTwo">
					            包装清单
					           <textarea id="bzqd" name="bzqd"></textarea>
					        </label>
					        <label class="labelTwo">
					            所属选项卡
					            <input id="tabSelect" class="tabSelect">
					        	<input type="hidden" id="tabsHid" name="tabsHid"> 
					        </label>
					        <label class="labelTwo">
					                 活动选项卡
					            <input id="atTypeSelect" class="tabSelect" style="width:200px;padding-left:8px;">
					            <input type="hidden" id="atTypeHid" name="atTypeHid" />
					        </label>
					        <label class="labelTwo"  style="width: 100%;text-align: left;padding-left: 30px;">
					        	是否推荐
					            <input id="isunRecommend" class="isunRecommend" type="checkbox" onclick="cbClick(this)">
					            <input type="hidden" id="isunRecommendVal" name="isunRecommendVal" value="0" />
					        </label>
					    </div>

					    <div id="jbxxContent">
					        <label>
					            <font color="red">*</font> 产品标题
					            	<input maxlength="60"  onkeyup="cpbtSize(this.id)" name="cpbiaoti" id="cpbiaoti" type="text" id="cpbiaoti">
									<span style="display: inline-block;width:60px;"><input id="cpbtLen" name="cpbtLen" style="border: 0px;text-align:right;font-family: '黑体'" type="text" value="0" size="1" readonly="readonly">/60</span>
					        </label>
					        <label>
					            类目卖点
					            <textarea id="lmmd" title="最多输入150个字符" maxlength="150" name="lmmd"  onkeyup="fontSize(this.id)"></textarea>
					            <span style="display: inline-block;width:60px;"><input style="border: 0px; text-align:right;font-family: '黑体'" id="remLen" name="remLen" type="text" value="0" size="2" readonly="readonly">/150</span>
					        </label>
					        <label>
					            参考价
					            <input type="text" id="ykj" name="ykj">
					        </label>
					        <label style="margin-left: 28px;">
					            <font color="red">*</font> 数量
					            <input type="text" id="sl" name="sl">
					        </label>
					        <label>
					           <font color="red">*</font> 商家编码
					            <input type="text" id="sjbm" value="${userName}" name="sjbm" readonly="readonly">
					        </label>
					        <label>
					            <font color="red">*</font> 商品条码
					            <input type="text" id="sptm" name="sptm">
					        </label>
					        <label>
					            所在地
					            <input type="text" id="szd" name="szd" readonly="readonly">
					        </label>
					        <label>
					           <font color="red">*</font> 运费模版
					            <select id="yfmb" name="yfmb">
					            </select>
					            <span id="yfmbAdd" style="cursor: pointer;">新增</span>
               				    <span id="yfmbUpd" style="cursor: pointer;">修改</span>
               				    <span id="yfmbDel" onclick="delTemplate('parent')" style="cursor: pointer;">删除</span>
					        </label>
					        <label>
					            <font color="red">*</font> 物流重量
					            <input type="text" placeholder="千克" id="wlzl" name="wlzl">
					        </label>
					        <label>
					            <font color="red">*</font> 物流体积
					            <input type="text" placeholder="立方米" id="wltj" name="wltj">
					             	<input type="hidden" id="imag0" name="imag0" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					                <input type="hidden" id="imag1" name="imag1" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					                <input type="hidden" id="imag2" name="imag2" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					                <input type="hidden" id="imag3" name="imag3" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					                <input type="hidden" id="imag4" name="imag4" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					                <input type="hidden" id="imag5" name="imag5" value="${ctx}/images/whenImgNoImageShowThis20150630.png;">
					        </label>
					    </div>
					    <div id="jbxxRight">
					        <label class="labelTwo">
					            类目属性 
					            <select id="s2" class="s2" ><option selected="selected">请先选择类目</option></select>
					        	<input type="hidden" id="classAttr" name="classAttr"> 
					        </label>
					        <div class="tpspBigBox">
					            <ul id="cptp_sp_biaoti_ul">
					                <li style="background-color: #DDDDDD; border-top-left-radius:5px;"><font color="red">*</font> 产品图片</li>
					            </ul>
					           <div class="tpBox">
					                <div class="sBox" id="sBox"><img id="img" width="220px" height="220px"></div>
					                <ul class="rightUl" id="p">
					                    <li id="p0" style="border: 1px solid #62AAD5; cursor: pointer"><img id="img0"  width="100%" height="100%"></li>
					                    <li id="p1"  style="border: 1px solid #E0E0E0; cursor: pointer"><img id="img1"  width="100%" height="100%"></li>
					                    <li id="p2"  style="border: 1px solid #E0E0E0; cursor: pointer"><img id="img2"  width="100%" height="100%" ></li>
					                    <li id="p3"  style="border: 1px solid #E0E0E0; cursor: pointer"><img id="img3"  width="100%" height="100%" ></li>
					                    <li id="p4"  style="border: 1px solid #E0E0E0; cursor: pointer"><img id="img4"  width="100%" height="100%" ></li>
					                    <li id="p5"  style="border: 1px solid #E0E0E0; cursor: pointer"><img id="img5"  width="100%" height="100%" ></li>
					                </ul>
					                <button type="button" class="addTp" id="add">+ 添加图片</button>
					                <button type="button" class="delTP" id="delTp">- 删除图片</button>
					            </div>
					        </div>

					    </div>
					</div>
<!-- 					基本信息盒子 -->
					<div id="kzxxBox" class="parameter">
					    <div id="kz_inBox">
					        <div class="kz_inBox_left">
					            <label>
					                采购地
					                <select id="s_11" name="s_11" style="width:140px;" onchange="changeId1('',this.id)">
										<option>请选择省</option>
									</select> 
									<select id="s_21" name="s_21"  style="width:140px;" onchange="changeId2(this.id)">
										<option>请选择市</option>
									</select> 
									<select id="s_31" name="s_31"  style="width:140px;">
										<option>请选择区县</option>
									</select>
					            </label>
					            <label>
					                库存类型
					                <select name="kclx" id="kclx">
					                </select>
					            </label>
					            <label>
					                国家地区
					                <select name="gjdq" id="gjdq">
					                </select>
					            </label>
					            <label>
					                新旧程度
					                <select name="xjcd" id="xjcd">
					                </select>
					            </label>
					            <label>
					                库存计数
					                <select name="kcjs" id="kcjs">
					                </select>
					            </label>
					            <label>
					                类型
					                <select name="type" id="type">
					                </select>
					            </label>
					        </div>
					        <div class="kz_inBox_right">
					            <ul>
					                <li>
					                    <input type="checkbox">保修
					                </li>
					                <li>
					                    <input type="checkbox">店铺VIP
					                </li>
					                <li>
					                    <input type="checkbox">退换货承诺
					                </li>
					                <li>
					                    <input type="checkbox">发票
					                </li>
					                <li>
					                    <input type="checkbox">特色推荐
					                </li>
					                <li>
					                    <input type="checkbox">服务保障（七天退货）
					                </li>
					            </ul>
					        </div>
					    </div>
					</div>
<!-- 					扩展信息盒子 -->
					<div id="xssxBox" class="parameter">
						<div id="xssxUntil">
							属性名:<input type="text" id="names0" name="names0" placeholder="不能以数字或者标点符号开始" class="input1Css"><span style="margin-left: 50px;" >值:<input type="text" id="values0" name="values0" class="input2Css"></span><br>
						</div><br>
						<div id="org">
						</div><br>
							<button type="button" onclick="add1();" class="addCpBut">新增</button>
							<button type="button" id="btn_res" name="res"  class="addCpBut">重置</button>
							<button type="button" onclick="resetXssx();" name="res"  class="addCpBut">全部取消</button>
							<input type="hidden" id="countAttr" name="countAttr" value="1">
					</div>
<!-- 					销售属性盒子 -->
					<div id="cpmsBox" class="parameter">
						<textarea id="editor" name="editor" rows="20" cols="100" style="width:1025px;height:374px;visibility:hidden;"></textarea>
						<textarea rows="" cols="" name="cpms" id="cpms" style="display:none;"></textarea>
					</div>
<!-- 					产品描述盒子 -->
					<div id="sjxqBox" class="parameter">
						<textarea id="sjxqeditor" name="sjxqeditor" rows="20" cols="100" style="width:1025px;height:360px;visibility:hidden;"></textarea>
						<textarea rows="20" cols="100p" name="ggcs" id="ggcs" style="display: none;"></textarea>
					</div>
<!-- 					规格参数盒子 -->
					<div id="shfwBox" style="display: none;" class="parameter">
						<ul id=parsers>
							<li style="border-right: 0;background: #ddd;">售后服务</li>
							<li>服务承诺</li>
						</ul>
						<div class="shService" id="shsers">
							<textarea rows="" cols="" id="afterService" name="afterService" style="width: 100%;height: 280px;padding: 10px;"></textarea>
						</div>
						<div class="shService" style="display: none;" id="shserss">
							<textarea rows="" cols="" id="servicePromise" name="servicePromise" style="width: 100%;height: 280px;padding: 10px;"></textarea>
						</div>
					</div>
					</div>
<!-- 					售后服务盒子 -->
					<div class="footerBtbox">
						<input type="reset" style="display:none;"/> 
					    <button type="button" id="sub">保存</button>
					    <button type="button" class="footerBtbox_close" id="close">关闭</button>
					</div>
            	  </form>
        </div><!--创建产品弹出窗-->
        <div id="footer" class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
            <span class="footerLeft">持之以恒，明天会更好！</span>
            <span class="footerRight" id="footerRight">
           </span>
        </div>
    </div>
    <script type="text/javascript">
	    $("#orderManagementBt").on("click",function(){
	    	loadDetail();
	    });
	    $("#commodityManagementBt").on("click",function(){
	    	$("#"+tempPage).css("display","none");
			loadExtendInfo('','');
			$("#commodityManagementMain").css("display","block");
			tempPage="commodityManagementMain";
			 $("#classifyManagementMain").empty();
			 $("#dealManagementMain").empty();
			 $("#imgManagementMain").empty();
			 $("#activityPromotionMain").empty();
			 $("#dictionaryMain").empty();
			 $("#productAudiMain").empty();
			 $("#dataAnalyzeMain").empty();
			 $("#myStoreMain").empty(); 
			 $("#myStoreMain").empty(); 
			 $("#everyoneIndianaMain").empty(); 
			 $("#changePasswordMain").empty(); 
	    });
	    $("#dealManagementBt").on("click",function(){
	    	loadDeal('');
	    });
	    $("#imgManagementBt").on("click",function(){
	    	loadPicManage();
	    });
	    $("#classifyManagementBt").on("click",function(){
	    	loadClassfy();
	    });
	    $("#adManagementBt").on("click",function(){
	    	loadAdManager();
	    });
	    $("#productAudiBt").on("click",function(){
	    	loadProductAudi();
	    });
	    $("#activityPromotionBt").on("click",function(){
	    	loadActivityPromotion();
	    });
	    $("#dictionaryBt").on("click",function(){
	    	loadDictionary();
	    });
	    $("#dataAnalyze").on("click",function(){
	    	loaddataAnalyze();
	    });
	    $("#storeManagementBt").on("click",function(){
	    	loadstoreManagement();
	    });
	    $("#everyoneIndianaBt").on("click",function(){
	    	loadsEveryoneIndiana();
	    });
	    $("#changePassword").on("click",function(){
	    	loadChangePasswordMain();
	    });
	    $("#storeAudiBt").on("click",function(){
	    	loadStoreAudit();
	    });
	    $("#uploadApk").on("click",function(){
	    	loadUploadApkMain();
	    });
	    $("#layOutManage").on("click",function(){
	    	LoadlayOutManage();
	    });
    </script>
    <script type="text/javascript">
	//产品图片li的下标
	var inde=0;
	//header button点击效果JS开始
	var headerNav = $(".headerNav");
	headerNav.on("click", function () {
		$(this).css({
		    border: "2px solid #fd985e",
		    color: "#fd985e"
		}).siblings(headerNav).css({
		    border: "2px solid #ffffff",
		    color: "#000000"
		});
	});
	 //header button点击效果JS结束
    //主导航 button点击效果JS开始
   var navBt = $(".navBt");
   var bigMain = $(".bigMain ");
   navBt.on("click", function (){
       var Index = $(this).index();
//        bigMain.css({
//            display: "none"
//        }).eq(Index).css({
//            display: "block"
//        });
       $(this).css({
           backgroundColor: "#008f69"
       }).siblings(navBt).css({
           backgroundColor: "#0ca87f"
       });
   });
	/*****2016-4-7******/
      $("#bigNav").on("click",".more",function(){
           $("#bigNav .moreOrBack").removeClass("more").addClass("back");
           $("#bigNav .moreOrBack .moreOrBackText").text("返回");
           $(".bigNavRight").stop().animate({
               top:"-45px"
           });
      })
      $("#bigNav").on("click",".back",function(){
           $("#bigNav .moreOrBack").removeClass("back").addClass("more");
           $("#bigNav .moreOrBack .moreOrBackText").text("更多");
          $(".bigNavRight").stop().animate({
               top:"0px"
           });
      })  
	var comManagementMain = $("#commodityManagementMain");
        var com_m_main_l = $(".com_m_main_l");
        var bt = $(".bt");
        comManagementMain.find(com_m_main_l).find("li").on("click", function () {
        	comManagementMain.find(com_m_main_l).find("li").removeClass('active');
            $(this).addClass('active');
        });
        comManagementMain.find(com_m_main_l).find(bt).on("click", function () {
            if ($(this).next().find("li").height() == 30) {
                $(this).next().find("li").animate({
                    height: "0"
                }, 200);
                $(this).find("span").css({
                    background: "url('${ctx}/images/backStage/sjx1.png') no-repeat 0 center"
                });
            } else {
                $(this).next().find("li").animate({
                    height: "30px"
                }, 400);
                $(this).find("span").css({
                    background: "url('${ctx}/images/backStage/sjx.png') no-repeat 0 center"
                });
            }
        });
     /*****2016-4-7******/
	//主导航 button点击效果JS结束
	//左边导航点击 （隐藏/显示）子导航时间开始
	var bgi = $(".bgi");
	var biaoti = $(".biaoti");
	var znav = $(".znav");
	bgi.on("click", function () {
	    if ($(this).parent().find("p").height() == 0) {
	        $(this).css({
	            backgroundImage: "url('${ctx}/images/backStage/r4.png')"
	        }).parent().find("p").stop().animate({
	            height: "30px"
	        });
	    } else {
	        $(this).css({
	            backgroundImage: "url('${ctx}/images/backStage/r3.png')"
	        }).parent().find("p").stop().animate({
	            height: "0"
	        });
	    }
	});
    biaoti.on("click", function () {
        if ($(this).parent().find("p").height() == 0) {
            $(this).parent().find("p").stop().animate({
                height: "30px"
            });
            $(this).parent().find(bgi).css({
                backgroundImage: "url('${ctx}/images/backStage/r4.png')"
            });
        } else {
            $(this).parent().find("p").stop().animate({
                height: "0"
            });
            $(this).parent().find(bgi).css({
                backgroundImage: "url('${ctx}/images/backStage/r3.png')"
            });
        }
    });
    // 左边导航点击 （隐藏/显示）子导航时间结束
	// 商品管理 2222222222222222222222222222222222222222222222222开始
    // 所有产品 和 上传失败产品 切换JS 开始
    var box_two = $('#box_two');
    var tableOne = $('#tableOne');
    var tableTwo = $('#tableTwo');
    box_two.find("li").on('click', function () {
        var Index = $(this).index();
        if (Index == 0) {
            $(this).css({
                borderBottom: "1px solid #ffffff",
                borderRight: "1px solid #ffffff",
                backgroundColor: "#fff"
            }).siblings().css({
                borderBottom: "1px solid #bbbbbb",
                borderRight: "1px solid #ffffff",
                borderLeft: "1px solid #bbbbbb",
                backgroundColor: "#f1f1f1"
            });
            tableOne.css({
            	 display: "block"
            });
            tableTwo.css({
            	display: "none"
            })
<%--                 document.getElementById("tableOne").innerHTML="<%@"+"include"+"file='"+"/login/jqGrid.jsp'"+"%>"; --%>
        } else {
            $(this).css({
                borderBottom: "1px solid #ffffff",
                borderRight: "1px solid #bbbbbb",
                borderLeft: "1px solid #bbbbbb",
                backgroundColor: "#fff"
            }).siblings().css({
                borderBottom: "1px solid #bbbbbb",
                borderRight: "1px solid #ffffff",
                backgroundColor: "#f1f1f1"
            });
            tableTwo.css({
                display: "block"
            });
            tableOne.css({
                display: "none"
            });
<%--                 document.getElementById("tableTwo").innerHTML="<%@"+"include"+"file='"+"/login/defeat.jsp'"+"%>"; --%>
        }

    });
   //所有产品 和 上传失败产品 切换JS 结束
   //创建产品弹出窗开始
   var addcp=$("#addcp");
   var mb=$("#mb");
   var mb1 = $("#mb1");
   var addcp_yc=$("#addcp_yc");
   var iframe1=$("#iframe1");
   var close=$("#close");
   addcp.on("click", function () {
	   resetCreate();
       addcp_yc.css({
           height:"550px"
       });
       mb.css({
           display:"block"
       });
       if(flag){
    	   getUserIsLogin();
		   	$("#s1").combotree({ 
		          url:'${ctx}/mall/goods/getThirdCombotree.do?qqq=123',  
		           onSelect:function(node){  
		        	 	//返回树对象  
			        	var tree = $(this).tree;  
			        	//选中的节点是否为叶子节点,如果不是叶子节点,清除选中  
			        	var isLeaf = tree('isLeaf', node.target);  
				        if (!isLeaf) {  
				            //清除选中  
				        	$('#s1').combotree('clear');
				        }
				        
			           	document.getElementById('goodsClass').value =node.id;
				           	$("#s2").combotree({  
				       			url:'${ctx}/mall/goods/getFourFiveTree.do?parentId='+node.id,
				       			multiple: true,
				    			onLoadSuccess:function(data){
				  		          $("#s2").combotree('tree').tree("collapseAll"); 
				  				} 
			   			});
		           },
    			  onLoadSuccess:function(data){
	  		          $("#s1").combotree('tree').tree("collapseAll"); 
  				  } 
		     });
		
		   	$("#tabSelect").combotree({
		        url:'${ctx}/system/dictionary/getIndexTabs.do',
		        multiple: true,
  			  	onLoadSuccess:function(data){
  		            $("#tabSelect").combotree('tree').tree("collapseAll"); 
			    } 
		   });
		   	$("#atTypeSelect").combotree({
		        url:'${ctx}/system/activity/getActivitTabs.do',
		        multiple: true,
		        panelHeight:"150",
		        editable:false,
		        value:"-请选择-",
		        onSelect : function(data) { 
		        	//返回树对象  
		        	var tree = $(this).tree;  
		        	//选中的节点是否为叶子节点,如果不是叶子节点,清除选中  
		        	var isLeaf = tree('isLeaf', data.target);  
			        if (!isLeaf) {  
			            //清除选中  
			        	$('#atTypeSelect').combotree('clear');  
			        }  
			    } 
		   });
		   getTemplateList();
       }
   });
   close.on("click", function () {
	   flag=false;
       mb.css({
           display:"none"
       });
       addcp_yc.css({
           height:0
       });
       resetCreate();
       resetXssx();
   });
   //创建产品弹出窗结束
   // 分类管理55555555555555555555555555555555555555555555555555开始
   var classifyLeft = $("#classifyLeft");
   var adLeft = $("#adLeft");
   var bt = $(".bt");
   classifyLeft.find("li").on("click", function () {
       classifyLeft.find("li").removeClass('active');
       $(this).addClass('active');
   });
   classifyLeft.find(bt).on("click", function () {
       if ($(this).next().find("li").height() == 30) {
           $(this).next().find("li").animate({
               height: "0"
           }, 200);
           $(this).find("span").css({
               background: "url('${ctx}/images/backStage/sjx1.png') no-repeat 0 center"
           });
       } else {
           $(this).next().find("li").animate({
               height: "30px"
           }, 400);
           $(this).find("span").css({
               background: "url('${ctx}/images/backStage/sjx.png') no-repeat 0 center"
           });
       }
   });
   var classifyRight = $("#classifyRight");
   var addYcBox = $("#addYcBox");
   var delYcBox = $("#delYcBox");
   var cancel = $("#cancel");
   var cancel1 = $("#cancel1");
   var td4 = $(".td4");
   var td5 = $(".td5");
   classifyRight.find(bt).find("p").on("click", function () {
       addYcBox.css({
           display: "block"
       });
       mb.css({
           display: "block"
       });
   });
   cancel.on("click", function () {
       addYcBox.css({
           display: "none"
       });
       mb.css({
           display: "none"
       });
   });
   cancel1.on("click", function () {
       delYcBox.css({
           display: "none"
       });
       mb.css({
           display: "none"
       });
   });
   
   // 分类管理55555555555555555555555555555555555555555555555555结束
   // 广告管理66666666666666666666666666666666666666666666666666666开始
   var adLeft = $("#adLeft");
   var bt = $(".bt");
   adLeft.find("li").on("click", function () {
       adLeft.find("li").removeClass('active');
       $(this).addClass('active');
   });
   adLeft.find(bt).on("click", function () {
       if ($(this).next().find("li").height() == 30) {
           $(this).next().find("li").animate({
               height: "0"
           }, 200);
           $(this).find("span").css({
               background: "url('${ctx}/images/backStage/sjx1.png') no-repeat 0 center"
           });
       } else {
           $(this).next().find("li").animate({
               height: "30px"
           }, 400);
           $(this).find("span").css({
               background: "url('${ctx}/images/backStage/sjx.png') no-repeat 0 center"
           });
       }
   });
   // 广告管理66666666666666666666666666666666666666666666666666666结束
   //店铺审核开始
   $("#storeAudiBtleft").find("li").on("click", function () {
        $("#storeAudiBtleft").find("li").removeClass('active');
        $(this).addClass('active');
   });
    $("#storeAudiBtleft").find(bt).on("click", function () {
       if ($(this).next().find("li").height() == 30) {
           $(this).next().find("li").animate({
               height: "0"
           }, 200);
           $(this).find("span").css({
               background: "url('${ctx}/images/backStage/sjx1.png') no-repeat 0 center"
           });
       } else {
           $(this).next().find("li").animate({
               height: "30px"
           }, 400);
           $(this).find("span").css({
               background: "url('/yuguoAdmin/images/backStage/sjx.png') no-repeat 0 center"
           });
       }
   });         
  
        $("#storeAudiBtMain .paging4").find("li").on("click", function () {
            $("#storeAudiBtMain .paging4").find("li").removeClass('active');
            $(this).addClass('active');
        });         
        $("#storeAudiBtRight .Approve").on("click",function(){
            if ($("#storeAudiBtRight input:checkbox:checked").size() > 0) {
				mb.css("display", "block");
			} else {
                mb.css("display", "block");
				$("#storeAudiBtRight .warningBox").css("display", "block");
			}
        })
         $("#storeAudiBtRight .cancle").on("click",function(){
              $("#storeAudiBtRight .warningBox").css("display","none");
              mb.css("display","none");
         })
   //店铺审核结束
   //修改密码开始     
    $("#changePasswordMain li").on("click","button",function(){
        var index_this=$(this).parent().parent().index();
        if(index_this<3){
            $("#changePasswordMain .step").find("li").eq(index_this).css("display","none").parent().find("li").eq(index_this+1).css("display","block");
            $("#changePasswordMain .nav").find("li").eq(index_this+1).css({
                    color: "#0ca87f",
                    borderBottom: "2px solid #0ca87f"
            }).siblings().css({
                    color: "#666",
                    borderBottom: 0
            })
            $("#changePasswordMain .nav").find("li").eq(index_this+1).find("span").css({
                    backgroundColor: "#0ca87f"
            }).parent().siblings().find("span").css({
                    backgroundColor: "#cccccc"
            })
        }
    })  
   //修改密码结束     
 
    //产品图片和产品视频左右切换开始
    var cptp_sp_biaoti_ul=$("#cptp_sp_biaoti_ul");
    var tpBox=$(".tpBox");
    var spBox=$(".spBox");
    cptp_sp_biaoti_ul.find("li").on("click", function () {
        var Index=$(this).index();
        cptp_sp_biaoti_ul.find("li").eq(Index).css({
            backgroundColor: "#dddddd"

        }).siblings().css({
            backgroundColor: "#ffffff"
        });
        if(Index==0){

            tpBox.css({
                display:"block"
            });
            spBox.css({
                display:"none"
            });

        }else{
            tpBox.css({
                display:"none"
            });
            spBox.css({
                display:"block"
            });

        }
    });

        //2016-6-17 数据分析切换end

    //产品图片和产品视频左右切换结束
    //几个问号切换开始
    var  rightUl=$(".rightUl");
    rightUl.find("li").on("click", function () {
       inde=$(this).index();
	   	 if(document.getElementById('img'+inde).src == ""){
	   		 document.getElementById('img').src="";
	   	 }else{
		    	 document.getElementById('img').src=document.getElementById('img'+inde).src;
	   	 }
        $(this).css({
            border: "1px solid #62AAD5"
        }).siblings().css({
            border: "1px solid #E0E0E0"
        })
    });
    
    //几个问号切换结束
    //基本信息、扩展信息、销售属性……切换开始
    var parameterUl=$("#parameterUl");
    var parameter=$(".parameter");
    parameterUl.find("li").on("click", function () {
    	if($(this).attr("id") == "extend") {
    		loadExtendInfo('','');
			loadArea("");
    	}
        var  Index=$(this).index();
        $(this).css({
            backgroundColor:" #DDDDDD"
        }).siblings().css({
            backgroundColor:" #ffffff"
        });
        parameter.css({
            display:"none"
        }).eq(Index).css({
            display:"block"
        })
    });
    //基本信息、扩展信息、销售属性……切换结束
	var editor;
	var sjxqeditor;
	
		KindEditor.ready(function(K) {
			//产品描述编辑器
			editor = K.create('textarea[name="editor"]', {
				cssPath : '${ctx}/kindeditor/plugins/code/prettify.css',
				uploadJson : '${ctx}/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${ctx}/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterBlur: function(){this.sync();}
			});
			
			//手机详情编辑器
			sjxqeditor= K.create('textarea[name="sjxqeditor"]', {
				cssPath : '${ctx}/kindeditor/plugins/code/prettify.css',
				uploadJson : '${ctx}/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${ctx}/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterBlur: function(){this.sync();}
			});
				
			//添加图片
			K("#add").click(function(){
				if(inde!=null){
					editor.loadPlugin('filemanager', function() {
						editor.plugin.filemanagerDialog({
							viewType : 'VIEW',
							dirName : 'image',
							clickFn : function(url, title) {
								document.getElementById('img').src =url;
								document.getElementById('img'+inde).src =url;
								$("#imag"+inde).attr("value",document.getElementById('img'+inde).src+";");
								editor.hideDialog();
							}
						});
					});
				};
			});
			prettyPrint();
		});
	
		//删除图片
		$("#delTp").click(function(){
			if(inde!=null){
				document.getElementById('img').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
				document.getElementById('img'+inde).src="${ctx}/images/whenImgNoImageShowThis20150630.png";
				$("#imag"+inde).attr("value",document.getElementById('img'+inde).src+";");
			}
		});	
		
		//点击提交
		$("#sub").click(function(){
			if(!sendMessageForUserLogin()){
				$.messager.show({
					title:'系统提示',
					msg:'您的登陆已超时，您可以选择<span class="alertF" onclick="window.open(\'${ctx}/backLogin.jsp\')">打开新窗口登陆</span>',
					showType:'slide',
					style:{
						right:'',
						top:'50%',
					}
				});
				return;
			}
			setTimeout("1");
			if($("#goodsName").val()!="" && $("#cpbiaoti").val()!="" && $("#goodsClass").val()!="" && $("#sptm").val()!="" && $("#cbj").val() !="" && $("#spjg").val()!="" && $("#sjbm").val()!="" && $("#wltj").val()!="" && $("#wlzl").val()!="" && $("#sl").val()!="" && $("#yfmb").val()!="" && $("#yfmb").val()!=null){
				if($("#imag0").val().indexOf("whenImgNoImageShowThis20150630.png")<0 || $("#imag1").val().indexOf("whenImgNoImageShowThis20150630.png")<0 || $("#imag2").val().indexOf("whenImgNoImageShowThis20150630.png")<0 || $("#imag3").val().indexOf("whenImgNoImageShowThis20150630.png")<0 || $("#imag4").val().indexOf("whenImgNoImageShowThis20150630.png")<0 || $("#imag5").val().indexOf("whenImgNoImageShowThis20150630.png")<0){
					if($("#names").val()!="" && $("#values").val()!=""){
						if(isNull()){
							editor.sync();
							$("#cpms").val($("#editor").val());
							if($("#cpms").val()!=""){
								$.messager.confirm('确认对话框', '你确定修改数据吗？', function(r){
									if(r){
										sjxqeditor.sync();
										$("#ggcs").val($("#sjxqeditor").val());
				 						saveReport();
									}
								});
							}else{
								$.messager.alert("系统提示","请对产品进行描述","info");
							}
						}else{
							$.messager.alert("系统提示","请输入完整的销售属性","info");
						}
					}else{
						$.messager.alert("系统提示","请添加销售属性","info");
					}
				}else{
					$.messager.alert("系统提示","请插入产品图片","info");
				}
			}else{
				$.messager.alert("系统提示","请输入完整数据,*代表必须输入","info");
			}
		});

		function saveReport(){
			$("#loadMB").show();
			var classAttrString='';
			var tabsHid='';
			if($("#s2").combotree("getValues")!=""){
				var classAttr = $("#s2").combotree("getValues");
				for(var i=0;i<classAttr.length;i++){
					if(classAttr[i]!=null && classAttr[i]!=""){
						if(i+1==classAttr.length){
							classAttrString+=classAttr[i];
						}else{
							classAttrString+=classAttr[i]+',';
						}
					}
				}
			}
			
			if($("#tabSelect").combotree("getValues")!=""){
				var classAttr = $("#tabSelect").combotree("getValues");
				for(var i=0;i<classAttr.length;i++){
					if(classAttr[i]!=null && classAttr[i]!=""){
						if(i+1==classAttr.length){
							tabsHid+=classAttr[i];
						}else{
							tabsHid+=classAttr[i]+',';
						}
					}
				}
			}
			
			var activityId="";
			if($("#atTypeSelect").combotree("getValues")!="" && $("#atTypeSelect").combotree("getValues")!="-请选择-"){
				activityIdAtrr =  $("#atTypeSelect").combotree("getValues");
				for(var i=0;i<activityIdAtrr.length;i++){
					if (activityId != '') activityId += ',';
					activityId += activityIdAtrr[i];
				}
			}
			
			$("#classAttr").val(classAttrString);
			$("#tabsHid").val(tabsHid);
			$("#atTypeHid").val(activityId);
			$("#formSub").ajaxSubmit(function(message) {
						$("#loadMB").hide();
					// 对于表单提交成功后处理，message为提交页面的返回内容 
						mb.css({
			                display:"none"
			            });
			            addcp_yc.css({
			                height:0
			            });
			            window.reloadDatas("");//提交成功刷新jqGrid表格
			        	$("#refresh_selectGoods").click();
			            flag=false;
			            inde=0;
			            resetCreate();
			            resetXssx();
						$.messager.show({ 
						    title: '温馨提示',  
						    msg: '保存成功',  
						    timeout: 1500,
						    showType: 'slide' 
						});
					}); 
					return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
		}
					
		//清空图片 以及  form表单
		function resetCreate(){
			document.getElementById('img').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img0').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img1').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img2').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img3').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img4').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            document.getElementById('img5').src ="${ctx}/images/whenImgNoImageShowThis20150630.png";
            $("input[type=reset]").trigger("click");//触发reset按钮
			$("#fontCountGoodName").text($("#goodsName").val().length);
		}
			
		//退出系统
		$("#End").click(function(){
			$.messager.confirm('确认对话框', '您想要退出该系统吗？', function(r){
				if (r){
					$.ajax({
						type:"post",
	  					dataType:"text",
	  					url:"${ctx}/system/login/exit.do",
	  					data:{
	  						"userName":'${userName}'
	  					},
	  					success:function(data){
							window.location.href='${ctx}/backLogin.jsp';
	  					}
					})
				}
			});
		});
		
		//获取字数
		function fontSize(obj){
			var fontCount = document.getElementById(obj).value.length;
			var fontVal = document.getElementById(obj).value;
			document.getElementById("remLen").value = fontCount;
			if(fontCount>150){
				fontVal=document.getElementById(obj).value.substring(0,150);
				document.getElementById("remLen").value =150;
				document.getElementById("remLen").style.color='red';
			}
		}
		
		function cpbtSize(obj){
			var fontCount = document.getElementById(obj).value.length;
			var fontVal = document.getElementById(obj).value;
			document.getElementById("cpbtLen").value = fontCount;
			if(fontCount>60){
				document.getElementById("cpbtLen").value = 60;
				document.getElementById("cpbtLen").style.color='red';
			}
		}
		
		function goodNameSize(obj){
			var fontCount = document.getElementById(obj).value.length;
			var fontVal = document.getElementById(obj).value;
			$("#fontCountGoodName").text(fontCount);
			if(fontCount>20){
				$("#fontCountGoodName").text(20);
				document.getElementById("fontCountGoodName").style.color='red';
			}
		}
		
		//获取实时时分秒
		function GetTime() { 
			var myDate = new Date();
			var y = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
			var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
			var d = myDate.getDate();        //获取当前日(1-31)
			var def = myDate.getTimezoneOffset()/60;
			var gmt = (myDate.getHours() + def);
			var ending = ":" + IfZero(myDate.getMinutes()) + ":" +  IfZero(myDate.getSeconds());
			var ho =check24(((gmt + 8) > 24) ? ((gmt + 8) - 24) : (gmt + 8));
			var stime = ho + ending;
			document.getElementById("footerRight").innerHTML = y+"/"+m+"/"+d+" "+stime;
		}
		
		function IfZero(num) {
			return ((num <= 9) ? ("0" + num) : num);
		}
		
		function check24(hour) {
			return (hour >= 24) ? hour - 24 : hour;
		}
		
		var timer = setInterval(GetTime,1000);
		
		//获取单个分类的商品列表
		var showFlagId = "showli11";
		function showSingleClass(id){
			if(id!=""){
				$("#"+showFlagId).removeClass('active');
				$("#"+id.id).addClass('active');
				showFlagId = id.id;
				window.reloadDatas(id.id);//提交成功刷新jqGrid表格
				$("#refresh_selectGoods").click();
			}else{
				$("#"+showFlagId).removeClass('active');
				$("#showli11").addClass('active');
				showFlagId = "showli11";
				window.reloadDatas("");//提交成功刷新jqGrid表格
	        	$("#refresh_selectGoods").click();
			}
		}
		
		function getCurrentTime(){
			var myDate = new Date();
			var y = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
			var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
			var d = myDate.getDate();        //获取当前日(1-31)
			var def = myDate.getTimezoneOffset()/60;
			return y+""+m+""+d+""+def;
		}
		
var count=1;
/* 点击添加文本框 */
function add1(){
	if(count<6){
		var names="names"+count;
		var values='values'+count; 
		 $("#org").append("<br>属性名:<input type='text' id="+names +" name="+names+"  placeholder='不能以数字或者标点符号开始' class='input1Css'/>");
		 $("#org").append("<span style='margin-left: 50px;'>值:<input type='text' id="+values +" name="+values+" class='input2Css'/></span></br>");
		 count++;
		 document.getElementById("countAttr").value=count;
	}
	
}
/* 判断文本框的值是否为空 */
function isNull(){
	var	nameN;
	var	valueN;
	var temp;
	for(var i = 0;i < count;i++){
		var n = "names"+i;
		var v = "values"+i;
		nameN = document.getElementById(n).value;
		valueN = document.getElementById(v).value;
		if(nameN=='' || valueN==''){
			temp = false;
		}else{
			temp = true;
		}
	}
		return temp;
};
/* 重置输入框 */
$("#btn_res").click(function(){
	  for(var i = 0; i < count ;i++){
	  	var n = "names"+i;
		var v = "values"+i;
		document.getElementById(n).value='';
		document.getElementById(v).value=''; 
	  } 
 });
/* 重置输入框 */
function resetXssx(){
	  count=1;
	  document.getElementById("countAttr").value=count;
	  $("#org").empty();
 };
/* 单个提交产品 */
$("#uploadGoods").click(function(){
	 if($("#ifm1").contents().find("#pid").val()=="" || $("#ifm1").contents().find("#pid").val()==null){
			$.messager.alert("系统提示","请选择一行数据","info");
		}else{
			$.ajax({
				type:"post",
				dataType:"text",
				url:"${ctx}/mall/goods/batchSubmitAudit.do",
				data:{
					"goodsId":$("#ifm1").contents().find("#goodsid").val()
				},
				success:function(data){
					window.reloadDatas("");//提交成功刷新jqGrid表格
					$("#refresh_selectGoods").click();
					$.messager.show({  
					    title: '温馨提示',  
					    msg: '产品提交成功',  
					    timeout: 1500,
					    showType: 'slide' 
					});
				}
			})
		}
});
/* 批量提交产品 */
$("#batchUploadGoods").click(function(){
		var allGoodsId="";
	    var selr = jQuery('#selectGoods').jqGrid('getGridParam','selarrrow');
	    if(selr!=null && selr!="") {
	    for(var i=0;i<selr.length;i++){
			    var myrow = jQuery('#selectGoods').jqGrid('getRowData',selr[i]);
			    if(i+1==selr.length){
			    	allGoodsId+=myrow.goodsId;
			    }else{
			    	allGoodsId+=myrow.goodsId+";";
			    }
		}
	    $.messager.confirm('确认对话框', '您确定提交审核选中商品吗？', function(r){
			if (r){
				$.ajax({
					type:"post",
					dataType:"text",
					url:"${ctx}/mall/goods/batchSubmitAudit.do",
					data:{
						"goodsId":allGoodsId
					},
					success:function(data){
						window.reloadDatas("");//提交成功刷新jqGrid表格
						$("#refresh_selectGoods").click();
						$.messager.show({  
						    title: '温馨提示',  
						    msg: '产品提交成功',  
						    timeout: 1500,
						    showType: 'slide' 
						});
					}
				})
			}
	    })
    }else{
    	$.messager.alert("系统提示","请选择需要提交的商品","info");
    }
});
/* 删除产品 */
$("#delGoods").click(function(){
	 if($("#ifm1").contents().find("#pid").val()=="" || $("#ifm1").contents().find("#pid").val()==null){
			$.messager.alert("系统提示","请选择一行需要删除的数据","info");
		}else{
			$.messager.confirm('确认对话框', '您确定删除该产品吗？', function(r){
				if (r){
					$.ajax({
						type:"post",
						dataType:"text",
						url:"${ctx}/mall/goods/delGoods.do",
						data:{
							"pid":$("#ifm1").contents().find("#pid").val(),
							"goodsid":$("#ifm1").contents().find("#goodsid").val(),
							"infoid":$("#ifm1").contents().find("#infoid").val(),
						},
						success:function(data){
							var ajaxobj = eval("("+data+")");
							if(ajaxobj.success){
								window.reloadDatas("");//提交成功刷新jqGrid表格
								$("#refresh_selectGoods").click();
								$.messager.show({  
								    title: '温馨提示',  
								    msg: '删除产品成功,您可以在回收站查看',  
								    timeout: 2500,
								    showType: 'slide' 
								});
							}else{
								$.messager.show({  
								    title: '温馨提示',  
								    msg: '删除失败',  
								    timeout: 2500,
								    showType: 'slide' 
								});
							}
						}
					});
				}
			});
		}
});
/* 批量删除产品 */
$("#batchDelGoods").click(function(){
	
	var allGoodsId="";
    var selr = jQuery('#selectGoods').jqGrid('getGridParam','selarrrow');
    if(selr!="" && selr!=null) {
    for(var i=0;i<selr.length;i++)
   		{
		    var myrow = jQuery('#selectGoods').jqGrid('getRowData',selr[i]);
		    if(i+1==selr.length){
		    	allGoodsId+=myrow.goodsId;
		    }else{
		    	allGoodsId+=myrow.goodsId+";";
		    }
	    }
		$.messager.confirm('确认对话框', '您确定删除选中商品吗？', function(r){
			if (r){
				$.ajax({
					type:"post",
					dataType:"text",
					url:"${ctx}/mall/goods/batchDelGoods.do",
					data:{
						"allGoodsId":allGoodsId
					},
					success:function(data){
						var ajaxobj = eval("("+data+")");
						if(ajaxobj.success){
							window.reloadDatas("");//提交成功刷新jqGrid表格
							$("#refresh_selectGoods").click();
							$.messager.show({  
							    title: '温馨提示',  
							    msg: '删除产品成功,您可以在回收站查看',  
							    timeout: 2500,
							    showType: 'slide' 
							});
						}else{
							$.messager.show({  
							    title: '温馨提示',  
							    msg: '删除失败',  
							    timeout: 2500,
							    showType: 'slide' 
							});
						}
					}
				});
			}
		});
    }else{
    	 $.messager.alert("系统提示","请选择需要删除的商品","info");
    }
});
/*商品上下架*/
  $("#upAndDown").click(function(){
	 if($("#ifm1").contents().find("#pid").val()=="" || $("#ifm1").contents().find("#pid").val()==null){
		 $.messager.alert("系统提示","请选择商品","info");
	 }else{
		 $.messager.confirm('确认对话框', '您确定上/下架该产品吗？', function(r){
			if (r){
				$.ajax({
					type:"post",
					dataType:"json",
					url:"${ctx}/mall/goods/upAndDownGoods.do",
					data:{
						"pid":$("#ifm1").contents().find("#pid").val(),
						"goodsid":$("#ifm1").contents().find("#goodsid").val(),
						"infoid":$("#ifm1").contents().find("#infoid").val(),
					},
					success:function(data){
						if(data.success){
							window.reloadDatas("");//提交成功刷新jqGrid表格
							$("#refresh_selectGoods").click();
							$.messager.show({  
							    title: '温馨提示',  
							    msg: data.msg,  
							    timeout: 2500,
							    showType: 'slide' 
							});
						}
					}
				});
			}
		 })
	 }
 })
 /*回收站*/
function allRecycleBin(){
	/*   $("#sycp").css({
          color: "#fe934a"
      }).siblings(znav).css({
          color: "#666666"
      });
	  $(".sidebarUl").find("p").on("click", function () {
			$(".sidebarUl").find("p").css("color","#666666");
	        $(this).css("color","#fe934a");
	        
		}); */
	window.reloadDatas("recycleBin");//提交成功刷新jqGrid表格
	$("#refresh_selectGoods").click();
} 
//新增运费模版开始
  var conditionCount = 0;
  var cityCount = 0;
  var mail = $(".mail");
  var cancel = $(".cancel");
  var close = $(".close");
  var s = $("#s");
  var b = $("#b");
  var yfmbUpd = $("#yfmbUpd");
  var yfmbAdd = $("#yfmbAdd");
  var yfmbAddTc = $("#yfmbAddTc");
  var yfmbAddTcDown = $("#yfmbAddTcDown");
  var valuation = $(".valuation");
  var yfmbUpd = $("#yfmbUpd");
  var yfmbAdd = $("#yfmbAdd");
  var yfmbAddTc = $("#yfmbAddTc");
  yfmbAdd.on("click",function(){
	  if(addcp_yc.height()==488){
	      parent.mb.css("display","none");
	  }
	  
      parent.mb1.css("display","block");
      parent.yfmbAddTc.css("display","block");
      document.getElementById("saveTemp").style.display='inline-block';
	  document.getElementById("updTemp").style.display='none';
      loadArea("");
      getShipmentsTime();
  })
  yfmbUpd.on("click",function(){
	  if(addcp_yc.height()==488){
	      parent.mb.css("display","none");
	  }
	  
      loadArea("");
      getShipmentsTime();
      parent.mb1.css("display","block");
      parent.yfmbAddTc.css("display","block");
	  var tempId = $("#yfmb").val();
	  if(tempId!=null && tempId!=""){
		  getSingleTemplate(tempId);
	  }else{
		  document.getElementById("saveTemp").style.display='inline-block';
		  document.getElementById("updTemp").style.display='none';
	      loadArea("");
	      getShipmentsTime();
	  }
  });
  mail.find("label").on("click", function () {
      if (s.find("input").is(":checked")) {
          yfmbAddTcDown.css("display", "none");
      } else {
          yfmbAddTcDown.css("display", "block");
          getLogisticsCom("company_"+conditionCount);
      }
  })
  yfmbAddTc.find(close).on("click",function(){
	  $.messager.confirm('确认对话框', '您确定要放弃所编辑的内容？', function(r){
			if (r){
				if(addcp_yc.height()==488){
				      parent.mb.css("display","block");
				  }
				resetTemplate();
		        mb1.css("display","none");
		        yfmbAddTc.css("display","none");
			}
		});
  });
  yfmbAddTc.find(cancel).on("click",function(){
	  $.messager.confirm('确认对话框', '您确定要放弃所编辑的内容？', function(r){
			if (r){
				if(addcp_yc.height()==488){
				      parent.mb.css("display","block");
				  }
				resetTemplate();
		        mb1.css("display","none");
		        yfmbAddTc.css("display","none");
			}
		});
  });
  valuation.find("label").on("click",function(){
	  var value  = $('input[name="valuation"]:checked').val(); 
	  var len =  yfmbAddTcDown.find("tbody").find("tr").length;
	  if(value=="1"){
		  yfmbAddTcDown.find("table").find(".td4").html('<p>满 <input type="text" > 件包邮</p>');
	  }else if(value=="2"){
		  yfmbAddTcDown.find("table").find(".td4").html('<p>小于 <input type="text"> kg包邮</p>');
	  }else{
		  yfmbAddTcDown.find("table").find(".td4").html('<p>小于 <input type="text"> m³包邮</p>');
	  }
	  for(var i =0;i<len;i++){
		  var trId = yfmbAddTcDown.find("tbody").find("tr").eq(i).attr("id");
		  $("#"+trId).find(".td4").find("input").attr("id","fullCount_"+ trId.split("_")[1]);
		  $("#"+trId).find(".td4").find("input").attr("name","fullCount_"+ trId.split("_")[1]);
	  }
	  
	  var Index=$(this).index();
      var transport_in_box_index=$(".transport_in_box"+(Index+1));
      var transport_in_box=$(".transport_in_box");
      transport_in_box.css("display","none");
     if ($(this).find("input").is(":checked")) {
        transport_in_box_index.css("display","block");
     }
  });
  $("#isChecked").on("click",function(){
	  if ($(this).is(":checked")) {
	     $("#baoYouTable").css("display","block");
	   }else{
	     $("#baoYouTable").css("display","none");
	   }
  })
  //表格增删开始
	function addTr(){
	  var temp = checkIsInputYYg();
	  if(temp){
			conditionCount++;
			   var value  = $('input[name="valuation"]:checked').val(); 
			if(value=="1"){
			    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>满 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'"> 件包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
			}else if(value=="2"){
			    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>小于 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'"> kg包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
			}else{
			    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>小于 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'"> m³包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
			}
			    getLogisticsCom("company_"+conditionCount);
			    loadArea(conditionCount+'_'+cityCount);
	  }else{
		  $.messager.alert("系统提示","请填选包邮条件","info");
	  }
	}
    function delTr(This){
        var temp = $(This).parent().find("input").val();
        if(temp!=undefined && temp!=null && temp!=""){
        	 $.messager.confirm('确认对话框', '您确定删除？', function(r){
				if (r){
		        	$.ajax({
		      			async:false,
		    			type:"post",
		    			dataType:"json",
		    			data:{
		    				"deatilId":temp
		    			},
		    			url:"https://www.yg669.com/admin/template/delDetailTemplate.do",
// 		    			url:"http://192.168.0.132:8080/yuguo/admin/template/delDetailTemplate.do",
		   				success : function(data) {
					        $(This).parent().parent().remove();
		   				}
		   			});
				}
        	 });
        }else{
	        $(This).parent().parent().remove();
        }
    }
  //表格增删结束
	function addCity(This){
		var parentId=$(This).parent().parent().attr("id");
	  	cityCount++;
		$(This).parent().append('<hr/><select id="sheng_'+parentId.split("_")[1]+"_"+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select>');
		$(This).parent().append('<select id="shi_'+parentId.split("_")[1]+"_"+cityCount+'"><option>请选择市</option></select>');
		loadArea(parentId.split("_")[1]+'_'+cityCount);
	}
//  新增运费模版结束
	function saveTemp(){
		var merchantId = '<%= request.getSession().getAttribute("merchantId")%>';
		if(checkIsInputTemp()){
			if(document.getElementById("isChecked").checked){
				var len =  yfmbAddTcDown.find("tbody").find("tr").length;
				for(var i=0;i<len;i++){
					var array = new Array();
					var trId = yfmbAddTcDown.find("tbody").find("tr").eq(i).attr("id");
					var selectLen = yfmbAddTcDown.find("tbody").find("tr").eq(i).find(".td1").find("select").length;
					for(var j=0;j<selectLen;j++){
						var selectId = yfmbAddTcDown.find("tbody").find("tr").eq(i).find("select").eq(j).attr("id");
						var tempStr="";
						array.push(selectId);
						if(j+1==selectLen){
							for(var z=0;z<array.length;z++){
								if(z%2!=0){
									tempStr+=$("#"+array[z]).val()+";";
								}else{
									tempStr+=$("#"+array[z]).val()+",";
								}
							}
							$("#hidCity_"+trId.split("_")[1]).val(tempStr);
						}
					}
				}
				
				document.getElementById("yfmbForm").action="https://www.yg669.com/admin/template/addTemplate.do?conditionCount="+conditionCount+"&merchantId="+merchantId;
// 				document.getElementById("yfmbForm").action="http://192.168.0.132:8080/yuguo/admin/template/addTemplate.do?conditionCount="+conditionCount+"&merchantId="+merchantId;
				
				if(merchantId!=null && merchantId!=""){
					$("#yfmbForm").ajaxSubmit(function(message) {
						// 对于表单提交成功后处理，message为提交页面的返回内容 
				        	resetTemplate();
				        	getTemplateList();
							$.messager.show({ 
							    title: '温馨提示',  
							    msg: '保存成功',  
							    timeout: 1500,
							    showType: 'slide' 
							});
						}); 
				}else{
					location.href="${ctx}/backLogin.jsp";
				}

			}else{
			

			document.getElementById("yfmbForm").action="https://www.yg669.com/admin/template/addTemplate.do?conditionCount="+conditionCount+"&merchantId="+merchantId;
// 			document.getElementById("yfmbForm").action="http://192.168.0.132:8080/yuguo/admin/template/addTemplate.do?conditionCount="+conditionCount+"&merchantId="+merchantId;

			
				if(merchantId!=null && merchantId!=""){
					var option={
							async:false,
							data:{
								"conditionCount":conditionCount,
								"merchantId":merchantId
							},
							success:function(data){
								// 对于表单提交成功后处理，message为提交页面的返回内容 
					        	resetTemplate();
								if(addcp_yc.height()==488){
							      parent.mb.css("display","block");
							 	}
					        	getTemplateList();
								$.messager.show({ 
								    title: '温馨提示',  
								    msg: '保存成功',  
								    timeout: 1500,
								    showType: 'slide' 
								});
							}
					}
					
					$("#yfmbForm").ajaxSubmit(option); 
				}else{
					location.href="${ctx}/backLogin.jsp";
				}
			}
		};
	}
	/*修改运费模板*/
	function updTemp(){
		var merchantId = '<%= request.getSession().getAttribute("merchantId")%>';
		if(checkIsInputTemp()){
			if(document.getElementById("isChecked").checked){
				var len =  yfmbAddTcDown.find("tbody").find("tr").length;
				for(var i=0;i<len;i++){
					var array = new Array();
					var trId = yfmbAddTcDown.find("tbody").find("tr").eq(i).attr("id");
					var selectLen = yfmbAddTcDown.find("tbody").find("tr").eq(i).find(".td1").find("select").length;
					for(var j=0;j<selectLen;j++){
						var selectId = yfmbAddTcDown.find("tbody").find("tr").eq(i).find("select").eq(j).attr("id");
						var tempStr="";
						array.push(selectId);
						if(j+1==selectLen){
							for(var z=0;z<array.length;z++){
								if(z%2!=0){
									tempStr+=$("#"+array[z]).val()+";";
								}else{
									tempStr+=$("#"+array[z]).val()+",";
								}
							}
							$("#hidCity_"+trId.split("_")[1]).val(tempStr);
						}
					}
				}
				
				
				if(merchantId!=null && merchantId!=""){
					 $.messager.confirm('确认对话框', '您确定修改？', function(r){
							if (r){

// 				document.getElementById("yfmbForm").action="http://192.168.0.132:8080/yuguo/admin/template/updTemplate.do";
				document.getElementById("yfmbForm").action="https://www.yg669.com/admin/template/updTemplate.do";
								var option={
										async:false,
										data:{
											"conditionCount":conditionCount,
											"merchantId":merchantId
										},
										success:function(data){
											resetTemplate();
								        	if(addcp_yc.height()==488){
											      parent.mb.css("display","block");
										 	}
								        	getTemplateList();
											$.messager.show({ 
											    title: '温馨提示',  
											    msg: '修改成功',  
											    timeout: 1500,
											    showType: 'slide' 
											});
										}
								}
								
								$("#yfmbForm").ajaxSubmit(option); 
							}
						});
				}else{
					location.href="${ctx}/backLogin.jsp";
				}
			}else{
				if(merchantId!=null && merchantId!=""){
					 $.messager.confirm('确认对话框', '您确定修改？', function(r){
							if (r){
				document.getElementById("yfmbForm").action="https://www.yg669.com/admin/template/updTemplate.do";
// 				document.getElementById("yfmbForm").action="http://192.168.0.132:8080/yuguo/admin/template/updTemplate.do";
								var option={
										async:false,
										data:{
											"conditionCount":conditionCount,
											"merchantId":merchantId
										},
										success:function(data){
											resetTemplate();
								        	getTemplateList();
											$.messager.show({ 
											    title: '温馨提示',  
											    msg: '修改成功',  
											    timeout: 1500,
											    showType: 'slide' 
											});
										}
								}
								
								$("#yfmbForm").ajaxSubmit(option); 
							}
						});
				}else{
					location.href="${ctx}/backLogin.jsp";
				}
			}
		}
	}
	/*加载地区*/
  	function loadArea(temp){
  		$.ajax({
  			async:false,
			type:"post",
			dataType:"json",
			data:{
				"id":0
			},
			url:"${ctx}/system/area/getAreaInfo.do",
				success : function(data) {
					if(temp!="" && temp!=null){
						$.each(data.areaList,function(i,item){
							$("#sheng_"+temp).append("<option value="+item.areaId+">"+item.areaName+"</option>");
						});
					}else{
						$.each(data.areaList,function(i,item){
							$("#s_1").append("<option value="+item.areaId+">"+item.areaName+"</option>");
							$("#s_11").append("<option value="+item.areaId+">"+item.areaName+"</option>");
							$("#sheng_0_0").append("<option value="+item.areaId+">"+item.areaName+"</option>");
						});
					}
				}
			});
  	}
  	function changeId1(prov,city){
		var id = $('#s_1 option:selected').val();
		id = id == "请选择省" ? $('#s_11 option:selected').val() : id;
		if(id!="请选择省"){
			$.ajax({
				type:"post",
				async:false,
				dataType:"json",
				url:"${ctx}/system/area/getAreaInfo.do",
				data:{
					"id":id
				},
				success:function(data){
					$("#s_2").empty();
					$("#s_21").empty();
					$("#s_2").append("<option value=default>请选择市</option>");
					$("#s_21").append("<option value=default>请选择市</option>");
					$.each(data.areaList,function(i,item){
						$("#s_2").append("<option value="+item.areaId+">"+item.areaName+"</option>");
						$("#s_21").append("<option value="+item.areaId+">"+item.areaName+"</option>");
					});
					$("#s_3").empty();
					$("#s_3").append("<option value=default>请选择区县</option>");
					$("#s_31").empty();
					$("#s_31").append("<option value=default>请选择区县</option>");
					
					if(prov!=''){
						document.getElementById("s_2").value=prov;
						document.getElementById("s_21").value=prov;
					}
					
					if(city!=''){
						changeId2(city);
					}
				}
			});
		}else{
			$("#s_2").empty();
			$("#s_2").append("<option value=default>请选择市</option>");
			$("#s_3").empty();
			$("#s_3").append("<option value=default>请选择区县</option>");
			$("#s_21").empty();
			$("#s_21").append("<option value=default>请选择市</option>");
			$("#s_31").empty();
			$("#s_31").append("<option value=default>请选择区县</option>");
		}
	}
	function changeId2(city){
		var id = $('#s_2 option:selected').val();
		id = id == "default" ? $('#s_21 option:selected').val() : id;
		if(id!="default"){
			$.ajax({
				async:false,
				type:"post",
				dataType:"json",
				url:"${ctx}/system/area/getAreaInfo.do",
				data:{
					"id":id
				},
				success:function(data){
					$("#s_3").empty();
					$("#s_3").append("<option value=default>请选择区县</option>");
					$("#s_31").empty();
					$("#s_31").append("<option value=default>请选择区县</option>");
					$.each(data.areaList,function(i,item){
						$("#s_3").append("<option value="+item.areaId+">"+item.areaName+"</option>");
						$("#s_31").append("<option value="+item.areaId+">"+item.areaName+"</option>");
					});
					
// 					if(city!=''){
// 						document.getElementById("s_3").value=city;
// 					}
				}
			});
		}else{
			$("#s_3").empty();
			$("#s_3").append("<option value=default>请选择区县</option>");
			$("#s_31").empty();
			$("#s_31").append("<option value=default>请选择区县</option>");
		}
	}
	function changeSheng(prov,thisId){
		var id = $('#'+thisId+' option:selected').val();
		if(id!="请选择省"){
			$.ajax({
				async:false,
				type:"post",
				dataType:"json",
				url:"${ctx}/system/area/getAreaInfo.do",
				data:{
					"id":id
				},
				success:function(data){
					$("#shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).empty();
					$("#shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).append("<option value=default>请选择市</option>");
					$.each(data.areaList,function(i,item){
						$("#shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).append("<option value="+item.areaId+">"+item.areaName+"</option>");
					});
					
					if(prov!=''){
						document.getElementById("shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).value=prov;
					}
				}
			});
		}else{
			$("#shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).empty();
			$("#shi_"+thisId.split("_")[1]+"_"+thisId.split("_")[2]).append("<option value=default>请选择市</option>");
		}
	}
	function getLogisticsCom(id){
		 $.ajax({
			async:false,
	    	type:"post",
			dataType:"json",
			url:"${ctx}/system/logistic/getLogisticsCompany.do",
			data:{
				},
			success:function(data){
				if(data.success){
					$.each(data.logisticsCompany,function(i,item){
						$("#"+id).append('<option value='+item.dicIndex+'>'+item.dicName+'</option>');
					})
				}
			}
	    })
	}
	/*获取发货时间*/
	function getShipmentsTime(){
		 $.ajax({
		    	type:"post",
				dataType:"json",
				url:"${ctx}/system/dictionary/getShipmentsTime.do",
				success:function(data){
					if(data.success){
						$.each(data.sendTimeList,function(i,item){
							$("#sendTime").append('<option value='+item.id+'>'+item.dicName+'</option>');
						})
					}
				}
		    })
	}
	/*获取单个模板信息*/
	function getSingleTemplate(tempId){
		document.getElementById("hidTempId").value=tempId;
		document.getElementById("saveTemp").style.display='none';
		document.getElementById("updTemp").style.display='inline-block';
		$("#loadMB").show();
		  $.ajax({
		    	type:"post",
				dataType:"json",
				async:false,
				data:{
					"tempId":tempId
				},
				url:"https://www.yg669.com/admin/template/getSingleTemplate.do",
// 				url:"http://192.168.0.132:8080/yuguo/admin/template/getSingleTemplate.do",
				success:function(data){
					$("#loadMB").hide();
					if(data.success){
						if(data.templateList!=null){
							$("#templateName").val(data.templateList.tempName);
							$("#addressDetails").val(data.templateList.addressDetails);
							if(data.templateList.limitPrice!=null && data.templateList.limitPrice!=""){
								$("#baoyouMoney").val(data.templateList.limitPrice);
							}
							
							if(data.templateList.isDefault!="0"){
								$("#isDefault").attr("checked",true);
							}
							if(data.templateList.area!=null && data.templateList.area!=""){
								$("#s_1").val(data.templateList.area.split(",")[0]);
								changeId1("","");
								$("#s_2").val(data.templateList.area.split(",")[1]);
								changeId2("");
								$("#s_3").val(data.templateList.area.split(",")[2]);
							}
							$("#sendTime").val(data.templateList.deliverTime);
							checkIsYYg(data.templateList.isYyg);
							
							if(data.templateList.isYyg=="0"){
						          yfmbAddTcDown.css("display", "block");
						          getLogisticsCom("company_"+conditionCount);
								checkValuation(data.templateList.valueationWay);
								checkDeliverType(data.templateList.deliverType);
							         
							      var transport_in_box_index=$(".transport_in_box"+data.templateList.valueationWay);
							      var transport_in_box=$(".transport_in_box");
							      transport_in_box.css("display","none");
							      transport_in_box_index.css("display","block");
								if(data.templateList.valueationWay=="1"){
									$("#goodsCount").val(data.templateList.standardLimit);
									$("#countRMB").val(data.templateList.standandPrice);
									$("#singleCount").val(data.templateList.imcrement);
									$("#addCount").val(data.templateList.imcrementPrice);
								}else if(data.templateList.valueationWay=="2"){
									$("#goodsKg").val(data.templateList.standardLimit);
									$("#kgRMB").val(data.templateList.standandPrice);
									$("#singleKg").val(data.templateList.imcrement);
									$("#addKg").val(data.templateList.imcrementPrice);
								}else{
									$("#goodsCube").val(data.templateList.standardLimit);
									$("#cubeRMB").val(data.templateList.standandPrice);
									$("#singleCube").val(data.templateList.imcrement);
									$("#addCube").val(data.templateList.imcrementPrice);
								}
							}
						
							if(data.details!=null && data.details.length>0){
								$("#isChecked").attr("checked","checked");
								$("#baoYouTable").css("display","block");
								 yfmbAddTcDown.css("display", "block");
								$.each(data.details,function(i,item){
									if(i==0){
										var area = item.area;
										var areaCount = area.split(";");
										for(var j=0;j<areaCount.length;j++){
											if(areaCount[j]!=null && areaCount[j]!=""){
													if(j==0){
														$("#sheng_0_0").val(areaCount[j].split(",")[0]);
														changeSheng("","sheng_0_0");
														$("#shi_0_0").val(areaCount[j].split(",")[1]);
													}else{
													  	cityCount++;
														$("#tr_0").find(".td1").append('<hr/><select id="sheng_0_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select>');
														$("#tr_0").find(".td1").append('<select id="shi_0_'+cityCount+'"><option>请选择市</option></select>');
														loadArea('0_'+cityCount);
// 														document.getElementById("#sheng_0_"+cityCount).value=areaCount[j].split(",")[0];
														$("#sheng_0_"+cityCount).val(areaCount[j].split(",")[1]);
														changeSheng("","sheng_0_"+cityCount);
// 														document.getElementById("#shi_0_"+cityCount).value=areaCount[j].split(",")[1];
														$("#shi_0_"+cityCount).val(areaCount[j].split(",")[1]);
													}
											}
										}
										$("#tr_0").find(".td5").append('<input type="hidden" id="datailId_0" name="datailId_0" value='+item.yygId+'>');
										$("#sendWay_0").val(item.deliverType);
// 										getLogisticsCom("company_0");
										$("#company_0").val(item.deliverWay);
										if(data.templateList.valueationWay=="1"){
											$("#fullCount_0").val(item.count);
										}else if(data.templateList.valueationWay=="2"){
											$("#fullCount_0").val(item.weight);
										}else{
											$("#fullCount_0").val(item.volume);
										}
									}else{
										conditionCount=i;
										if(data.templateList.valueationWay=="1"){
										    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>满 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'" value='+item.count+'> 件包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
										}else if(data.templateList.valueationWay=="2"){
										    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>小于 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'" value='+item.weight+'> kg包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
										}else{
										    yfmbAddTcDown.find("tbody").append('<tr id="tr_'+conditionCount+'"><td class="td1"><input type="hidden" name="hidCity_'+conditionCount+'" id="hidCity_'+conditionCount+'"><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select><select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select><span onclick="addCity(this);">+添加</span></td><td class="td2"><select id="sendWay_'+conditionCount+'" name="sendWay_'+conditionCount+'"><option value="1">快递</option><option value="2">与果配送</option></select></td><td class="td3"><select id="company_'+conditionCount+'" name="company_'+conditionCount+'"></select></td><td class="td4"><p>小于 <input type="text" name="fullCount_'+conditionCount+'" id="fullCount_'+conditionCount+'" value='+item.volume+'> m³包邮</p></td><td class="td5"><span class="add" onclick="addTr('+conditionCount+');"></span><span class="del" onclick="delTr(this);"></span></td></tr>')
										}
										$("#tr_"+conditionCount).find(".td5").append('<input type="hidden" id="datailId_'+conditionCount+'" name="datailId_'+conditionCount+'" value='+item.yygId+'>');
										
										$("#sendWay_"+conditionCount).val(item.deliverType);
										getLogisticsCom("company_"+conditionCount);
										$("#company_"+conditionCount).val(item.deliverWay);
										
										var area = item.area;
										var areaCount = area.split(";");
										for(var j=0;j<areaCount.length;j++){
											if(areaCount[j]!=null && areaCount[j]!=""){
												if(j==0){
													loadArea(conditionCount+'_'+cityCount);
													$('#sheng_'+conditionCount+'_'+cityCount).val(areaCount[j].split(",")[0]);
													changeSheng("","sheng_"+conditionCount+'_'+cityCount);
													$('#shi_'+conditionCount+'_'+cityCount).val(areaCount[j].split(",")[1]);
												}else{
												  	cityCount++;
													$("#tr_"+conditionCount).find(".td1").append('<hr/><select id="sheng_'+conditionCount+'_'+cityCount+'" onchange="changeSheng('+"''"+',this.id)"><option>请选择省</option></select>');
													$("#tr_"+conditionCount).find(".td1").append('<select id="shi_'+conditionCount+'_'+cityCount+'"><option>请选择市</option></select>');
													loadArea(conditionCount+'_'+cityCount);
													$("#sheng_"+conditionCount+"_"+cityCount).val(areaCount[j].split(",")[0]);
													changeSheng("","sheng_"+conditionCount+"_"+cityCount);
													$("#shi_"+conditionCount+"_"+cityCount).val(areaCount[j].split(",")[1]);
												}
											}
										}
									}
								})
							}
						}
					}
				}
		    })
	}
	/*获取运费模板列表*/
	function getTemplateList(){
		var merchantId = '<%= request.getSession().getAttribute("merchantId")%>';
		if(merchantId!=null && merchantId!=""){
			$.ajax({
				async:false,
		    	type:"post",
				dataType:"json",
				data:{
					"merchantId":merchantId
				},
				url:"https://www.yg669.com/admin/template/getTemplateList.do",
// 				url:"http://192.168.0.132:8080/yuguo/admin/template/getTemplateList.do",
				success:function(data){
					if(data.success){
						$("#yfmb").empty();
						$("#ifm1").contents().find("#yfmb").empty();
						$.each(data.templateList,function(i,item){
							$("#ifm1").contents().find("#yfmb").append('<option value='+item.tempId+'>'+item.tempName+'</option>');
							$("#yfmb").append('<option value='+item.tempId+'>'+item.tempName+'</option>');
						})
					}
				}
		    })
		}else{
			location.href="${ctx}/backLogin.jsp";
		}
	}
	/*删除运费模板*/
	function delTemplate(str){
		var merchantId = '<%= request.getSession().getAttribute("merchantId")%>';
		if(merchantId!=null && merchantId!=""){
			if(str=="child"){
				var tempId = $("#ifm1").contents().find("#yfmb").val();
				var tempName = $("#ifm1").contents().find("#yfmb option:selected").text();
			}else{
				var tempId = $("#yfmb").val();
				var tempName = $("#yfmb option:selected").text();
			}
			if(tempId!="" && tempId!=null){
				$.messager.confirm('确认对话框', '删除后，该模板对应的商品模板会更改为默认模板，您确定删除‘'+tempName+'’吗？', function(r){
					if(r){
						$.ajax({
							async:false,
					    	type:"post",
							dataType:"json",
							data:{
								"tempId":tempId
							},
							url:"https://www.yg669.com/admin/template/delTemplate.do",
// 							url:"http://192.168.0.132:8080/yuguo/admin/template/delTemplate.do",
							success:function(data){
								if(data.success){
									$("#ifm1").contents().find("#yfmb  option[value='" + tempId + "']").remove();
									$("#yfmb option[value='" + tempId + "']").remove();
								}else{
									$.messager.alert("系统提示",data.message,"info");
								}
							}
					    })
					}
				})
			}
		}else{
			location.href="${ctx}/builder/backLogin.jsp";
		}
	}
	/*清除运费模板历史*/
	function resetTemplate(){
		conditionCount=0;
		cityCount=0;
		$("#templateName").val("");
		$("#addressDetails").val("");
		$("#goodsKg").val("");
		$("#kgRMB").val("");
		$("#singleKg").val("");
		$("#addKg").val("");
		$("#goodsCount").val("");
		$("#countRMB").val("");
		$("#singleCount").val("");
		$("#addCount").val("");
		$("#goodsCube").val("");
		$("#cubeRMB").val("");
		$("#singleCube").val("");
		$("#addCube").val("");
		$("#isDefault").attr("checked",false);
		$("#isChecked").attr("checked",false);
		$("#baoYouTable").css("display","none")
		$("input[name=mail]:eq(0)").attr("checked",'checked');
		$("input[name=valuation]:eq(0)").attr("checked",'checked');
		$("input[name=transport]:eq(0)").attr("checked",'checked');
		document.getElementById("s_1").value="请选择省";
		document.getElementById("sheng_0_0").value="请选择省";
		$("#s_2").empty();
		$("#s_2").append("<option value=default>请选择市</option>");
		$("#s_3").empty();
		$("#s_3").append("<option value=default>请选择区县</option>");
		$("#shi_0_0").empty();
		$("#shi_0_0").append("<option value=default>请选择市</option>");
		$("#company_0").empty();
		$("#sendTime").empty();
		$("#fullCount_0").val("");
		yfmbAddTcDown.css("display", "none");
		mb1.css("display","none");
        yfmbAddTc.css("display","none");
		
		var len =  yfmbAddTcDown.find("tbody").find("tr").length;
		for(var i=0;i<len;i++){
			var trId = yfmbAddTcDown.find("tbody").find("tr").eq(i).attr("id");
			if(i>0){
				$("#"+trId).remove();
			}
		}
	}
	/*是否包邮*/
	function checkIsYYg(radiovalue){
		var obj = document.getElementsByName("mail");
	    for(i = 0; i < obj.length; i++){  
	      if(obj[i].value == radiovalue){
	        obj[i].checked = true;
	      }  
	    }
	}
	/*计价方式*/
	function checkValuation(radiovalue){
		var obj = document.getElementsByName("valuation");
	    for(i = 0; i < obj.length; i++){  
	      if(obj[i].value == radiovalue){  
	        obj[i].checked = true;
	      }  
	    }
	}
	/*计价方式*/
	function checkDeliverType(radiovalue){
		var obj = document.getElementsByName("transport");
	    for(i = 0; i < obj.length; i++){  
	      if(obj[i].value == radiovalue){  
	        obj[i].checked = true;
	      }  
	    }
	}
	/*验证是否输入*/
	function checkIsInputTemp(){
		var temp = false;
		if($("#templateName").val()!=null && $("#templateName").val()!=""){
			if($("#s_1").val()!="请选择省" && $("#s_1").val()!="default" && $("#s_2").val()!="请选择市" && $("#s_2").val()!="default" && $("#s_3").val()!="请选择区县" && $("#s_3").val()!="default"){
				if($("#addressDetails").val()!=null){
					/*自定义运费检查*/
					if(b.find("input").is(":checked")){
						var valuationCheck = getValuation();
						  if(valuationCheck=="1"){
							  if($("#goodsCount").val() !="" && $("#countRMB").val() !="" && $("#singleCount").val() !="" && $("#addCount").val() !=""){
								  if(document.getElementById("isChecked").checked){
 										if(checkIsInputYYg()){
 											temp=true;
									    }else{
 											temp=false;
								    	}
								    }else{
 											temp=true;
								    }
							  }else{
								  $.messager.alert("系统提示","请填写运费规则","info");
							  }
						  }else if(valuationCheck=="2"){
							  if($("#goodsKg").val() !="" && $("#kgRMB").val() !="" && $("#singleKg").val() !="" && $("#addKg").val() !=""){
								  if(document.getElementById("isChecked").checked){
									  if(checkIsInputYYg()){
											temp=true;
									    }else{
											temp=false;
								    	}
								    }
							  }else{
								  $.messager.alert("系统提示","请填写运费规则","info");
							  }
						  }else{
							  if($("#goodsCube").val() !="" && $("#cubeRMB").val() !="" && $("#singleCube").val() !="" && $("#addCube").val() !=""){
								  if(document.getElementById("isChecked").checked){
									  if(checkIsInputYYg()){
											temp=true;
									    }else{
											temp=false;
									    	}
									    }
								  }
							  }
					}else{
						temp=true;
					}
				}else{
					$.messager.alert("系统提示","请输入地址","info");
				}
			}else{
				$.messager.alert("系统提示","请选择地址","info");
			}
		}else{
			$.messager.alert("系统提示","请输入模板名称","info");
		}
		
		return temp;
	}
	/*计价方式*/
	function getValuation(){
		var temp = document.getElementsByName("valuation");
	  	  var intHot="";
		  for(var i=0;i<temp.length;i++){
		  	if(temp[i].checked)
        	intHot = temp[i].value;
		  }
		  return intHot;
	}
	/*检查包邮条件是否输入*/
	function checkIsInputYYg(){
		var len =  yfmbAddTcDown.find("tbody").find("tr").length;
		var temp= true;
		for(var i=0;i<len;i++){
			  var selectId = yfmbAddTcDown.find("tbody").find("tr").eq(i).find(".td1").find("select");
			  var countInput = yfmbAddTcDown.find("tbody").find("tr").eq(i).find(".td4").find("input").val();
			  for(var j=0;j<selectId.length;j++){
				  if($("#"+selectId[j].id).val()=="default" || $("#"+selectId[j].id).val()=="请选择市" || $("#"+selectId[j].id).val()=="请选择县"){
					  temp = false;
					  break;
				  }
			  }
			  if(countInput=="" || countInput==null){
				  temp = false;
				  break;
			  }
		}
		return temp;
	}
	$("#uploadGoodsToYG").click(function(){
			var allGoodsId="";
		    var selr = jQuery('#selectGoods').jqGrid('getGridParam','selarrrow');
		    if(selr!=null && selr!="") {
		    for(var i=0;i<selr.length;i++){
				    var myrow = jQuery('#selectGoods').jqGrid('getRowData',selr[i]);
				    if(i+1==selr.length){
				    	allGoodsId+=myrow.goodsId;
				    }else{
				    	allGoodsId+=myrow.goodsId+";";
				    }
			}
		    $.messager.confirm('确认对话框', '您确定上传选中商品吗？', function(r){
				if (r){
					$("#loadMB").css({
				           display:"block"
			        });
					$.ajax({
						type:"post",
						dataType:"text",
						url:"${ctx}/mall/goods/batchUploadGoods.do",
						data:{
							"allGoodsId":allGoodsId
						},
						success:function(data){
							$("#loadMB").css({
					           display:"none"
					        });
							var ajaxobj=eval("("+data+")");
							if(ajaxobj.success){
								window.reloadDatas("");//提交成功刷新jqGrid表格
								$("#refresh_selectGoods").click();
								$.messager.show({  
								    title: '温馨提示',  
								    msg: '上传成功',  
								    timeout: 1500,
								    showType: 'slide' 
								});
							}else{
								$.messager.show({  
								    title: "系统消息",  
								    msg: ajaxobj.result,  
								    timeout: 1500,
								    showType: 'slide' 
								});
							}
						}
					})
				}
		    })
	    }else{
	    	$.messager.alert("系统提示","请选择上传商品","info");
	    }
	 });
	/*单击是否推荐按钮事件*/
	function cbClick(obj) {
		if(obj.checked) {
			$("#isunRecommendVal").val("1");
		} else {
			$("#isunRecommendVal").val("0");
		}
	}           
</script>
<script>
	$("#parsers").on("click","li", function(){
		var i = $(this).index();
		if(i==0){
			$("#parsers").find("li").css("background","#fff");
			$(this).css("background","#ddd");
			$("#shsers").css("display","block");
			$("#shserss").css("display","none");
		}else if(i==1){
			$("#parsers").find("li").css("background","#fff");
			$(this).css("background","#ddd");
			$("#shsers").css("display","none");
			$("#shserss").css("display","block");
		}
	});
	$("#Help").on("click", function(){
// 		window.open('${ctx}/admin/help/getHelpWord.do',"_blank");
	});
	function loadMBContr(type){
		if(type==1){
			$("#loadMB").show();
		}else{
			$("#loadMB").hide();
		}
	}
	$("#exportCSV").on("click",function() {
		var allGoodsId="";
	    var selr = jQuery('#selectGoods').jqGrid('getGridParam','selarrrow');
	    if(selr!=null && selr!="") {
		    for(var i=0;i<selr.length;i++){
				    var myrow = jQuery('#selectGoods').jqGrid('getRowData',selr[i]);
				    if(i+1==selr.length){
				    	allGoodsId+=myrow.goodsId;
				    }else{
				    	allGoodsId+=myrow.goodsId+";";
				    }
			}
	    }
	    window.location = ctx + "/mall/goods/exportCSV.do?goodsId=" + allGoodsId;
	});
</script>

</body>

</html>