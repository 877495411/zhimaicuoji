<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<%@include file="/common/include.jsp" %>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/css/backStage.css">
</head>
<body>
	<div id="indexQtDiv">
<!-- 	   <div class="bjBox" > -->
<!--    			<img id="imgOne" onload="imgResize(550,100,this);"/> -->
<!--    			<button id="adAddImg" class="adAddImg " onclick="adAddImg('imgOne');"><font color="red">*</font>添加图片</button><br/> -->
<!-- 	   </div> -->
<!-- 	   <label> -->
<!-- 	   		<span class="f6014">*</span><span>URL地址:</span> -->
<!-- 	        <input id="adUrlIpt" type="text" placeholder="http://www.yuguo.com"/> -->
<!-- 	   </label> -->
	   <label style="padding-right: 7px;padding-left: 8px;">
	   	    <span class="f6014">*</span><span>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:</span>
	       <textarea  maxlength="300" id="lmmd" title="最多输入150个字符" name="lmmd"></textarea>
	   </label>
	   <label style="padding-right: 7px;padding-left: 8px;">
	   	    <span class="f6014"></span><span>段落标题:</span>
	       <input type="text" name="duanluo" id="duanluo" style="width: 70%"/>
	   </label>
	</div>
	<div id="indexLbDiv" style="display:none;">
         <div class="tpspBigBox">
		      <ul id="cptp_sp_biaoti_ul">
		          <li style="background-color: #DDDDDD; border-top-left-radius:5px;"><font color="red">*</font>广告图片</li>
		      </ul>
		      <div class="tpBox" style="height: 250px;">
		          <div class="lbBox" id="sBox"><img id="imgIShow" width="550px" height="200px"></div>
		          <ul id="rightUlI">
		              <li style="border: 1px solid #62AAD5; cursor: pointer"><img id="imgI0" width="100%" height="30px"></li>
		              <li style="cursor: pointer;"><img id="imgI1" width="100%" height="30px"></li>
		              <li style="cursor: pointer; "><img id="imgI2" width="100%" height="30px"></li>
		              <li style="cursor: pointer; "><img id="imgI3" width="100%" height="30px"></li>
		              <li style="cursor: pointer;"><img id="imgI4" width="100%" height="30px"></li>
		          </ul>
		          <ul class="mzUrlUl">
		          	  <li><input type="text" id="mzIpt0" class="mzIpt" style="height: 30px;" placeholder="URl:http://www.yuguo.com" /></li>
		              <li><input type="text" id="mzIpt1" class="mzIpt" style="height: 30px;" placeholder="URl:http://www.yuguo.com" /></li>
		              <li><input type="text"  id="mzIpt2" class="mzIpt" style="height: 30px;" placeholder="URl:http://www.yuguo.com" /></li>
		              <li><input type="text" id="mzIpt3" class="mzIpt" style="height: 30px;" placeholder="URl:http://www.yuguo.com" /></li>
		              <li><input type="text" id="mzIpt4" class="mzIpt" style="height: 30px;" placeholder="URl:http://www.yuguo.com" /></li>
		          </ul>
		          <button class="addTp" id="addTpI">+ 添加图片</button>
		          <button class="delTP" id="delTpI">- 删除图片</button>
		      </div>
  		</div>
	</div>
</body>
<script type="text/javascript">
$(function () {
	var adId = $("#adIdIpt").val();
	var type = parseInt(${param.type});
	showGGMS("liIndex2",0);
	if(type!=1){
		$.ajax({
			type:"post",
			dataType:"json",
			async:false,
			data:{"adId":adId},
			url:"${ctx}/system/advertise/getAdvertiseInfo.do",
			success:function(data){
				if(data.success){
					var adPosition = data.adAllInfo.adLocation;
					var adPage = data.adAllInfo.adPageLocation;
					setSelectChecked("gglx1",data.adAllInfo.adType);
// 					setSelectChecked("ggPage1",adPage);
// 					setSelectChecked("ggwz1",adPosition);
					if(adPage!=1){
						$("#qtmzLabel1").css({display:"block"});
						$("#indexmzLabel1").css({display:"none"});
					}else{
						$("#indexmzLabel1").css({display:"block"});
						$("#qtmzLabel1").css({display:"none"});
					}
					if(adPosition!=2){ //头部/尾部
						$("#indexQtDiv").css({display:"block"});
						$("#indexLbDiv").css({display:"none"});
						document.getElementById("lmmd").value=data.adAllInfo.adDetailDesc;
						document.getElementById("duanluo").value=data.adAllInfo.remark;
// 						document.getElementById("adUrlIpt").value=data.adAllInfo.adUrl;
						if(data.adAllInfo.imageUrl!=null && data.adAllInfo.imageUrl!=""){
// 							document.getElementById('imgOne').src="";
// 							document.getElementById('imgOne').src='${ctx}/'+data.adAllInfo.imageUrl;
// 							$("#imgOne").attr("value",data.adAllInfo.imageUrl);
						}
					}else{  //轮播图位
						$("#indexQtDiv").css({display:"none"});
						$("#indexLbDiv").css({display:"block"});
						document.getElementById('imgIShow').src = '${ctx}/'+data.strImgArr[0];
						$.each(data.strImgArr,function(i,item){
							if(item!=null && item!=""){
								document.getElementById("imgI"+i).src='${ctx}/'+item;
							}
						});
						$.each(data.strAdUrl,function(i,item){
							document.getElementById("mzIpt"+i).value=item;
						});
					}
					ggeditor1.html(data.adDescInfo);
					document.getElementById("ggym1").value=data.adDescInfo;
					document.getElementById("adIsUpload").value=data.adAllInfo.remark1;
					document.getElementById("adTypeHidden").value = data.adAllInfo.adType;
					if(data.adAllInfo.remark1==null || data.adAllInfo.remark1=="0" ){
						document.getElementById("uploadB").disabled=false;
					}else if(data.adAllInfo.remark1=="1"){
						document.getElementById("uploadB").disabled=true;
					}
				}
			}
		});
	}else{
		setSelectChecked("gglx",1);
		setSelectChecked("gglx1",1); 
	}
	parent.loadMBContr(0);
});
KindEditor.ready(function(K) {
	//广告描述编辑器
	editor = K.create('textarea[name="editor"]', {
		cssPath : '${ctx}/kindeditor/plugins/code/prettify.css',
		uploadJson : '${ctx}/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '${ctx}/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true
	});
	//添加图片
	K("#addTpI").click(function(){
		if(inde!=null){
			editor.loadPlugin('filemanager', function() {
				editor.plugin.filemanagerDialog({
					viewType : 'VIEW',
					dirName : 'image',
					clickFn : function(url, title) {
						document.getElementById('imgIShow').src =url;
						document.getElementById('imgI'+inde).src =url;
						$("#imag"+inde).attr("value",document.getElementById('imgI'+inde).src+";");
						editor.hideDialog();
					}
				});
			});
		};
	});
	prettyPrint();
});
//删除图片
$("#delTpI").click(function(){
if(inde!=null){
	document.getElementById('imgIShow').src ="${ctx}/adminue/images/whenImgNoImageShowThis20150630.png";
	document.getElementById('imgI'+inde).src="${ctx}/adminue/images/whenImgNoImageShowThis20150630.png";
	$("#imagLB"+inde).attr("value",document.getElementById('imgI'+inde).src+";");
}
});	
//广告图片li的下标
var inde=0;
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
//广告图片和广告视频左右切换结束
var  rightUlI=$("#rightUlI");
rightUlI.find("li").on("click", function () {
   inde=$(this).index();
	if(document.getElementById('imgI'+inde).src == ""){
		 document.getElementById('imgIShow').src="";
	}else{
  	document.getElementById('imgIShow').src=document.getElementById('imgI'+inde).src;
	}
    $(this).css({
        border: "1px solid #62AAD5"
    }).siblings().css({
        border: "1px solid #bbbbbb"
    })
});
$(document).ready(function(){ 
	$('#ggwz').change(function(){
		var Index = $(this).children('option:selected').val();
		if(Index!=2){ //头部/尾部
			$("#indexQtDiv").css({display:"block"});
			$("#indexLbDiv").css({display:"none"});
		}else{
			$("#indexQtDiv").css({display:"none"});
			$("#indexLbDiv").css({display:"block"});
		}
		document.getElementById("ggym").value="";
		ggeditor.html("");
	});
});
function saveIndexAdd(){
 	var adType = $("#gglx").children('option:selected').val();
 	var adPage = $('#ggPage').children('option:selected').val();
 	var adTitle;
 	var adPosition;
 	adPosition = $('#ggwz').children('option:selected').val();
 	adTitle =  $("#lmmd").val();
 	adTitle = adTitle.length>10?adTitle:adTitle.substring(0,9);
	IndexChangeData(adType,adPage,adTitle,adPosition,0);
}
function saveIndexChange(){
	var adType = $("#gglx1").children('option:selected').val();
 	var adPage = $('#ggPage1').children('option:selected').val();
 	var adTitle;
 	var adPosition;
 	adPosition = $('#ggwz1').children('option:selected').val();
 	adTitle =  creatTitleName(adPage,$('#ggPage1').children('option:selected').text(),$('#ggwz1').find("option:selected").text(),"Sy");
 	IndexChangeData(adType,adPage,adTitle,adPosition,1);
}
function IndexChangeData(adType,adPage,adTitle,adPosition,saveType){
	var imgUrl="";
 	var adDetailDesc=""; //广告描述
 	var adImages="";
	if(adPosition!=2){ //头部/尾部
//  		adImages = getAdImgUrl($("#imgOne")[0].src);
//  		if($("#adUrlIpt").val()!=null && $("#adUrlIpt").val()!=""){
//  			imgUrl = Trim($("#adUrlIpt").val(),"g");
// 		}else{
// 			imgUrl+="#";
// 		}
 		adDetailDesc = $("#lmmd").val(); 
 	}else{  //轮播图位
//  		for(var i=0;i<5;i++){
//  			adImages+=getAdImgUrl($("#imgI"+i)[0].src)+";";
//  			if($("#mzIpt"+i).val()!=null && $("#mzIpt"+i).val()!="" && $("#mzIpt"+i).val()!="#"){
//  				imgUrl += Trim($("#mzIpt"+i).val(),"g")+";";
//  			}else{
//  				imgUrl+="#;";
//  			}
//  		}
 	}
	var adDesc;
	if(saveType==0 || saveType==2 ){
		ggeditor.sync();
		$("#ggms").val($("#ggeditor").val());
		adDesc=$("#ggms").val();
	}else{
		ggeditor1.sync();
		$("#ggms1").val($("#ggeditor1").val());
		adDesc=$("#ggms1").val();
	}
	var adId = $("#adIdIpt").val();
	var dlTitle = $("#duanluo").val();
    $.ajax({
		type:"post",
		dataType:"json",
		async:false,
		data:{"adType":adType,
			"adPage":adPage,
			"adTitle":adTitle,
			"adPosition":adPosition,
			"adUrl":imgUrl,
			"adDetailDesc":adDetailDesc,
			"adImages":adImages,
			"saveType":saveType,
			"adId":adId,
			"adDesc":adDesc,
			"dlTitle":dlTitle
		},
		url:"${ctx}/system/advertise/saveIndexAd.do",
		success:function(data){
			if(data.success){
				if(saveType==0){
					parent.loadMBContr(0);
					change_div("successBc","保存成功");
					adColse();
					adShowType();
					showAdInfo(data.adId,adType);
				}else{
					parent.loadMBContr(0);
					document.getElementById("adIsUpload").value="0";
					document.getElementById("uploadB").disabled=false;
					change_div("success","修改成功");
					adColse();
					showAdInfo(data.adId,adType);
					$("#mb2").hide();
				}
			}else{
				if(saveType==0){
					change_div("successBc","保存失败");
					adColse();
				}else{
					parent.loadMBContr(0);
					change_div("success","修改失败");
					$("#mb2").hide();
					adColse();
				}
			}
		}
	});  
    parent.loadMBContr(0);
}
function getAdImgUrl(adImgs){
	var images="";
	if(adImgs!=null && adImgs!="" && adImgs.indexOf("whenImgNoImageShowThis20150630.png")<0){
		var imgS = adImgs.split("attached");
		images= "attached"+imgS[1];
	}
	return images;
}
/*判断输入框是否为空*/
function iptIsNull(){
	var adUrl = $("#adUrlIpt").val();
	var adImg =$("#imgOne")[0].src;
	if(adUrl=="" || adImg=="" ){
		return false;
	}else{
		return true;
	}
}
/*显示框初始化*/
function clearInputValue(){
	document.getElementById("lmmd").value="";
// 	document.getElementById("adUrlIpt").value="";
	document.getElementById("gglx").value="";
	document.getElementById("duanluo").value="";
	document.getElementById("imgUrlxg").value="";
	document.getElementById("adIdIpt").value="";
	document.getElementById("adIsUpload").value="";
	document.getElementById("ggym1").value="";
	document.getElementById("adTypeHidden").value="";
	ggeditor1.html("");
	document.getElementById("uploadB").disabled=true;
}
function clearInputValue2(){
	clearInputValue();
	document.getElementById("ggym").value="";
	ggeditor.html("");
}
</script>
</html>