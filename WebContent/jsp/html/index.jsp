
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
<%
   if(request.getParameter("codes")!=null){
	   int code=Integer.parseInt(request.getParameter("codes").toString());
	   switch(code){
	   case 201:
		   out.print("<script>alert('查询商品不存在！')</script>");
	   break;
	  
	   }
   }
%>
	<c:if test="${empty requestScope.commodityPage }">
		<script>
			location = "<%=basePath%>show.action";
		</script>
	</c:if>
	<div class="menu">

		<font color="white" size="3px" style="margin-top: 3px">欢迎登录：<s:property
				value="#session.users.username" /></font>
		<ul>
			<li style="width: 0px;"><a></a></li>
			<li class="active"><a href="<%=basePath%>jsp/html/index.jsp"
				class="home">首页</a></li>
			<li><a class="account"
				onclick="javascript:location='<%=basePath%>preusersUpdate.action?userid=<s:property value="#session.users.userid" />';">我的帐号</a></li>
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
				<li><a
					href="<%=basePath%>findByClass.action?commodityclassid=<s:property value="#bc.bigclassid"/>"><s:property
							value="#bc.bigclassname" /></a>
					<div>
						<ul>
							<s:iterator var="c" value="#bc.commodityclasses">
								<li><a
									href="<%=basePath%>findBySmallClass.action?smallcommodityclassid=<s:property value="#c.commodityClassId"/>"><s:property
											value="#c.commodityClassName" /></a></li>
							</s:iterator>
						</ul>
					</div></li>
			</s:iterator>
		</ul>

		<!--  
		<div id="search">
			<div class="button-search">
			<a href="javascript:void(0)" onclick="document.getElementById('fbn').submit()">0</a>
			</div>
			<s:form action="findByName" method="get" id="fbn" namespace="/" theme="simple">
			<s:textfield name="commodityName" id="commodityName"></s:textfield>
			</s:form>
		</div>
		-->
	</div>

    <div class="heading" style="margin-left: 200px;">
        <form id="find" action="<%=basePath%>show.action" method="post">
             <input type="text" name="findBycommodityName"/>&nbsp;&nbsp;<a href="javascript:void(0)"
					onclick="document.getElementById('find').submit()">搜索商品</a>
        </form>
    </div>
	<div class="container">
		<div class="text_box_left">精选商品</div>
		<div class="box-product">


			<c:forEach items="${requestScope.commodityPage.list }" var="commodity">

				<div>
					<div class="showhim">
						<div class="image">
							<a
								href="commodity_findById?commodityId=${commodity.commodityId }"><img
								src="<%=basePath%>images/goodsimage/${commodity.image }"
								alt="iMac" />
								<div class="showme">
									<div class="description_featured" style="min-height: 110px;">
										<p>${commodity.commodityDepict }</p>
									</div>
								</div> </a>
							<div class="name">
								<a
									href="commodity_findById?commodityId=${commodity.commodityId }">${commodity.commodityName }</a>
							</div>
							<div class="priced">
								<ul>
									<li>${commodity.fcPrice}</li>
									<li><a
										href="commodity_findById?commodityId=${commodity.commodityId }">商品详情</a></li>
								</ul>
							</div>
							<div style="margin-top: 24px;"></div>
						</div>
						<div class="showme"></div>
					</div>
				</div>

			</c:forEach>
		</div>
		<table class="infobar" border="1">
			<tr align="center">
				<td height="25">共搜索到:${requestScope.commodityPage.totalRows} 件商品
					&nbsp; &nbsp; 当前:第${requestScope.commodityPage.currentPage}/
					${requestScope.commodityPage.totalPages}页 &nbsp; &nbsp; 请选择：第 <c:forEach
						begin="1" end="${requestScope.commodityPage.totalPages}" var="i">
                 &nbsp;<a
							href="<%=basePath%>show.action?currentPage=${i }">${i }
						</a>&nbsp;
              </c:forEach>页
				</td>
			</tr>
		</table>
	</div>
	<br>
</body>
</html>