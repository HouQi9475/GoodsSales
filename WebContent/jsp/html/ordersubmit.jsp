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
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
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
			<li><a class="account" onclick="javascript:location='/SSH04/preusersUpdate.action?userid=<s:property value="#session.users.userid" />';" >我的帐号</a></li>
			<li class="active"><a href="cart.jsp" class="cart">购物车</a></li>
			<li style="float: right;"><a href="login.html" class="login">登录</a></li>
			<li style="float: right;"><a class="register">注册</a></li>
		</ul>
	</div>
	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<div class="linktree">
			<a href="#">首页</a> &raquo; <a href="#">提交订单</a>
		</div>
		<h1 style="margin-top: -10px;">我的订单&nbsp;</h1>

		<br>
		<div class="cart-info">
			<table>
				<thead>
					<tr>
						<td class="remove">删除</td>
						<td class="image">图片</td>
						<td class="name">产品名称</td>
						<td class="quantity">数量</td>
						<td class="price">单价</td>


					</tr>
				</thead>
				<tbody>
					<s:set value="#session.cart.items" id="items"></s:set>
					<s:if test="#items.size!=0">
						<s:iterator value="#items" id="item">
							<tr>
								<td class="remove"><input type="checkbox" name="remove[]"
									value="41" /></td>
								<td class="image"><a href="#"><img width="80px"
										height="80"
										src="<%=basePath%>images/goodsimage/<s:property value="value.commodity.image" />"
										alt="iMac" title="iMac" /></a></td>
								<td class="name"><a href="#"><s:property
											value="value.commodity.commodityName" /></a>
									<div></div></td>
								<td class="quantity"><input id="quantity" type="text"
									name="quantity" value="<s:property value="value.quantity"/>"
									size="3" /> <input type="hidden" id="commodityid"
									name="commodityid"
									value="<s:property value="#request.commodity.commodityId" />">
								</td>
								<td class="price">$<s:property
										value="value.commodity.fcPrice" /></td>


							</tr>
						</s:iterator>
					</s:if>

					<tr>
						<td colspan="7" style="text-align: right;">原价:$<s:property
								value="#session.y" />&nbsp;&nbsp;<br/><font color="red" size="4">优惠价:$<s:property
								value="#session.n" /></font></td>
					</tr>
					
				</tbody>

			</table>
			<s:form action="checkOut" method="post" namespace="/" theme="simple"
				id="form1">
				<table>
					<tr>
						<td>收货人姓名</td>
						<td><s:textfield name="name" id="order.name" /></td>
					</tr>
					
					<tr>
						<td>收货人电话</td>
						<td><s:textfield name="phone" id="order.phone" /></td>
					</tr>
					
					<tr>
						<td>收获人地址</td>
						<td><s:textfield name="address" id="order.address" /></td>
					</tr>
				</table>

			</s:form>
		</div>
        <div>
          <s:actionerror/>
        </div>
		<div class="buttons">
			<div class="right">
				<a class="button" style="width: 120px;" href="javascript:void(0)"
					onclick="document.getElementById('form1').submit()"><span>提交订单</span></a>
			</div>
		</div>

	</div>
	

</body>
</html>