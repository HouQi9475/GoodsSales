<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/SSH04/css/global.css">
<style type="text/css">
#container {
	width: 100%;
	height: 630px;
	border: 0px dashed #900;
	margin-left: auto;
	margin-right: auto;
}

#container #header {
	width: 100%;
	height: 50px;
	border: 0px dashed #900;
	margin-left: auto;
	margin-right: auto;
}

#container #header #headInfo {
	padding-top: 5px;
	padding-left: 25px;
}
#container #header #headmain {
	padding-top: 5px;
	text-align: center;
}

#container #mainBody {
	width: 100%;
	height: 560px;
	border: 0px dashed #900;
	margin-left: auto;
	margin-right: auto;
}

#container #footer {
	width: 100%;
	height: 20px;
	border: 0px dashed #900;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

a {
	text-decoration: none;
}
</style>
<script src="/SSH04/scripts/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="/SSH04/css/SpryTabbedPanels.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="headInfo">
				欢迎：${sessionScope.admins.adminname } 身份：${sessionScope.admins.adminroles.rolesname }[<a href="admins_logout.action">安全退出</a>]
			</div>
			<div id="headmain">
			    <h1>商品批发销售后台系统</h1>
			</div>
		</div>
		<div id="mainBody">
			<div id="TabbedPanels1" class="TabbedPanels">
				<ul class="TabbedPanelsTabGroup">
					<li class="TabbedPanelsTab" tabindex="0">用户管理</li>
					<li class="TabbedPanelsTab" tabindex="0">商品管理</li>
					<li class="TabbedPanelsTab" tabindex="0">商品类别管理</li>
					<li class="TabbedPanelsTab" tabindex="0">订单管理</li>
				</ul>
				<div class="TabbedPanelsContentGroup">
					<!--创建一个iframe框架引用usermanagermodelpanel.html-->
					<div class="TabbedPanelsContent">
						<iframe name="userManagerModelPanel" frameborder="1" width="100%"
							height="530" src="modelPanels/UserManagerModelPanel.html"></iframe>
					</div>
					<div class="TabbedPanelsContent">
						<iframe name="CommodityManagerModelPanel" frameborder="1"
							width="100%" height="530"
							src="modelPanels/CommodityManagerModelPanel.html"></iframe>
					</div>
					<div class="TabbedPanelsContent">
						<iframe name="CommodityClassManagerModelPanel" frameborder="1"
							width="100%" height="530"
							src="modelPanels/CommodityClassManagerModelPanel.html"></iframe>
					</div>
					<div class="TabbedPanelsContent"><iframe name="OrdersManagerModelPanel" frameborder="1"
							width="100%" height="530"
							src="modelPanels/OrdersManagerModelPanel.html"></iframe></div>
				</div>
			</div>
		</div>
		<div id="footer">CopyRight chinasoft 2016-2017</div>
	</div>
	<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>