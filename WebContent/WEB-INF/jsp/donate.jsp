<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="atool_alipay_img_form"
		style="padding-bottom: 0; border: none;" method="post"
		action="https://shenghuo.alipay.com/send/payment/fill.htm"
		target="_blank" accept-charset="GBK"
		onsubmit="document.charset='gbk';">
		<input type="hidden" value="792283901@qq.com" name="optEmail">
		<input type="hidden" value="10" name="payAmount">
		<input type="hidden" name="title"  value="为了我们发展更好感谢大家支持">
		<input type="image" value="支付宝收款" src="http://www.atool.org/res/alipay_1.png" name="pay">
	</form>
<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body>
</html>