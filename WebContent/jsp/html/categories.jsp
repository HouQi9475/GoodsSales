
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小商品批发销售</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jsp/html/css.css" />
</head>
<body>
	<!--  
	<c:if test="${empty requestScope.lstCommodities }">
		<script>
			location = "/SSH04/show.action";
		</script>
	</c:if>
	-->
	<div class="menu">

		<font color="white" size="3px" style="margin-top: 3px">欢迎登录：<s:property
				value="#session.users.username" /></font>
		<ul>
			<li style="width: 0px;"><a></a></li>
			<li class="active"><a href="<%=basePath%>jsp/html/index.jsp"
				class="home">首页</a></li>
			<li><a class="account"
				onclick="javascript:location='/SSH04/preusersUpdate.action?userid=<s:property value="#session.users.userid" />';">我的帐号</a></li>
			<li><a href="<%=basePath%>jsp/html/cart.jsp" class="cart">购物车</a></li>
			<li><a class="checkout"
				href="<%=basePath%>jsp/console/adminsLogin.jsp">后台管理</a></li>
			<li style="float: right;"><a
				href="<%=basePath%>jsp/html/usersLogin.jsp" class="login">登录</a></li>
			<li style="float: right;"><a class="register"
				href="<%=basePath%>jsp/html/register.jsp">注册</a></li>
		</ul>
	</div>

	<div class="heading">
		<s:set value="#session.cart.items" id="items"></s:set>
		<a style="padding: 8px; margin-left: -12px;"
			href="<%=basePath%>jsp/html/cart.jsp">购物车</a><span
			style="font-size: 14px; color: #fff;">&raquo;</span> <a><span
			id="cart_total"><s:property value="#session.cart.items.size" />
				item(s) - $<s:property value="#session.n" /></span></a>
	</div>
	<div id="menu">
		<ul>
			<s:iterator var="bc" value="#session.lstBigclass">
				<li><a href="/SSH04/findByClass.action?commodityclassid=<s:property value="#bc.bigclassid"/>"><s:property
							value="#bc.bigclassname" /></a>
					<div>
						<ul>
							<s:iterator var="c" value="#bc.commodityclasses">

								<li><a href="/SSH04/findBySmallClass.action?smallcommodityclassid=<s:property value="#c.commodityClassId"/>"><s:property
											value="#c.commodityClassName" /></a></li>

							</s:iterator>
						</ul>
					</div></li>
			</s:iterator>
		</ul>
	</div>
	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<br>
		<h1 style="margin-top: -10px;"><s:property value="#session.bcc.bigclassname"/></h1>
		<br>
		<div id="column-left">
			<div class="box">
				<div class="box-heading_left">商品类别</div>
				<div class="box-content" style="background: none; border: none;">
					<div class="box-category">
					<ul>
					   <s:iterator var="bc" value="#session.bcc.commodityclasses">
							<li><a href="/SSH04/findBySmallClass.action?smallcommodityclassid=<s:property value="#bc.commodityClassId"/>"><s:property value="#bc.commodityClassName"/></a></li>
					   </s:iterator>	
					</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="content">
		  <s:iterator var="c" value="#session.lstCommodity">
			<div class="product-list">
				<div class="struct">
					<div class="struct-right"></div>
					<div class="struct-left"></div>
					<div class="struct-center">
						<div class="line">
							<a href="commodity_findById?commodityId=<s:property value="#c.commodityId"/>" class="image-link">
								<div class="image">
									<img src="<%=basePath%>images/goodsimage/<s:property value="#c.image"/>"
										alt="iPod Touch" height="100px" width="100px" />
								</div>
							</a>

							<div class="right">
								<div class="price"><font color="red">$<s:property value="#c.fcPrice"/></font></div>

								
							</div>

							<div class="name">
								<a href="commodity_findById?commodityId=<s:property value="#c.commodityId"/>"><s:property value="#c.commodityName"/></a>
							</div>
							<div class="description"><s:property value="#c.commodityDepict"/></div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			</s:iterator>
		</div>
	</div>
</body>
</html>