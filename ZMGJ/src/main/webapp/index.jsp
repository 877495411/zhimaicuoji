<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<%@include file="/common/include.jsp"%>
<head lang="en">
    <meta charset="UTF-8">
    <title>知脉国际</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx }/css/CommonCss.css">
    <link rel="stylesheet" href="${ctx }/css/common.css">
    <link rel="stylesheet" href="${ctx }/css/index.css">
</head>
<body>
<div id="page">
    <!--顶部-->
    <div id="head">
        <div class="w clearfloat">
            <!--顶部菜单栏-->
            <ul id="nav" class="clearfloat">
                <li class="nav-items"><a class="head-tivace"  href="${ctx }/index.jsp">首页</a></li>
                <li class="nav-items"><a href="${ctx }/business.jsp">走进知脉</a></li>
                <li class="nav-items"><a  href="${ctx }/join.jsp">业务范围</a></li>
                <li class="nav-logo"><img src="${ctx }/images/logo.png"> </li>
                <li class="nav-items"><a href="${ctx }/review.jsp">往期回顾</a></li>
                <li class="nav-items"><a href="${ctx }/#">招才引智</a></li>
                <li class="nav-items"><a href="${ctx }/Contactus.jsp">联系我们</a></li>
            </ul>
        </div>
        <div id="language">
            <a class="chinese" style="color: #e3c575;">中文</a>
            <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <a class="english">English</a>
        </div>
    </div>
    <!--展示图片区-->
    <div class="banimg">
        <!-- <img class="imgscale" src="images/bgimg1.jpg"> -->
 
       <video class="sssss" style="width: 100%;" autoplay="autoplay" loop="loop">
            <source src="images/dongtu.mp4" type="video/mp4" />
            <source src="images/dongtu.ogg" type="video/ogg" />
            <source src="images/dongtu.webm" type="video/webm" />
            <object data="images/dongtu.mp4" width="320" height="240">
                <embed width="320" height="240" src="images/dongtu.swf" />
            </object>
        </video>
        <div id="tex" class="flex">
            <span class="cell"></span>
            <span class="cell"></span>
            <span class="cell"></span>
            <span class="cell"></span>
            <span class="cell"></span>
            <span class="cell inview pc-delay01">Z</span>
            <span class="cell inview pc-delay02">H</span>
            <span class="cell inview pc-delay03">I</span>
            <span class="cell inview pc-delay04">M</span>
            <span class="cell inview pc-delay05">A</span>
            <span class="cell inview pc-delay06">I</span>
            <span class="cell"></span>
            <span class="cell"></span>
        </div>
        <div id="texs" class="flex">
            <span class="cell inview pc-delay01">I</span>
            <span class="cell inview pc-delay02">N</span>
            <span class="cell inview pc-delay03">T</span>
            <span class="cell inview pc-delay04">E</span>
            <span class="cell inview pc-delay05">R</span>
            <span class="cell inview pc-delay06">N</span>
            <span class="cell inview pc-delay07">A</span>
            <span class="cell inview pc-delay08">T</span>
            <span class="cell inview pc-delay09">I</span>
            <span class="cell inview pc-delay10">O</span>
            <span class="cell inview pc-delay11">N</span>
            <span class="cell inview pc-delay12">A</span>
            <span class="cell inview pc-delay13">L</span>
        </div>
        
    </div>
    <!--业务板块-->
    <div class="w">
        <div id="work" class="clearfloat">
            <p class="wtit">业务<i class="wicon"></i>板块</p>
            <p class="wtext"></p>
            <ul id="wlist">
                <li class="wlist-items" onclick="goToPage('zmsxy')">
                    <div><img src="images/w1.png"></div>
                    <p>知脉企业融通平台</p>
                </li>
                <li class="wlist-items" onclick="goToPage('zmwllx')">
                    <div><img src="images/w2.png"></div>
                    <p>知脉未来领袖</p>
                </li>
                <li class="wlist-items" onclick="goToPage('nzxx')">
                    <div><img src="images/w4.png"></div>
                    <p>知脉女性</p>
                </li>
                <li class="wlist-items" style="margin-right: 0;" onclick="goToPage('acesff')">
                    <div><img src="images/w3.png"></div>
                    <p>A.C.E.S.F北京办事处</p>
                </li>
            </ul>
        </div>
    </div>
    <!--走进知脉-->
    <div id="join">
        <div class="w jo-con" onclick="goToBusiness();">
            <p class="wtit">走进<i class="wicon"></i>知脉</p>
            <p class="wtext">面向知识经济、数字经济和经济全球化，打造并运营3S（span或stride across，跨文化、跨行业、跨体制）全球商务实体网络，为国内
                高净值群体及其家属提供人力资源全生命周期外包服务。</p>
            <ul class="join-list">
                <li class="join-itemss">
                    <p>ZHIMAI</p>
                    <p>international</p>
                </li>
                <li class="join-items">
                    <i class="join-icon"></i>
                    <p class="join-iconp">知脉公益</p>
                </li>
                <li class="join-items"><img src="images/join1.jpg"></li>
            </ul>
            <ul class="join-list">
                <li class="join-items"><img src="images/join6.png"></li>
                <li class="join-items">
                    <i class="join-icon join-icon2"></i>
                    <p class="join-iconp">公司介绍</p>
                </li>
                <li class="join-items" style="background-color: #d4b665;">
                    <i class="join-icon join-icon3"></i>
                    <p class="join-iconp">知脉团队</p>
                </li>
                <li class="join-items"><img src="images/join2.jpg"></li>
                <li class="join-items"><img src="images/join3.jpg"></li>
                <li class="join-items">
                    <i class="join-icon join-icon4"></i>
                    <p class="join-iconp">合作机构</p>
                </li>
            </ul>
            <ul class="join-list">
                <li class="join-itemno"></li>
                <li class="join-itemno"></li>
                <li class="join-items"><img src="images/join4.jpg"></li>
                <li class="join-items"><img src="images/join5.jpg"></li>
                <li class="join-items">
                    <i class="join-icon join-icon5"></i>
                    <p class="join-iconp">全球资源</p>
                </li>
            </ul>
        </div>
    </div>
    <!--底部-->
    
    
<%@include file="/common/foot.jsp"%>
</div>
<script type="text/javascript">
	function goToPage(type) {
		location.href=ctx + "/join.jsp?type=" + type
	}
	function goToBusiness() {
		location.href=ctx+"/business.jsp";
	}
</script>
</body>
</html>