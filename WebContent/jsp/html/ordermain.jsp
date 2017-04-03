<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>
    <link rel="stylesheet" type="text/css"
	href="<%=basePath%>jsp/html/css.css" />
	 
</head>

<body>

<s:token/>
	<div class="menu">
		<ul>
			<li style="width: 0px;"><a></a></li>
			<li><a href="<%=basePath%>jsp/html/index.jsp" class="home">首页</a></li>
			<li><a  class="account" onclick="javascript:location='/SSH04/preusersUpdate.action?userid=<s:property value="#session.users.userid" />';">我的帐号</a></li>
			<li><a href="<%=basePath%>jsp/html/cart.jsp" class="cart">购物车</a></li>
			<li style="float: right;"><a href="<%=basePath%>jsp/html/usersLogin.jsp" class="login">登录</a></li>
			<li style="float: right;"><a class="register" href="<%=basePath%>jsp/html/register.jsp">注册</a></li>
		</ul>
	</div>
	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<div class="linktree">
			<a href="#">首页</a> &raquo; <a href="#">我的订单</a>
		</div>
		<h1 style="margin-top: -10px;">订单详情&nbsp;</h1>

		<br>
			<div class="cart-info">
				<table>
					<thead>
						<tr>
							<td>图片</td>
							<td>商品名称</td>
							<td>数量</td>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${requestScope.orderitems}"
				var="orderitems">
						 <tr>
							<td><img width="80px" height="80"
									src="<%=basePath%>images/goodsimage/${orderitems.commodity.image }" alt="iMac" title="iMac" /></td>
					        <td>${orderitems.commodity.commodityName }</td>
					        <td>${orderitems.quantity }</td>
					        
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

	</div>
	
</body>
</html>