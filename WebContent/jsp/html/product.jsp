<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${empty requestScope.commodity }">
		<script>
			location = "/SSH04/commodity_findById.action";
		</script>
	</c:if>
	<div class="menu">
		<ul>
			<li style="width: 0px;"><a></a></li>
			<li><a href="<%=basePath%>jsp/html/index.jsp" class="home">首页</a></li>
			<li><a class="account"  onclick="javascript:location='/SSH04/preusersUpdate.action?userid=<s:property value="#session.users.userid" />'">我的帐号</a></li>
			<li><a class="cart" href="<%=basePath%>jsp/html/cart.jsp">购物车</a></li>
			<li><a class="checkout" href="orderfindall">我的订单</a></li>
			<li style="float: right;"><a href="login.html" class="login">Login</a></li>
			<li style="float: right;"><a class="register">Register</a></li>
		</ul>
	</div>





	<div id="container_bg">


		<style type="text/css">
.linktree {
	margin-top: 0px;
	margin-bottom: 10px;
	margin-left: 3px;
}

.linktree a {
	color: #666;
	text-decoration: none;
	font-size: 11px;
}

#menu {
	border-radius: 5px;
}
</style>



		<div id="content">
			<div class="block-white">
				<div class="block-content"></div>
				<div class="separator"></div>
				<div class="block-content">
					<div class="product-info">

						<div class="left">
							<div class="image">
								<a href="#" title="iMac"><img width="400px" height="380px"
									src="images/goodsimage/<s:property value="#request.commodity.image" />" title="iMac" alt="iMac"
									id="image" /></a>
							</div>
							
						</div>

						<div class="right">


							<div id="tab-information" class="tab-content">
								<div id="information"></div>


								<div class="description">
									<span>&raquo;&nbsp;名称:</span> <a href="#"><s:property
											value="#request.commodity.commodityName" /></a><br /> <span>&raquo;&nbsp;生产商:</span>
									<s:property value="#request.commodity.manufacturer" />
									<br /> <span>&raquo;&nbsp;上架日期:</span>
									<s:property value="#request.commodity.regTime" />
									<br /> <span>&raquo;&nbsp;剩余数量:</span>
									<s:property value="#request.commodity.commodityLeaveNum" />
								</div>

								<div class="price">
									&nbsp;&nbsp;&nbsp;&nbsp;<br/>
									<div class="price-tax" style="text-decoration: line-through;">
										原价: $
										<s:property value="#request.commodity.commodityPrice" />
									</div>
									
								   <div class="right">
								       <table width="300">
								            <tr align="center">
								               <td><span class="price-new"><font size="3" color="red">$<s:property
											value="#request.commodity.fcPrice" /></font></span></td>
								               <td><font color="red" size="5" >9折</font></td>
								               <td><font color="red" size="5">8折</font></td>
								                <td><font color="red" size="5">7折</font></td>
								            </tr>
								            <tr align="center">
								            <td>起批量：</td>
								               <td><font size="3">10-99</font></td>
								               <td><font size="3">100-199</font></td>
								                <td><font size="3">≥200</font></td>
								            </tr>
								       </table>
								   </div>
									
								</div>
								<br>
								<div class="cart">
									<div>   <s:form action="addToCart" id="addToCart">
									         
										数量:<input class="quantity" type="text" name="quantity"
											size="2" value="1" />
											<input type="hidden" name="commodityid" value="<s:property value="#request.commodity.commodityId" />">
											<c:if test="${requestScope.commodity.commodityLeaveNum==0 }"> &nbsp;<a class="button" style="width:120px;" ><span>暂时无货</span></a></c:if>
											 <c:if test="${requestScope.commodity.commodityLeaveNum>0 }">&nbsp;<a class="button" style="width:120px;"  href="javascript:void(0)" onclick="document.getElementById('addToCart').submit()"><span>加入购物车</span></a></c:if>
											</s:form>
									</div>
									
								</div>
								<div class="review">
									<div>
										<img src="images/stars.png" alt="0 reviews" />&nbsp;&nbsp; <a>商品介绍</a>
									</div>
								</div>
								<div>
									<s:property value="#request.commodity.commodityDepict" />
								</div>
							</div>
							<div class="price"></div>
						</div>
					</div>
				</div>
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

		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">
				
				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;">&copy;
						Copyright &copy; 2016.中软国际ETC.<a
						target="_blank" href="http://www.cssmoban.com/"></a>
						 <a href="http://www.cssmoban.com/"
						target="_blank" title="模板之家">侯琪</a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
</body>
</html>