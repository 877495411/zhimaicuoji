<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
 <title></title>
 	<%@include file="/common/include.jsp" %>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/css/backStage.css">
	<script type="text/javascript" src="${ctx}/common/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${ctx}/common/kindeditor/plugins/filemanager/filemanager.js"></script>
	<script type="text/javascript" src="${ctx}/common/kindeditor/plugins/image/image.js"></script>
	<script type="text/javascript" src="${ctx}/common/kindeditor/plugins/code/prettify.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/kindeditor/themes/default/default.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/kindeditor/plugins/code/prettify.css"/>
</head>
<script type="text/javascript">
var ctx = "${ctx}";
var ggeditor1;
var ggeditor;
var ggeditor4;
var isFlag = true;   // true 广告类  false 公告
$(function () {
    $.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/dictionary/getDictionaryInfo.do",
		success:function(data){
			if(data.result){
				var strAP= "";
				$.each(data.dAllInfo,function(i,item){
					if(i==0){
						strAP+="<option value="+item.dicIndex+" selected='selected'>"+item.dicName+"</option>";
					}else{
						strAP+="<option value="+item.dicIndex+">"+item.dicName+"</option>";
					} 
				});
				$("#gglx").html("");
				$("#gglx1").html("");
				$("#gglx").append(strAP);
				$("#gglx1").append(strAP);
			}
		}
		});
	showGGMS1("liIndex0",0);
	loadMBContr(1);
	getAdPageInfo(1);
	loadMBContr(0);
});
function loadMBContr(type){
	if(type==1){
		$("#loadMB").show();
	}else{
		$("#loadMB").hide();
	}
}
/*广告描述*/
KindEditor.ready(function(K) {
		//广告描述编辑器
		ggeditor1 = K.create('textarea[name="ggeditor1"]', {
			cssPath : '${ctx}/common/kindeditor/plugins/code/prettify.css',
			uploadJson : '${ctx}/common/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '${ctx}/common/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true
		});
		ggeditor = K.create('textarea[name="ggeditor"]', {
				cssPath : '${ctx}/common/kindeditor/plugins/code/prettify.css',
				uploadJson : '${ctx}/common/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${ctx}/common/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true
		});
		ggeditor4 = K.create('textarea[name="ggeditor4"]', {
			cssPath : '${ctx}/common/kindeditor/plugins/code/prettify.css',
			uploadJson : '${ctx}/common/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '${ctx}/common/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true
		});
});
function adAddImg(imgId){
	ggeditor1.loadPlugin('filemanager', function() {
		ggeditor1.plugin.filemanagerDialog({
			viewType : 'VIEW',
			dirName : 'image',
			clickFn : function(url, title) {
				
				document.getElementById(imgId).src =url;
				$("#"+imgId).attr("value",document.getElementById(imgId).src);
				ggeditor1.hideDialog();
			}
		});
	});
	prettyPrint();
}
</script>
<body onload="showDivInfo();">

<div id="mb"></div>
   <div id="mb1"></div>
   <div id="mb2"></div>
<div id="loadMB"><div class="lvju"><img src="${ctx}/images/backStage/lvju.gif" /></div></div>
 <div style="width: 1250px;margin:0 auto;">
<!-- ***********************************************************楼层开始*********************************************************************************** -->
<div id="adLeft">
	<div class="divAd" onclick="showDivInfo();">
		<p id="allAd">
			<img  id="adtbimg" src="${ctx}/images/backStage/r3.png" alt="" /> 中文文章</p>
	</div>
	<div style="display: block;" id="adlf"></div>
	<div class="divAd" onclick="showEnglish();">
		<p id="allAd1">
			<img  id="adtbimg1" src="${ctx}/images/backStage/r3.png" alt="" />english text</p>
	</div>
	<div style="display: block;" id="englishAd"></div>
</div>
<div id="lcRight" style="display: none;">
	<div class="bt" >
        <button  onclick="addLcOnclick();">
            <img src="${ctx}/images/backStage/backNav(1).png" alt="">新建楼层</button>
        <button onclick="adUpload();" id="uploadBlc">
            <img src="${ctx}/images/backStage/backNav(7).png" alt="">上传信息</button>
        <button  onclick="isDeleted();" id="deleteBlc">
           <img src="${ctx}/images/backStage/backNav(3).png" alt="">删除信息</button>
    </div>
	<div id="lcRightMain">
        <p class="bt1"><span class="f6014">*</span>选择楼层：
       		<select name="lcXz" id="lcXz" style="height: 25px;width: 150px;"></select>
        </p>
        <p class="bt1" style="padding-left: 6px;margin: 10px 0;">楼层标题：
       		<input  type="text" id="lcbt">
        </p>
        <div class="bjBox" >
        	<img id="lcimg" onload="imgResize(310,150,this);" />
        	<button id="lcAddImg1" class="lcAddImg1 " onclick="adAddImg('lcimg');"><font color="red">*</font>添加图片</button><br/>
        </div>
        <label style="margin-left: 6px; font-weight: normal;">
        	<span>楼层描述：</span>
            <input id="lcMs" type="text" />
        </label>
        <button id="lcSave" onclick="saveLcInfo();" style="display: none;">保存</button>
        <button id="lcChange" onclick="saveLcChange();">修改</button>
        <button id="lcCancel" onclick="qxAdLcinfo();">取消</button>
	</div>
</div>
<!-- ***********************************************************end 楼层结束 公告开始*********************************************************************************** -->
<div id="notRight" style="display: none;">
	<div class="bt" >
        <button  onclick="addNoticeOnclick();">
            <img src="${ctx}/images/backStage/backNav(1).png" alt="">新建公告</button>
        <button onclick="adUpload();" id="uploadNotice">
            <img src="${ctx}/images/backStage/backNav(7).png" alt="">上传公告</button>
        <button  onclick="isDeleted();" id="deleteNotice">
           <img src="${ctx}/images/backStage/backNav(3).png" alt="">删除公告</button>
    </div>
	<div id="notRightMain">
        <p class="bt1"><span class="f6014">*</span>公告类型：
       		<select name="notType" id="notType" style="height: 25px;width: 150px;padding-left: 10px;">
       			<option value="1">公告</option>
       			<option value="2">特惠</option>
       			<option value="3">关于我们</option>
       			<option value="4">联系我们</option>
       			<option value="5">公司服务</option>
       			<option value="6">入驻商家</option>
       			<option value="7">新闻</option>
       		</select>
       		<span class="f6014" style="margin-left:20px;">*</span>展示位置：
       		<select name="notLocation" id="notLocation" style="height: 25px;width: 150px;padding-left: 10px;">
       			<option value="0">全网</option>
       			<option value="1">商城首页</option>
       			<option value="2">网吧首页</option>
       			<option value="3">全民K歌</option>
       		</select>
        </p>
        <p class="bt1"><span class="f6014">*</span>公告标题：
       		<input  type="text" id="notTitle" maxlength="100">
        </p>
        <div id="ggbj4">
	        <ul id="ggbjUl4">
				<li style="background-color: #DDDDDD;cursor: pointer;" id="liIndex4" onclick="showGGMS4(this.id,0)">*公告内容</li>
				<li style="cursor: pointer; background-color: rgb(255, 255, 255);" id="liIndex5" onclick="showGGMS4(this.id,1)">描述源码</li>
			</ul>
			<div id="ggmsBox4" class="ggbj4">
				<textarea id="ggeditor4" name="ggeditor4" rows="20" cols="100" style="width:100%;height:296px;visibility:hidden;"></textarea>
				<textarea rows="" cols="" name="ggms4" id="ggms4" style="display:none;"></textarea>
			</div>
			<div id="ggymBox4" class="ggbj4">
				<textarea disabled="disabled" id="ggym4" name="ggym4" style="width: 100%;height: 296px;"></textarea>
			</div>
	   </div>
        <button id="notSave" onclick="saveNotInfo();" style="display: none;">保存</button>
        <button id="notChange" onclick="saveNotChange();">修改</button>
        <button id="notCancel" onclick="qxNotinfo();">取消</button>
	</div>
</div>
<!-- ***********************************************************end公告*********************************************************************************** -->
       <div id="addAd" style="background-color: #ffffff">
			<div class="adzero" id="adZero">
				<div class="imgUrlDiv" >
<!-- 					<ul class="imgUrlDivUl"> -->
<!-- 				       	<li style="background-color: #DDDDDD; border-top-left-radius:5px;">URL地址:</li> -->
<!-- 				   	</ul> -->
<!-- 				   	<p><span>adURL:</span><input type="text" id="input_imgUrl" class="input_imgUrl" /></p> -->
				   	<label class="imgUrlLable" style="text-align: center;">
						<button type="button" onclick="getImgUrl();">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="adzeroButton();">取消</button>
				   	</label>
				</div>
			</div>       		
       		<p id="addcp_yc_biaoti"><img src="${ctx}/images/backStage/backNav(1).png" alt="">新建文章
       			<img onclick="adColse();" style="cursor:pointer;margin-left: 850px;" src="${ctx}/images/backStage/backNav(3).png" alt="">		
       		</p>
<!-- **************************************************** 广告新增 ***************************************************************** -->       		
       	<div id="adRightMain">
       			<label style="margin-top: 5px;margin-bottom: 20px;">
               	   <span class="f6014">*</span><span>广告类型:</span>
                   <select name="gglx" id="gglx" style="height: 25px;"></select>
                </label>
<!--                 <label style="margin-top: 5px;margin-bottom: 20px;" id="ggPageDiv"> -->
<!-- 		      		<span class="f6014">*</span><span>页面位置:</span> -->
<!-- 		        	<select name="ggPage" id="ggPage" style="height: 25px;width: 153px;"></select> -->
<!-- 			    </label>  -->
<!-- 				<label id="indexmzLabel" style="display:block;margin-top: -46px;margin-bottom: 20px;margin-left: 300px;"> -->
<!-- 			      	 <span class="f6014">*</span><span>广告位置:</span> -->
<!-- 			         <select name="ggwz" id="ggwz" style="height: 25px;width: 153px;"></select> -->
<!-- 			    </label>  -->
<!-- 			    <label id="qtmzLabel" style="display:none; margin-top: -46px;margin-bottom: 20px;margin-left: 300px;"> -->
<!-- 			      	 <span class="f6014">*</span><span>广告位置:</span> -->
<!-- 			         <select name="ggqtwz" id="ggqtwz" style="height: 25px;width: 153px;"></select> -->
<!-- 			    </label> -->
				<!-- *****************首页广告***************** -->
				<div id="adIndexDiv"></div>
				<!-- *****************美妆广告***************** -->
			    <div id="mzscDiv"></div>
				<!-- *****************服装广告***************** -->	 
 			    <div id="fzscDiv"></div>
 			    <div id="commonDiv"></div>
 			    <div id="appCommonDiv"></div>
 			    <div id="ggbj">
			        <ul id="ggbjUl">
						<li style="background-color: #DDDDDD;cursor: pointer;" id="liIndex2" onclick="showGGMS(this.id,0)">广告描述</li>
						<li style="cursor: pointer; background-color: rgb(255, 255, 255);" id="liIndex3" onclick="showGGMS(this.id,1)">描述源码</li>
					</ul>
					<div id="ggmsBox" class="ggbj">
						<textarea id="ggeditor" name="ggeditor" rows="20" cols="100" style="width:100%;height:510px;visibility:hidden;"></textarea>
						<textarea rows="" cols="" name="ggms" id="ggms" style="display:none;"></textarea>
					</div>
					<div id="ggymBox" class="ggbj">
						<textarea disabled="disabled" id="ggym" name="ggym" style="width: 100%;height: 480px;"></textarea>
					</div>
			   </div>
			   <button id="adSave" onclick="saveAdd();">保存</button>
			   <button id="adColse" onclick="adColse();">关闭</button>
     </div>
<!-- **************************************************** 广告修改 ***************************************************************** -->
   </div>
     <div id="adRight" style="border: 1px solid #eee;">
         <div class="bt" >
            <button  onclick="addOnclick();">
                <img src="${ctx}/images/backStage/backNav(1).png" alt="">创建文章</button>
            <button onclick="adUpload();" id="uploadB">
                <img src="${ctx}/images/backStage/backNav(7).png" alt="">上传文章</button>
            <button  onclick="isDeleted();" id="deleteB">
                <img src="${ctx}/images/backStage/backNav(3).png" alt="">删除文章</button>
        </div>
        <div id="adRightMain1">
	        <div class="adzero" id="adZeroXg">
				<div class="imgUrlDiv" >
<!-- 					<ul class="imgUrlDivUl"> -->
<!-- 				       	<li style="background-color: #DDDDDD; border-top-left-radius:5px;">URL地址:</li> -->
<!-- 				   	</ul> -->
<!-- 				   	<p><span>adURL:</span><input type="text" id="input_imgUrl1" class="input_imgUrl" /></p> -->
				   	<label class="imgUrlLable" style="text-align: center;">
						<button type="button" onclick="getImgUrl();">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="adzeroButton();">取消</button>
				   	</label>
				</div>
			</div> 
        	<label style="margin-top: 5px;margin-bottom: 20px;">
               	<span class="f6014">*</span><span>文章类型:</span>
                <select name="gglx1" id="gglx1" style="height: 25px;"  disabled="disabled"></select>
            </label>
<!--             <label style="margin-top: 5px;margin-bottom: 20px;" id="ggPageDiv1"> -->
<!-- 		      	<span class="f6014">*</span><span>页面位置:</span> -->
<!-- 		        <select name="ggPage1" id="ggPage1" style="height: 25px;width: 153px;" disabled="disabled"></select> -->
<!-- 		    </label>  -->
<!-- 			<label id="indexmzLabel1" style="display:block;margin-top: -46px;margin-bottom: 20px;margin-left: 300px;"> -->
<!-- 		      	 <span class="f6014">*</span><span>广告位置:</span> -->
<!-- 		         <select name="ggwz1" id="ggwz1" style="height: 25px;width: 153px;" disabled="disabled"></select> -->
<!-- 		    </label>  -->
<!-- 		    <label id="qtmzLabel1"  style="display:none; margin-top: -46px;margin-bottom: 20px;margin-left: 300px;"> -->
<!-- 		      	 <span class="f6014">*</span><span>广告位置:</span> -->
<!-- 		         <select name="ggqtwz1" id="ggqtwz1" style="height: 25px;width: 153px;" disabled="disabled"></select> -->
<!-- 		    </label> -->
			<!-- ***************首页广告************************** -->
		    <div id="adIndexDivXg"></div>
			<!-- ***************美妆广告********************** -->
		    <div id="mzscDivXg"></div>
			<!-- ***************服装广告************************ -->	 
 			<div id="fzscDivXg"></div>
 			<div id="commonDivXg"></div>
 			<div id="appCommonDivXg"></div>
 			<div id="ggbjTuP">
	           <ul id="ggbjUl1">
				    <li style="background-color: #DDDDDD;cursor: pointer;" id="liIndx0" onclick="showGGMS1(this.id,0)">文章图片</li>
				    <li style="cursor: pointer;  background-color: rgb(255, 255, 255);" id="liIndx1" onclick="showGGMS1(this.id,1)">描述源码</li>
			   </ul>
			   <div id="ggmsBox1" class="ggbj1">
					<textarea id="ggeditor1" name="ggeditor1" rows="20" cols="100" style="width:100%;height:480px;visibility:hidden;"></textarea>
					<textarea rows="" cols="" name="ggms1" id="ggms1" style="display:none;"></textarea>
			   </div>
			   <div id="ggymBox1" class="ggbj1">
					<textarea disabled="disabled" id="ggym1" name="ggym1" style="width: 100%;height: 100%;"></textarea>
			   </div>
	        </div>
 			<button id="adChange" onclick="saveChange();">修改</button>
            <button id="adCancel" onclick="qxAdinfo();">取消</button>
        </div>
</div>
</div>
<div id="xtts" style="display:none;">
	<div class="panel window messager-window" style="display: block; width: 300px; left: 500px; top: 198px; z-index: 9018; position: absolute;">
		<div class="panel-header panel-header-noborder window-header" style="width: 288px;">
			<div class="panel-title">系统提示</div>
			<div class="panel-tool" id="qxcz"><a class="panel-tool-close"></a></div>
		</div>
		<div class="messager-body panel-body panel-body-noborder window-body" title="" style="width: 288px;">
			<div id="xtInfo" class="messager-icon messager-info"  style="display:none;"></div>
			<div id="xtEr"  class="messager-icon messager-error"  style="display:none;"></div>
			<div id="xttilr"></div>
			<div style="clear:both;"></div>
			<div style="display:block;" class="messager-button" id="xttsB"><a style="margin-left:10px" class="l-btn l-btn-small" group="" id="">
				<span class="l-btn-left"><span class="l-btn-text">确定</span></span></a>
			</div>
			<div style="display:none;" class="messager-button" id="xttDel"><a style="margin-left:10px" class="l-btn l-btn-small" group="" id="">
				<span class="l-btn-left"><span class="l-btn-text">确定</span></span></a>
			</div>
			<div style="display:none;" class="messager-button" id="xttAdfg"><a style="margin-left:10px" class="l-btn l-btn-small" group="" id="">
				<span class="l-btn-left"><span class="l-btn-text">确定</span></span></a>
			</div>
		</div>
	</div>
</div>
<div id="xtts1" style="display:none;">
	<div class="panel window messager-window" style="display: block; width: 300px; left: 500px; top: 198px; z-index: 9018; position: absolute;">
		<div class="panel-header panel-header-noborder window-header" style="width: 288px;">
			<div class="panel-title">系统提示</div>
		</div>
		<div class="messager-body panel-body panel-body-noborder window-body" title="" style="width: 288px;">
			<div id="xtInfo1" class="messager-icon messager-info"  style="display:none;"></div>
			<div id="xtEr1"  class="messager-icon messager-error"  style="display:none;"></div>
			<div id="xttilr1"></div>
			<div style="clear:both;"></div>
			<div id="xttsB1" class="messager-button"><a  style="margin-left:10px" class="l-btn l-btn-small" group="" id="">
				<span class="l-btn-left"><span class="l-btn-text">确定</span></span></a>
			</div>
		</div>
	</div>
</div>
<div id="tscg" style="display:none;">
	<div class="panel window" style="position: fixed;right: 25%; z-index: 9004;  top:85%;  display: block; width: 250px; height:100px; overflow: hidden;">
		<div class="panel-header panel-header-noborder window-header" style="width: 238px;">
			<div class="panel-title">温馨提示</div>
		</div>
		<div id="tslr" class="messager-body panel-body panel-body-noborder window-body" title="" style="width: 238px; height: 65px;"></div>
	</div>
</div>
<input name="lcImgUrl" type="hidden"   id="lcImgUrl" />
<input name="adIdIpt" type="hidden"    id="adIdIpt" />
<input name="adIsUpload" type="hidden"  id="adIsUpload" />
<input name="lcDesc" type="hidden"  id="lcDesc"  value="Floor"/>
<input type="hidden" name="img_url" id="img_url" />
<input type="hidden" name="adTypeHidden" id="adTypeHidden"/>
</body>
<script type="text/javascript">
/*取消按钮*/
function qxAdinfo(){
	var adId = $("#adIdIpt").val();
	var adType = $("#adTypeHidden").val();
	if(adId!=""){
		showAdInfo(adId,adType);
	}
	pageScroll();
}
/*保存按钮*/
function saveAdd(){
	loadMBContr(1);
// 	var adType = $("#gglx").children('option:selected').val();
	saveIndexAdd();
	pageScroll();
}
/*修改按钮*/
function saveChange(){
	loadMBContr(1);
	var adId = $("#adIdIpt").val();
	if(adId!=""){
		var adType = $("#gglx1").children('option:selected').val();
		saveIndexChange();
		pageScroll();
	}else{
		loadMBContr(0);
		change_div("nullXg","");
	}
	loadMBContr(0);
}
/*显示广告类*/
function adShowType(){
	$("#loadMB").show();
	$.ajax({
		type:"post",
		dataType:"json",
		async:false,
		url:"${ctx}/system/dictionary/getDictionaryInfo.do",
		success:function(data){
			if(data.result){
				var str="";
				var englishStr = "";
				$.each(data.treeDic,function(j,jtem){
					var strli="";
					 var strl ="";
					 if(jtem.dicKey=='1'){
						 str+="<input type='hidden' id='falgIpt"+j+"' name='falgIpt"+j+"' value='1' />";
					     str+="<p class='bt' onclick='adShowTitle("+'"'+jtem.id+'"'+","+j+",this);'><span></span>"+jtem.dicName;
					     if(jtem.childList!=null){
						     $.each(jtem.childList,function(k,jtem1){
						    	 if(jtem1.childList!=null){
							    	 var strl2="";
						    		 $.each(jtem1.childList,function(m,jtem2){
						    		 	strl2 += "<li class='thridTreeLi' onclick='adShowTitle("+'"'+jtem2.id+'"'+","+m+",this);'><div class='thridDiv'>"+jtem2.dicName+"</div><ul class='thridTree'></ul></li>";
						    		 })
						    	 }
							     strli+="<li class='twoTreeLi' onclick='adShowTitle("+'"'+jtem1.id+'"'+","+k+",this);'>"+jtem1.dicName+"<ul class='twoTree'>"+strl2+"</ul></li>";
						     })
					     }
					     str+="</p><ul id='adUl"+j+"'>"+strli+"</ul>"; 
					 }else if(jtem.dicKey=='2'){
						 englishStr+="<input type='hidden' id='falgIpt"+j+"' name='falgIpt"+j+"' value='1' />";
						 englishStr+="<p class='bt' onclick='adShowTitle("+'"'+jtem.id+'"'+","+j+",this);'><span></span>"+jtem.dicName;
					     if(jtem.childList!=null){
						     $.each(jtem.childList,function(k,jtem1){
						    	 if(jtem1.childList!=null){
							    	 var englishStr2="";
						    		 $.each(jtem1.childList,function(m,jtem2){
						    			 englishStr2 += "<li class='thridTreeLi' onclick='adShowTitle("+'"'+jtem2.id+'"'+","+m+",this);'><div class='thridDiv'>"+jtem2.dicName+"</div><ul class='thridTree'></ul></li>";
						    		 })
						    	 }
							     strli+="<li class='twoTreeLi' onclick='adShowTitle("+'"'+jtem1.id+'"'+","+k+",this);'>"+jtem1.dicName+"<ul class='twoTree'>"+englishStr2+"</ul></li>";
						     })
					     }
					     englishStr+="</p><ul id='adUl"+j+"'>"+strli+"</ul>";
					 }
					 
				});
				$("#adlf").empty();
	 			$("#adlf").append(str);
	 			$("#englishAd").empty();
	 			$("#englishAd").append(englishStr);
			}
		},
		error:function(data){
			$("#loadMB").hide();
		}
  });
}
function adShowTitle(type,Index,obj){
	loadMBContr(1);
	 if($(obj).find("ul").height()>0){
		 loadMBContr(0);
		 return;
	 }
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/advertise/getAdvertiseType.do",
		data:{"adType":type},
		success:function(data){
			var strli = "";
			if(data.success){
				 $.each(data.adInfo,function(i,item){
					 strli+='<li id='+item.adId+' onclick="showAdInfo('+"'"+item.adId+"'"+','+type+');" style="color:#d9b962;" title="'+item.adTitle+'">'+item.adTitle+'</li>';
					 if($(obj).find("ul").attr("class")){
						 $(obj).find("ul").empty();
						 $(obj).find("ul").append(strli);
					 }else{
						 if( $(obj).next("ul").eq(0).height()==0){
							 $(obj).next("ul").eq(0).append(strli);
						 }
					 }
				});
			} 
		}	
	  }); 
	loadMBContr(0);
}
function showChildLi(obj,Index){
  	var intflag = parseInt($("#falgIpt"+Index).val());
	if(intflag){
		document.getElementById("falgIpt"+Index).value="0";
	} 
// 	if ($(obj).next().find("li").height() == 0) {
// 		$(obj).next().find("li").stop().animate({
// 	          height: "30px"
// 	    });
// 	} else {
// 	 	$(obj).next().find("li").stop().animate({
// 	        height: "0"
// 	    });
// 	}
}
var flag = true;
var flag1 = true;
/*控制广告类显示*/
function showDivInfo(){
	isFalg = true;
	document.getElementById("lcRight").style.display="none";
	document.getElementById("notRight").style.display="none";
	if(flag){
		adShowType();
		flag = false; 
	}
	if(flag1){
		document.getElementById("adRight").style.display="block";
		document.getElementById('adtbimg').src="${ctx}/images/backStage/r4.png";
		document.getElementById("adlf").style.display="block";
		flag1 = false;
		flagLc1= true;
		flagNot = true; 
	}else{
		document.getElementById('adtbimg').src="${ctx}/images/backStage/r3.png";
		document.getElementById("adlf").style.display="none";
		document.getElementById("adRight").style.display="none";
		flag1 = true;
	}
	$("#"+showDivId).empty();
	document.getElementById("adIdIpt").value="";
	document.getElementById("adIsUpload").value="";
	$("#loadMB").hide();
}

function showEnglish(){
	var a  = document.getElementById("englishAd").style.display;
	if(a == 'block'){
		document.getElementById('adtbimg1').src="${ctx}/images/backStage/r3.png";
		document.getElementById("englishAd").style.display="none";
	}else{
		document.getElementById('adtbimg1').src="${ctx}/images/backStage/r4.png";
		document.getElementById("englishAd").style.display="block";
	}
}
/*广告类的下的广告*/
function showAdTitleList(obj,type,Index){
  	var intflag = parseInt($("#falgIpt"+Index).val());
	if(intflag){
		adShowTitle(type,Index);
		document.getElementById("falgIpt"+Index).value="0";
	} 
	if ($(obj).next().find("li").height() == 0) {
		$(obj).next().find("li").stop().animate({
	          height: "30px"
	    });
	} else {
	 	$(obj).next().find("li").stop().animate({
	        height: "0"
	    });
	}
}
/*广告显示*/
var showDivId="";
var showInfoLiId="";
function showAdInfo(adId,adType){
	loadMBContr(1);
	pageScroll();
	document.getElementById("adIdIpt").value=adId;
	if(showInfoLiId!=""){
		$("#"+showInfoLiId).removeClass('active');
		$("#"+adId).addClass('active');
	}else{
		$("#"+adId).addClass('active');
	}
	showInfoLiId=adId;
	$("#ggym1").empty();
	ggeditor1.html("");
	$("#"+showDivId).empty();
	$("#adIndexDiv").empty();
	$("#adIndexDivXg").load("${ctx}/builder/indexAd.jsp?type=0");
	showDivId = "adIndexDivXg";
    getAdPageInfo(adType);
}
/*删除广告*/
function isDeleted(){
	var adIdD = $("#adIdIpt").val();
	if(adIdD==""){
		change_div("nullXg","");
	}else{
		change_div("nullDel","");
	}
}
function deleteAd(){
	if($("#adIdIpt").val()!=""){
		$.ajax({
			type:"post",
			dataType:"json",
			data:{"adId":$("#adIdIpt").val()},
			url:"${ctx}/system/advertise/getDeleteAdvertise.do",
			success:function(data){
				if(data.success){
					change_div("successDel","删除成功");
					adShowType();
					LcShowName();
					$("#"+showDivId).empty();
					document.getElementById("adIdIpt").value="";
					document.getElementById("adIsUpload").value="";
					lcQkInfo();
				}else{
					change_div("successDel","删除失败");
				}
					loadMBContr(0);
			}
		});
	}
	loadMBContr(0);
}
/*上传广告*/
function adUpload(){
 	var adId = $("#adIdIpt").val();
	var adIsUpload = $("#adIsUpload").val();
	if(adId!=""){
		if(adIsUpload=="0"){
			$.ajax({
            	type:"post",
 				dataType:"json",
 				data:{"adId":adId},
 				url:"${ctx}/system/advertise/uploadAddvertise.do",
 				success : function(data) {
					if(data.success){
						change_div("successSc","上传成功");
						showAdInfo($("#adIdIpt").val(),data.adType);
						document.getElementById("uploadB").disabled=true;
					}else{
						change_div("scFalse","上传失败");
					}
 				}
             });
		}else{
			change_div("adUpInfo","");
		}
	}else{
		change_div("nullXg","");
	} 
	loadMBContr(0);
}
/*图片高宽控制*/
function imgResize(maxWidth, maxHeight, imgObj) {
    var img = new Image();
    img.src = imgObj.src;
    var imgSrc=img.src;

    if (img.width > 0 && img.height > 0) {
        if (img.width / img.height >= maxWidth / maxHeight) {
            if (img.width > maxWidth) {
                imgObj.width = maxWidth;
                imgObj.height = (img.height * maxWidth) / img.width;
            } else {
                imgObj.width = img.width;
                imgObj.height = img.height;
            }
        } else {
            if (img.height > maxHeight) {
                imgObj.height = maxHeight;
                imgObj.width = (img.width * maxHeight) / img.height;
            } else {
                imgObj.width = img.width;
                imgObj.height = img.height;
            }
        }
    }
    else {
        imgObj.width = maxWidth;
        imgObj.height = maxHeight;
    }
}
/*********新建楼层*****************************************************/
/*显示楼层目录*/
function LcShowName(){
  	 $.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/advertise/getLcInfo.do",
		success:function(data){
			if(data.result){
				var str="";
				$.each(data.lcInfo,function(i,item){
					 str +='<p  id='+item.adId+' class="bt" onclick="showLcMl('+"'"+item.adId+"'"+');"><span></span>'+item.adTitle+'</p>';
				}); 
				$("#Lcdiv").empty();
				$("#Lcdiv").append(str);
			}
			ggeditor1.html("");
	}	 
  }); 
}
/*显示楼层选择信息*/
function getLcXzInfo(){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/dictionary/getFloorNum.do",
		data:{"key":"F"},
		success:function(data){
			if(data.success){
				var strPage = "";
				$.each(data.FloorNum,function(i,item){
					if(i==0){
						strPage +="<option value="+item.dicIndex+" selected='selected'>"+item.dicName+"</option>";
					}else{
						strPage +="<option value="+item.dicIndex+">"+item.dicName+"</option>";
					}
				});
				$("#lcXz").empty();
				$("#lcXz").append(strPage);
			}
		}
	});
}
var flagLc = true;
var flagLc1 = true;
function showLcInfo(){
	 isFalg = true;
	 document.getElementById("adRight").style.display="none";
	 document.getElementById("notRight").style.display="none";
	 document.getElementById("adlf").style.display="none";
	 document.getElementById("notdiv").style.display="none";
	 document.getElementById('adtbimg').src="${ctx}/images/backStage/r3.png";
	 document.getElementById('noticeimg').src="${ctx}/images/backStage/r3.png";
	 if(flagLc){
		 getLcXzInfo();
		 LcShowName();
		 flagLc = false;
	}
	if(flagLc1){
		document.getElementById("lcRight").style.display="block";
		document.getElementById("Lcdiv").style.display="block";
		document.getElementById('lctbimg').src="${ctx}/images/backStage/r4.png";
		flag1 = true;
		flagLc1= false;
		flagNot = true; 
	}else{
		document.getElementById("lcRight").style.display="none";
// 		document.getElementById("Lcdiv").style.display="none";
// 		document.getElementById('lctbimg').src="${ctx}/images/backStage/r3.png";
		flagLc1 = true;
	}
	lcQkInfo();
}
function lcQkInfo(){
	document.getElementById("lcMs").value="";
	document.getElementById("lcbt").value="";
	document.getElementById("lcImgUrl").value="";
	document.getElementById("adIdIpt").value="";
	document.getElementById("lcimg").src="/yuguoAdmin/images/backStage/imgbj.png";
	document.getElementById("adIsUpload").value="";
}
function addLcOnclick(){
	lcQkInfo();
	document.getElementById("lcSave").style.display="";
	document.getElementById("lcChange").style.display="none";
}
function qxAdLcinfo(){
	var adId = $("#adIdIpt").val();
	document.getElementById("lcChange").style.display="";
	document.getElementById("lcSave").style.display="none";
	document.getElementById("lcimg").src="/yuguoAdmin/images/backStage/imgbj.png";
	if(adId!=""){
		showLcInfo(adId);
	}
	lcQkInfo();
	pageScroll();
} 
function showLcMl(adId){
	loadMBContr(1);
	if(showInfoLiId!=""){
		$("#"+showInfoLiId).removeClass('active');
		$("#"+adId).addClass('active');
	}else{
		$("#"+adId).addClass('active');
	}
	showInfoLiId=adId;
	pageScroll();
	if(adId!=null){
		if(adId!='del'){
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"adId":adId},
				url:"${ctx}/system/advertise/getAdvertiseInfo.do",
				success:function(data){
// 					setSelectChecked("lcXz",data.adAllInfo.adLocation);
					document.getElementById("lcbt").value=data.adAllInfo.adDetailDesc;
					document.getElementById("lcMs").value=data.adAllInfo.remark;
					document.getElementById('lcimg').src="";
					document.getElementById('lcimg').src='${ctx}/'+data.adAllInfo.imageUrl;
					document.getElementById('lcimg').value=data.adAllInfo.imageUrl;
					document.getElementById("adIdIpt").value=adId;
					document.getElementById("adIsUpload").value=data.adAllInfo.remark1;
					if(data.adAllInfo.remark1==null || data.adAllInfo.remark1=="0" ){
						document.getElementById("uploadBlc").disabled=false;
					}else if(data.adAllInfo.remark1=="1"){
						document.getElementById("uploadBlc").disabled=true;
					}
				}
				
			});
		}else{
			qxAdLcinfo();
		}
	}else{
		qxAdLcinfo();
	}
	loadMBContr(0);
} 

/*保存修改数据*/
function changeLcData(){
	loadMBContr(1);
	$.ajax({
		type:"post",
		dataType:"json",
		data:{
			"adId":$("#adIdIpt").val(),
			"lcMh":$('#lcXz').children('option:selected').text(),
			"lcBt":$("#lcbt").val(),
			"lcMs":$("#lcMs").val(),
			"lcImg":$("#lcimg").val(),
			"adPosition":$("#lcXz").children('option:selected').val()
		},
		url:"${ctx}/system/advertise/floorChange.do",
		success:function(data){
			change_div("success","修改成功");
	}	 
  });
	loadMBContr(0);
} 
function  saveLcChange(){
	loadMBContr(1);
	if($("#adIdIpt").val()!=""){
		if(lcIsNull()){
			$.ajax({
				type:"post",
				dataType:"json",
				url:"${ctx}/system/advertise/ckChangeFloorBt.do",
				data:{"lcbt":$("#lcbt").val(),
					  "adId":$("#adIdIpt").val()
					},
				success:function(data){
					if(data.isTitle){
						LcShowName();
						changeLcData();
						document.getElementById("adIsUpload").value="0";
						document.getElementById("uploadBlc").disabled=false;
					}else{
						showLcMl($("#adIdIpt").val());
						change_div("error","");
					}
			}	 
		  });
		}else{
			change_div("info","");
		}
	}else{
		change_div("nullXg","");
	}
	pageScroll();
	loadMBContr(0);
} 
/*保存楼层 数据*/
function saveLcData(){
	loadMBContr(1);
	$.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/advertise/addFloor.do",
		data:{
			"lcMh":$('#lcXz').children('option:selected').text(),
			"lcBt":$("#lcbt").val(),
			"lcMs":$("#lcMs").val(),
			"lcImg":$("#lcimg").val(),
			"lcDesc":$("#lcDesc").val(),
			"adPosition":$("#lcXz").children('option:selected').val()
		},
		success:function(data){
			LcShowName();
	}	 
  });
	loadMBContr(0);
}
function saveLcInfo(){
	loadMBContr(1);
	if(lcIsNull()){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${ctx}/system/advertise/checkAddFloor.do",
			data:{"lcbt":$("#lcbt").val(),
					"lcMh":$('#lcXz').children('option:selected').text(),
					"adPosition":$("#lcXz").children('option:selected').val()
			},
			success:function(data){
				if(data.success){
					loadMBContr(0);
					change_div("error","楼层公位置已经存在不能新增,请返回修改");
				}else{
					saveLcData();
					qxAdLcinfo();
					loadMBContr(0);
					change_div("successBc","保存成功");
					document.getElementById("lcChange").style.display="";
					document.getElementById("lcSave").style.display="none";
				}
		}	 
	  });
	}else{
		loadMBContr(0);
		change_div("info","");
	}
	loadMBContr(0);
  pageScroll();
}

function lcIsNull(){
	var lcBt = $("#lcbt").val();
	var lcImg =$("#lcimg").val();
	if(lcImg=="" || lcBt==""){
		return false;
	}else{
		return true;
	}
} 
/***end***********************************************************/
/*创建广告div控制*/
function addOnclick(){
	$("#addAd").css({height:"900px"});
	$("#mb").css({display:"block"});
// 	document.getElementById("ggPage1").value="";
// 	document.getElementById("ggym1").value="";
// 	ggeditor1.html("");
	$("#indexmzLabel").css("display","block");
	$("#qtmzLabel").css("display","none");
	getAdPageInfo(1);
	$("#mzscDiv").empty();
	$("#fzscDiv").empty();
	$("#appCommonDiv").empty();
	$("#commonDiv").empty();
	$("#adIndexDiv").load('${ctx}/builder/indexAd.jsp?type=1');
}
function adColse() {
	 $("#mb").css({display:"none"});
	 $("#addAd").css({height:0});
	 divId="adIndexDiv";
	 setSelectChecked("gglx",1);
	 setSelectChecked("gglx1",1);
	 $("#ggeditor").val("");
	 $("#ggms").val("");
	 ggeditor.html("");
	 $("#ggPage").empty();
	 $("#ggPage1").empty();
	 $("#ggwz").empty();
	 $("#ggqtwz").empty();
	 $("#ggwz1").empty();
	 $("#ggqtwz1").empty();
	 document.getElementById("adIdIpt").value="";
	 document.getElementById("adIsUpload").value="";
}
/*div 隐藏与显示 提示信息*/
function change_div(type,showInfo){
	if(type=="success"){
		$("#tscg").css({
	        display:"block"
	    });
		document.getElementById("tslr").innerHTML=showInfo;
		setTimeout("yc_div()",2000);//2秒后隐藏
	}else if(type=="successDel"){
		$("#tscg").css({
	        display:"block"
	    });
		document.getElementById("tslr").innerHTML=showInfo;
		setTimeout("yc_div()",2000);//2秒后隐藏
	}else if(type=="successSc"){
		$("#tscg").css({
	        display:"block"
	    });
		document.getElementById("tslr").innerHTML=showInfo;
		setTimeout("yc_div()",2000);//2秒后隐藏
	}else if(type=="scFalse"){
		$("#tscg").css({display:"block"});
		document.getElementById("tslr").innerHTML=showInfo;
		setTimeout("yc_div()",2000);//2秒后隐藏
	}else if(type=="successBc"){
		$("#tscg").css({display:"block"});
		document.getElementById("tslr").innerHTML=showInfo;
		setTimeout("yc_div()",2000);//2秒后隐藏
	}else{
		if(type=="info"){
			$("#xtts").css({display:"block"});
			$("#xtInfo").css({display:"block"});
			$("#xtEr").css({display:"none"});
			document.getElementById("xttilr").innerHTML="请输入完整数据,*代表必须输入";
		}
		if(type=="infoBc"){
			$("#xtts1").css({display:"block"});
			$("#xtInfo1").css({display:"block"});
			$("#xtEr1").css({display:"none"});
			document.getElementById("xttilr1").innerHTML="请输入完整数据,*代表必须输入";
		}
		if(type=="error"){
			$("#xtts").css({display:"block"});
			$("#xtEr").css({ display:"block"});
			$("#xtInfo").css({display:"none"});
			if(showInfo!="" && showInfo!=null){
				document.getElementById("xttilr").innerHTML="标题已经存在，请重新填写";
			}else{
				document.getElementById("xttilr").innerHTML=showInfo;
			}
		}
		if(type=="errorBc"){
			$("#xtts1").css({display:"block"});
			$("#xtInfo1").css({display:"none"});
			$("#xtEr1").css({display:"block"});
			document.getElementById("xttilr1").innerHTML="标题已经存在，请重新填写";
		}
		if(type=="adUpInfo"){
			$("#xtts").css({display:"block"});
			$("#xtInfo").css({display:"block"});
			$("#xtEr").css({display:"none"});
			document.getElementById("xttilr").innerHTML="已经上传！";
		}
		if(type=="nullXg"){
			$("#xtts").css({display:"block"});
			$("#xtInfo").css({display:"block"});
			$("#xtEr").css({display:"none"});
			document.getElementById("xttilr").innerHTML="请选择一项再做操作";
		}
		if(type=="nullDel"){
			$("#xtts").css({display:"block"});
			$("#xttsB").css({display:"none"});
			$("#xttDel").css({display:"block"});
			$("#xtInfo").css({display:"block"});
			$("#xttAdfg").css({display:"none"});
			document.getElementById("xttilr").innerHTML="确定要删除此项？？";
		}
		if(type=="adfg"){
			$("#xtts").css({display:"block"});
			$("#xttsB").css({display:"none"});
			$("#xttDel").css({display:"none"});
			$("#xtInfo").css({display:"block"});
			$("#xttAdfg").css({display:"block"});
			document.getElementById("xttilr").innerHTML=showInfo;
			$("#mb2").css({display:"block"});
		}
		$("#mb").css({display:"block"});
	}
}
/*隐藏div*/
function yc_div(){
	$("#tscg").css({display:"none"});
}
$("#xttsB").click(function() {
	$("#xtts").css({display:"none"});
	$("#mb").css({display:"none"});
});
$("#xttsB1").click(function() {
	$("#xtts1").css({display:"none"});
});
$("#qxcz").click(function() {
	$("#xtts").css({display:"none"});
	if($("#mb2").css("display")=="block"){
		$("#mb2").css({ display:"none"}); 
    }else{
    	$("#mb").css({ display:"none"}); 
    }
});
$("#xttDel").click(function() {
	$("#xtts").css({display:"none"});
	$("#mb").css({display:"none"});
	if(isFlag){
		deleteAd();
	}else{
		deleteNotice();
	}
});
/*广告描述li样式控制*/
var ggbj=$(".ggbj");
var ggbj1=$(".ggbj1"); 
var ggbj4=$(".ggbj4");
function showGGMS(liId,Index){
	$("#"+liId).css({
        backgroundColor:" #DDDDDD"
    }).siblings().css({
        backgroundColor:" #ffffff"
    });
	ggbj.css({
        display:"none"
    }).eq(Index).css({
        display:"block"
    })
}
function showGGMS1(liId,Index){
	$("#"+liId).css({
        backgroundColor:" #DDDDDD"
    }).siblings().css({
        backgroundColor:" #ffffff"
    });
	ggbj1.css({
        display:"none"
    }).eq(Index).css({
        display:"block"
    })
}
function showGGMS4(liId,Index){
	$("#"+liId).css({
        backgroundColor:" #DDDDDD"
    }).siblings().css({
        backgroundColor:" #ffffff"
    });
	ggbj4.css({
        display:"none"
    }).eq(Index).css({
        display:"block"
    })
}
/*返回顶部*/
function pageScroll() {
	window.scroll(0,document.getElementById("adRight").offsetTop);
}
//广告类型选择
var divId ="adIndexDiv";
$(document).ready(function(){ 
	$('#gglx').change(function(){ 
		$("#indexmzLabel").css("display","block");
		$("#qtmzLabel").css("display","none");
		var adType = $(this).children('option:selected').val();
		$("#"+divId).empty();
		divId = "adIndexDiv";
		$("#adIndexDiv").load('${ctx}/builder/indexAd.jsp?type=1');
// 		getAdPageInfo(adType);
	});
});
function getAdPageInfo(adType){
	 $("#"+showDivId).empty();
	 $("#ggPageDiv").css("display","block");
	 $("#ggPageDiv1").css("display","block");
	 $.ajax({
		type:"post",
		dataType:"json",
		url:"${ctx}/system/dictionary/getAdPageAndAdPosition.do",
		data:{"key":adType},
		success:function(data){
			if(data.success){
				var strPage = "";
				$.each(data.adPageList,function(i,item){
					if(i==0){
						strPage +="<option value="+item.dicIndex+" selected='selected'>"+item.dicName+"</option>";
					}else{
						strPage +="<option value="+item.dicIndex+">"+item.dicName+"</option>";
					}
				});
				$("#ggPage").empty();
				$("#ggPage").append(strPage);
				$("#ggPage1").empty();
				$("#ggPage1").append(strPage);
				var strPosition = "";
				var strPtPosition ="";
				$.each(data.adPositionList,function(i,item){
					if(i==0){
						strPosition +="<option value="+item.dicIndex+" selected='selected'>"+item.dicName+"</option>";
						strPtPosition +="<option value="+item.dicIndex+" selected='selected'>"+item.dicName+"</option>";
					}else{
						strPosition +="<option value="+item.dicIndex+">"+item.dicName+"</option>";
					}
					if((i==1) || (i==2) || (i==data.Count)){
						strPtPosition +="<option value="+item.dicIndex+">"+item.dicName+"</option>";
					}
				});
				$("#ggwz").empty();
				$("#ggqtwz").empty();
				$("#ggwz").append(strPosition);
				$("#ggqtwz").append(strPtPosition);
				$("#ggwz1").empty();
				$("#ggqtwz1").empty();
				$("#ggwz1").append(strPosition);
				$("#ggqtwz1").append(strPtPosition);
			}else{
				$("#ggPage").empty();
				$("#ggPage1").empty();
				$("#ggwz").empty();
				$("#ggqtwz").empty();
				$("#ggwz1").empty();
				$("#ggqtwz1").empty();
			}
		}
	});
}
function adzeroButton(){
	$("#adZero").css("display","none");
	 $("#adZeroXg").css("display","none");
}
//select options selected;
function setSelectChecked(selectId, checkValue){  
    var select = document.getElementById(selectId);  
    for(var i=0; i<select.options.length; i++){  
        if(select.options[i].value == checkValue){  
            select.options[i].selected = true;  
            break;  
        }  
    } 
} 
//页面位置选择
// $(document).ready(function(){ 
// 	$('#ggPage1').change(function(){ 
// 		loadMBContr(1);
// 		var adType = $(this).children('option:selected').val();
// 		if(adType!=1){
// 			$("#qtmzLabel1").css({display:"block"});
// 			$("#indexmzLabel1").css({display:"none"});
// 		}else{
// 			$("#indexmzLabel1").css({display:"block"});
// 			$("#qtmzLabel1").css({display:"none"});
// 		}
// 	});
// });
function creatTitleName(adPage,ymVlaue,wzVlaue,PageTypeName){
	var value;
	var strValue;
	if(adPage!=1){
		value = ymVlaue.substring(0, 2);
		strValue=value+PageTypeName+"-"+wzVlaue;
	}else{
		value = ymVlaue.substring(ymVlaue.length-2, ymVlaue.length);
		strValue=value+PageTypeName+"-"+wzVlaue;
	}
	return strValue; 
} 
//去掉字串中的所有空格
function Trim(str,is_global){
    var result;
    result = str.replace(/(^\s+)|(\s+$)/g,"");
    if(is_global.toLowerCase()=="g"){
        result = result.replace(/\s/g,"");
     }
    return result;
}
//禁指定区域右键菜单
/* $(document).on('contextmenu', function(){
  return false; //设置返回为false，设置为true则返回右键菜单，大家可以自己修改代码试试
}); 
window.onload = function (){
    var mesuDiv = document.getElementById('addAd');
    mesuDiv.oncontextmenu = function (){
    	return false;
    }
    var mzscDivXg = document.getElementById('mzscDivXg');
    mzscDivXg.oncontextmenu = function (){
    	return false;
    } 
} */
</script>
<!-- ******公告***** -->
<script type="text/javascript">
	var flagNot = true;
	var flagNot1 = true;
	function showNotice(){
		 loadMBContr(1);
		 isFlag = false;
		 showGGMS4("liIndex4",0);
		 document.getElementById("adRight").style.display="none";
		 document.getElementById("lcRight").style.display="none"
		 document.getElementById("adlf").style.display="none";
// 		 document.getElementById("Lcdiv").style.display="none";
// 		 document.getElementById('adtbimg').src="${ctx}/images/backStage/r3.png";
// 		 document.getElementById('lctbimg').src="${ctx}/images/backStage/r3.png";
		if(flagNot1){
			 noticeTitle();
		 }
		 if(flagNot){
			 document.getElementById("notRight").style.display="block";
			 document.getElementById('noticeimg').src="${ctx}/images/backStage/r4.png";
			 document.getElementById("notdiv").style.display="block";
			 flag1 = true;
			 flagLc1= true;
			 flagNot = false; 
			 flagNot1 = false;
		 }else{
			 document.getElementById("notRight").style.display="none";
			 document.getElementById('noticeimg').src="${ctx}/images/backStage/r3.png";
			 document.getElementById("notdiv").style.display="none";
			 flagNot = true; 
		 } 
		 qxNotinfo();
		 loadMBContr(0);
	}
	
	function noticeTitle(){
		loadMBContr(1);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${ctx}/system/notice/getNoticeData.do",
			success:function(data){
				if(data.success){
					var str="";
					$.each(data.snList,function(i,item){
						 str +='<p  id='+item.noticeId+' class="bt" onclick="showNoticeInfo('+"'"+item.noticeId+"'"+');"><span></span>'+item.noticeTitle+'</p>';
					}); 
					$("#notdiv").empty();
					$("#notdiv").append(str);
				}
		}	 
	  }); 
		loadMBContr(0);
	}
	
	function showNoticeInfo(noticeId){
		loadMBContr(1);
		if(showInfoLiId!=""){
			$("#"+showInfoLiId).removeClass('active');
			$("#"+noticeId).addClass('active');
		}else{
			$("#"+noticeId).addClass('active');
		}
		showInfoLiId=noticeId;
		pageScroll();
		$.ajax({
			type:"post",
			dataType:"json",
			data:{"noticeId":noticeId},
			url:"${ctx}/system/notice/getNoticeInfo.do",
			success:function(data){
				if(data.success){
					document.getElementById("adIdIpt").value=noticeId;
// 					setSelectChecked("notType",data.snList.noticeType);
// 					setSelectChecked("notLocation",data.snList.noticeLocation);
					document.getElementById("notTitle").value=data.snList.noticeTitle;
					document.getElementById("adIsUpload").value=data.snList.remark;
					$("#ggym4").empty();
					ggeditor4.html("");
					ggeditor4.html(data.sNoticeContent);
					document.getElementById("notSave").style.display="none";
					document.getElementById("notChange").style.display="inline-block";
				}
		}	 
	  }); 
	   loadMBContr(0);
	}
	
	/**点击新增公告**/
	function addNoticeOnclick(){
		loadMBContr(1);
		qxNotinfo();
		document.getElementById("notSave").style.display="inline-block";
		document.getElementById("notChange").style.display="none";
// 		setSelectChecked("notType",0);
		loadMBContr(0)
	}
	
	/**清空信息**/
	function qxNotinfo(){
		loadMBContr(1);
		ggeditor4.html("");
		document.getElementById("notTitle").value="";
		document.getElementById("adIdIpt").value="";
		document.getElementById("adIsUpload").value="";
		loadMBContr(0)
	}
	
	/**保存公告信息**/
	function saveNotInfo(){
		loadMBContr(1);
		var notType = $("#notType").children('option:selected').val();
		var notLocation = $("#notLocation").children('option:selected').val();
		var notTitle = Trim($("#notTitle").val(),"");
		var notContent = null;
		ggeditor4.sync();
		$("#ggms4").val($("#ggeditor4").val());
		notContent=$("#ggms4").val();
		if(notTitle!=""){
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"notTitle":notTitle},
				url:"${ctx}/system/notice/checkNoticeTitle.do",
				success:function(data){
					if(data.success){
						change_div("error","");
					}else{
						$.ajax({
							type:"post",
							dataType:"json",
							data:{"notTitle":notTitle,
								"notContent":notContent,
								"notType":notType,
								"notLocation":notLocation
							},
							url:"${ctx}/system/notice/addNoticeInfo.do",
							success:function(data){
								if(data.success){
									loadMBContr(0);
									noticeTitle();
									document.getElementById("adIdIpt").value=data.noticeId;
									document.getElementById("notChange").style.display="";
									document.getElementById("notSave").style.display="none";
									document.getElementById("adIsUpload").value="0";
									flagNot1 = true;
									change_div("successBc","保存成功");
								}else{
									loadMBContr(0);
									change_div("successBc","保存失败");
								}
							}
						});
				  }
				}
			});
		}else{
			loadMBContr(0);
			change_div("info","");
		}
	}
	
	/**修改公告信息**/
	function saveNotChange(){
		loadMBContr(1);
		pageScroll();
		if($("#adIdIpt").val()!=""){
			var notType = $("#notType").children('option:selected').val();
			var notLocation = $("#notLocation").children('option:selected').val();
			var notTitle = Trim($("#notTitle").val(),"");
			var notContent = null;
			ggeditor4.sync();
			$("#ggms4").val($("#ggeditor4").val());
			notContent=$("#ggms4").val();
			if(notTitle!=""){
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"notTitle":notTitle,
						"notContent":notContent,
						"notType":notType,
						"notId":$("#adIdIpt").val(),
						"notLocation":notLocation
					},
					url:"${ctx}/system/notice/updateNotice.do",
					success:function(data){
						if(data.success){
							loadMBContr(0);
							noticeTitle();
							document.getElementById("adIsUpload").value="0";
							change_div("success","修改成功");
						}else{
							change_div("success","修改失败");
						}
					}
				});
			}else{
				change_div("info","");
			}
		}else{
			change_div("nullXg","");
		}
		loadMBContr(0);
	}
	
	/**删除公告**/
	function deleteNotice(){
		var noticeId = $("#adIdIpt").val();
		$.ajax({
			type:"post",
			dataType:"json",
			data:{"notId":noticeId},
			url:"${ctx}/system/notice/deleteNotice.do",
			success:function(data){
				if(data.success){
					change_div("successDel","删除成功");
					qxNotinfo();
					noticeTitle();
				}else{
					change_div("successDel","删除失败");
				}
			}
		});
		loadMBContr(0);
	}
	
	//页面位置选择
	$('#notType').change(function(){ 
		loadMBContr(1);
		var notType = $(this).children('option:selected').val();
		if(notType>2){
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"notType":notType},
				url:"${ctx}/system/notice/getNoticeInfoByType.do",
				success:function(data){
					if(data.success){
						document.getElementById("notSave").style.display="none";
						document.getElementById("notChange").style.display="inline-block";
						document.getElementById("adIdIpt").value=data.snList.noticeId;
// 						setSelectChecked("notType",data.snList.noticeType);
						document.getElementById("notTitle").value=data.snList.noticeTitle;
						document.getElementById("adIsUpload").value=data.snList.remark;
						$("#ggym4").empty();
						ggeditor4.html("");
						ggeditor4.html(data.sNoticeContent);
						document.getElementById("notSave").style.display="none";
						document.getElementById("notChange").style.display="inline-block";
					}else{
						qxNotinfo();
						document.getElementById("notSave").style.display="inline-block";
						document.getElementById("notChange").style.display="none";
					}
			}	 
		  }); 
		}else{
			document.getElementById("notSave").style.display="inline-block";
			document.getElementById("notChange").style.display="none";
		}
		loadMBContr(0);
	});
</script>
<!-- *******公告结束*******  -->
</html>
