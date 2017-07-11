var validateMsg;
var flagPhone=false;
var flagPassword1=false;
var flagPassword2=false;
var flagCode = false;
var flagIsShowPwd = false;
function changeImg(){     
	
    var imgSrc = $("#imgObj");     
    var src = imgSrc.attr("src");   
    imgSrc.attr("src",chgUrl(src));  
    document.getElementById("veryCode").value="";
    $("#yzts").text("");
    iputNum=0;
}


function imgError(image) {
	$(image).attr("src", ctx+"/images/defaultImg.png");
	$(image).css({
		"display" : "block"
	});
	$(image).css({
		"margin" : "0 auto"
	});
}
function chgUrl(url){     
	  var timestamp = (new Date()).valueOf();     
	  urlurl = url.substring(0,17);     
	  if((url.indexOf("&")>=0)){     
	      urlurl = url + "×tamp=" + timestamp;     
	  }else{     
	      urlurl = url + "?timestamp=" + timestamp;     
	  }     
	  return urlurl;     
}

function step(num) {
	var account = $("#account").val();
	var verificat = $("#veryCode").val();
	$(".warn").text("");
	if(num == '1') {
		if(account != "" && account != null && verificat != "" && verificat != null) { 
			var flag = isRightCode(); 
			if(flag == true) {
				if(isRightCode()) {
					if(getPhoneNum()) {
						$("#change_step1").hide();
						$("#change_step2").show();
					} else {
						// 用户名不存在
						$(".warn").eq(0).text("账号不存在");
						
					}
				} else {
					// 验证码错误
					$(".warn").eq(0).text("验证码错误");
				}
			} 
		} else { 
			//null 
			$(".warn").eq(0).text("请输入账号和验证码");
			
		}
	}
	if(num == '2') {
		if(validateCode()) {
			 $("#change_step2").hide();
			 $("#change_step3").show();
		}
	}
	if(num == '3') {
		validatePwd();
		$(".warn").eq(2).text("");
		if(flagPassword1) {
			updatePassword();
			if(flagPassword2) {
				$("#change_step3").hide();
				$("#change_step4").show();
			} else {
				$(".warn").eq(2).text("修改失败");
			}
		}
	}
}

function updatePassword() {
	var password = $("#password");
	var repassword = $("#repassword");
	$.ajax({     
        type:"POST",     
        url:ctx+"/admin/merchant/updatePassword.do",
        dataType : "json",
		data : {"password":password.val(),"tempUserId":$("#tempUserId").val()},
		async:false,
		success : function(data) {
			if(data.success) {
				flagPassword2 = true;
			}
			return flagPassword2;
		}
	});
}

function validatePwd() {
	var password = $("#password");
	var repassword = $("#repassword");
	var reg = /^(?!^\d+$)(?!^[a-zA-Z]+$)(?!^\_+$)[0-9a-zA-Z\_]*$/;
	if(password.val() == null || password.val() == "" || password.val().length == 0) {
		//null
		$(".warn").eq(2).text("密码不能为空");
		flagPassword1 = false;
	}
	if(repassword.val() == null || repassword.val() == "" || repassword.val().length == 0) {
		//null
		$(".warn").eq(2).text("确认密码不能为空");
		flagPassword1 = false;
	}
	if(password.val().length < 6 || password.val().length > 20) {
		//长度限制
		$(".warn").eq(2).text("密码长度为6-20位字符");
		flagPassword1 = false;
	}
	if(repassword.val().length < 6 || repassword.val().length > 20) {
		//长度限制
		$(".warn").eq(2).text("确认密码长度为6-20位字符");
		flagPassword1 = false;
	}
	if(reg.test(password.val()) && reg.test(repassword.val())) {
		flagPassword1 = true;
	} else{
		$(".warn").eq(2).text("密码须包含字母数据和下划线且不能有特殊字符");
	}
	return validateMsg;
}

function isRightCode(){     
    var code = $("#veryCode").val();
    var dat = "code=" + code;
    var flag = false;
    console.log(code);
    $.ajax({     
        type:"POST",     
        url:ctx+"/yg/validateCode/validate.do",
					dataType : "text",
					data : dat,
					async:false,
					success : function(data) {
						ajaxobj = eval("(" + data + ")");
						console.log(ajaxobj["result"]);
						if (ajaxobj["result"] == true) {
							flag = true;
						} else if (ajaxobj["result"] == false) {
							/*
							 * yzts.text("验证码有误").css({ backgroundColor :
							 * "#ffebeb", border : "1px solid red" });
							 */
							document.getElementById("veryCode").value="";
							changeImg();
							flag = false;
							$(".warn").eq(0).text("验证码错误");
						}
						return flag;
					}
				});
	return flag;
}

function getPhoneNum() {
	var flag = false;
	var account = $("#account").val();
	$.ajax({
		type:"post",
		async:false,
		dataType:"json",
		url:ctx+"/admin/merchant/getMerchantInfo.do",
		data:{
				"account":account
			},
		success:function(data){
			if(data.success) {
				flag = true;
				$("#comTelPhone").val(data.phone.comTelphone);
				$("#phone").val(data.phone.comTelphone.substring(0,3) + "****" + data.phone.comTelphone.substring(7,11));
				$("#tempUserId").val(data.phone.merchantId);
			} else {
				flag = false;
			}
			return flag;
		}
	});
	return flag;
}

function getMessage(){
	document.getElementById("noteBtn").disabled=true;
	var phone = document.getElementById("comTelPhone").value;
	if(phone!="" && phone!=null){
		$.ajax({
			type:"post",
			dataType:"text",
			url: "https://www.yg669.com/yg/message/sendMessageForYuguoAdmin.do",
			data:{
					"phone":phone,
					"merchantId":$("#merchantId").val(),
					"messageType":"5"
				},
			success:function(data){
				ajaxobj=eval("("+data+")");
				if(ajaxobj.success==true){
					document.getElementById("noteBtn").disabled=true;
					document.getElementById("tempUserId").value="";
					document.getElementById("tempUserId").value=ajaxobj.tempUserId;
					$(".warn").eq(1).text("验证码已发送,请查收短信").css({
			display:"block"		
                 });
				}
				timeOut();
			}
		})
	}
}

/* 60秒倒计时 */
function timeOut(){
	var secs = 60; // 倒计时的秒数
    for(var i=secs;i>=0;i--){ 
       window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000); 
    } 
}


// 验证码
function validateCode(){
	temp = /^\d{5}$/; /* 数字 */
	var tempUserId = document.getElementById("tempUserId").value;
	var validateCode=$("#authCode").val();  
	alert(validateCode);
    if(validateCode!=""){
   	 	 if(temp.test(validateCode)){
   			$.ajax({
   				type:"post",
   				async:false,
   				dataType:"text",
   				url:"https://www.yg669.com/yg/message/getMessage.do",
   				data:{
   					"tempUserId":tempUserId,
   					"validateCode":validateCode
   					},
   				success:function(data){
   					ajaxobj=eval("("+data+")");
   					if(ajaxobj.success==false){
   						flagCode=false;
  						  $(".warn").eq(1).text("验证码输入错误,请核实短信").css({
	      						 display:"block"		
	                      });
   					}else{
   						flagCode=true;
   						$(".warn").eq(1).text("").css({
									display:"none"		
                  		});
   					}
   				}
   			});
   		}else{
   			flagCode=false;
   			$(".warn").eq(1).text("验证码格式错误,请核实短信").css({
				display:"block"		
           });
   		}
   }else{
	   flagCode=false;
	   $(".warn").eq(1).text("请输入短信验证码").css({
			display:"block"		
       });
   }
  return flagCode;
}

function doUpdate(num){ 
   	document.getElementById('noteBtn').innerText = num+ "秒后重新发送";
    if(num == 0) { 
    	document.getElementById('noteBtn').innerText = "点击获取验证码 ";
    	document.getElementById("noteBtn").disabled=false;
    	$(".warn").eq(1).text("验证码已发送,请查收短信").css({
				display:"none"		
             });
    }
}

 	 