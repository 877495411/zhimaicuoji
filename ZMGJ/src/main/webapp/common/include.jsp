<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var ctx = "${ctx}";

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
</script>
<!-- jquery easyui -->
<script type="text/javascript" src="${ctx}/common/jqueryEasyui/easyloader.js"></script>
<script type="text/javascript" src="${ctx}/common/jqueryEasyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/jqueryEasyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/jqueryEasyui/themes/default/easyui.css"/>
<script type="text/javascript" src="${ctx}/common/jqueryEasyui/easyui-lang-zh_CN.js"></script>
