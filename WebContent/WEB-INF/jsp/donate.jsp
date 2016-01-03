<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐赠</title>
<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
</head>

<body>

	<form name="atool_alipay_img_form"  method="post"
		action="https://shenghuo.alipay.com/send/payment/fill.htm"
		target="_blank" accept-charset="GBK"
		onsubmit="document.charset='gbk';">
		<input type="hidden" value="yclixiaofeng@sohu.com" name="optEmail">
		<!--<input type="hidden" value="10" name="payAmount">-->
		<input type="hidden" name="title"  value="为了我们发展更好感谢大家支持">
		<label> ￥</label> <input id="payAmount" type="text" value="1"  name="payAmount">
		<input type="submit" id="paybtn" name="pay" value="去支付宝捐赠"/>
		<label>如果你觉得WEB篮子做得不错，欢迎贡献你的爱心，帮助站长减轻主机与域名的负担，不胜感谢 : ) </label>
		<br>
		<input type="button" id="alipaybtn"  value="支付宝扫码捐赠"  onMouseMove="popup1()"  onMouseOut="out1()"/>
		<input type="button" id="weixinbtn"  value="微信扫码捐赠"  onMouseMove="popup2()" onMouseOut="out2()"/><br>
		<img  id="weixincode" src="img/weixin.png" hidden/>
		<img  id="alipaycode" src="img/zhifubao.png"  hidden/>
	</form>
<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body> 
<script>
	function popup1(){
		$("#alipaycode").show(1000);
	}
	function popup2(){
		$("#weixincode").show(1000);
	}
	function out1(){
		$("#alipaycode").hide(500);
	}
	function out2(){
		$("#weixincode").hide(500);
	}
</script>
</html>