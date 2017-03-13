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
			<li><a href="<%=basePath%>jsp/html/updateUsers.jsp" class="account">我的帐号</a></li>
			<li><a href="<%=basePath%>jsp/html/cart.jsp" class="cart">购物车</a></li>
			<li><a class="checkout" href="<%=basePath%>jsp/html/showorder.jsp">我的订单</a></li>
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
		<div class="icart-footer-container">
			<div class="column_footer" style="width: 350px;">
				<h3>About Us</h3>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel
				ante felis, aliquet sagittis lacus. Etiam in purus vitae tortor
				lacinia pretium. Maecenas quam diam, porttitor bibendum lacinia a,
				feugiat sit amet felis. Praesent ut mi justo, a volutpat ligula.
				Praesent sodales felis sed odio consectetur eget cursus metus
				mollis. Proin sollicitudin accumsan lectus a ornare... .
			</div>

			<div class="column_footer">
				<h3>Customer Service</h3>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Delivery Information</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Returns</a></li>
					<li><a href="#">Site Map</a></li>
				</ul>
			</div>

			<div class="column_footer" style="width: 150px;">
				<h3>Extras</h3>
				<ul>
					<li><a href="#">Brands</a></li>
					<li><a href="#">Gift Vouchers</a></li>
					<li><a href="#">Affiliates</a></li>
					<li><a href="#">Specials</a></li>
				</ul>
			</div>
			<div class="column_footer" style="width: 150px;">
				<h3>My Account</h3>
				<ul>
					<li><a href="#">My Account</a></li>
					<li><a href="#">Order History</a></li>
					<li><a href="#">Wish List</a></li>
					<li><a href="#">Newsletter</a></li>
				</ul>
			</div>

			<div class="column_footer" style="margin-right: 0px;">
				<h3>Social</h3>
				<ul class="social">
					<li class="twitter"><a href="../../twitter.com/twitter">Twitter
							Username</a></li>
					<li class="facebook"><a
						href="../../facebook.com/Username/default.htm">Facebook</a></li>
					<li class="rss"><a href="#">RSS Feed</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">
				<div class="icart-logo-footer">
					<a href="index.php"><img src="images/logo-footer.png"
						alt="Footer Logo"></a>
				</div>
				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;">&copy;
						Copyright &copy; 2013.Company name All rights reserved.<a
						target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
						- More Templates <a href="http://www.cssmoban.com/"
						target="_blank" title="ģ��֮��">ģ��֮��</a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
</body>
</html>