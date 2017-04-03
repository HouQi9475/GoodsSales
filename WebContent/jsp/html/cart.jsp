<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jsp/html/css.css" />

</head>

<body>
	<s:token />
	<div class="menu">
		<ul>
			<li style="width: 0px;"><a></a></li>
			<li><a href="<%=basePath%>jsp/html/index.jsp" class="home">首页</a></li>
			<li><a class="account"
				onclick="javascript:location='/SSH04/preusersUpdate.action?userid=<s:property value="#session.users.userid" />';">我的帐号</a></li>
			<li class="active"><a href="<%=basePath%>jsp/html/cart.jsp"
				class="cart">购物车</a></li>
			<li><a class="checkout" href="orderfindall">我的订单</a></li>
			<li style="float: right;"><a
				href="<%=basePath%>jsp/html/usersLogin.jsp" class="login">登录</a></li>
			<li style="float: right;"><a class="register"
				href="<%=basePath%>jsp/html/register.jsp">注册</a></li>
		</ul>
	</div>
	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<div class="linktree">
			<a href="#">首页</a> &raquo; <a href="#">购物车</a>
		</div>
		<h1 style="margin-top: -10px;">我的购物车&nbsp;</h1>

		<br>
		<div class="cart-info">
			<table>
				<thead>
					<tr>
						<td class="remove">删除</td>
						<td class="image">图片</td>
						<td class="name">产品名称</td>
						<td class="model">生产厂</td>
						<td class="quantity">数量</td>
						<td class="price">单价</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<s:set value="#session.cart.items" id="items"></s:set>

					<s:if test="#items.size!=0">
						<s:iterator value="#items" id="item">
							<s:form action="updateCart" method="post" namespace="/"
								theme="simple">
								<tr>
									<td class="remove"><input type="checkbox" name="carts"
										id="carts"
										value="<s:property value="value.commodity.commodityId" />" /></td>
									<td class="image"><a
										href="commodity_findById?commodityId=<s:property value="value.commodity.commodityId" />"><img
											width="80px" height="80"
											src="<%=basePath%>images/goodsimage/<s:property value="value.commodity.image" />"
											alt="iMac" title="iMac" /></a></td>
									<td class="name"><a href="#"><s:property
												value="value.commodity.commodityName" /></a>
										<div></div></td>
									<td class="model"><s:property
											value="value.commodity.manufacturer" /></td>
									<td class="quantity"><input id="quantity" type="text"
										name="quantity" value="<s:property value="value.quantity"/>"
										size="3" /> <input type="hidden" id="commodityid"
										name="commodityid"
										value="<s:property
												value="value.commodity.commodityId" />">
									</td>
									<td class="price">$<s:property
											value="value.commodity.fcPrice" /></td>
									<td><s:submit value="更新" /><br /> <input type="button"
										value="删除"
										onclick="javascript:if(confirm('确定删除该项吗？')){location='/SSH04/deleteCart.action?commodityid=<s:property value="#request.commodity.commodityId" />'};"></td>
								</tr>
							</s:form>
						</s:iterator>
					</s:if>

					<tr>
						<td colspan="7" style="text-align: right;">原价:$<s:property
								value="#session.y" />&nbsp;&nbsp; <font color="red">总价:$<s:property
									value="#session.n" /></font></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="buttons">
			<div class="left">
				<a class="button" style="width: 120px;"
					onclick="javascript:if(confirm('确定清空购物车吗？')){location='/SSH04/removeCart.action'}"><span>清空购物车</span></a>
			</div>
			<div class="right">
				<a class="button" style="width: 120px;"
					href="<%=basePath%>checkout.action"><span>结算</span></a>
			</div>
			<div class="center">
				<a href="<%=basePath%>jsp/html/index.jsp" class="button"
					style="width: 120px;"><span>继续购物</span></a>
			</div>
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="icart-footer">
		<div class="icart-footer-top">
			<div style="width: 1000px; margin: 0 auto;"></div>
		</div>

		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">

				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;">&copy;
						Copyright &copy; 2016.中软国际ETC.侯琪<a target="_blank"
						href="http://www.cssmoban.com/"></a> - More Templates <a
						href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��"></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
</body>
</html>