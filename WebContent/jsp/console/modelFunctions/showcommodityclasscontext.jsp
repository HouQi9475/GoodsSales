<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{font-size:12px;}
	.deptTable{
		width:60%;
		border:1px solid #B3B3B3;
		font-family: "微软雅黑";}
	.searchTable{
		border:1px solid #B3B3B3;
		font-family: "微软雅黑";
		}
	a{text-decoration: none;}
</style>

</head>
<body>
<!-- 使用拉取模式获取Commodityclass部门信息集合 -->
<c:if test="${empty requestScope.classPage }">
	<script>location="/SSH04/commodityclass_findByPage.action";</script>
</c:if>
<h3>类别详细数据</h3>

<table class="deptTable" style="margin-top:20px;">
	<tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF; text-align:center;">
		<td>类别名称</td>			
		<td>具体物品</td>
	</tr> 
	<c:forEach items="${requestScope.classPage.list }" var="classPage">
	<tr style="height: 25px; text-align:center; background-color: lavender;">
		<td style="width:13%;">${classPage.commodityClassName }</td>
		<td style="width:20%;"> 
			<c:forEach items="${classPage.commodities }" var="goods">
				<a href="/SSH04/jsp/console/modelFunctions/showcommodity.jsp">${goods.commodityName }</a> &nbsp;
			</c:forEach>
		</td>
	</tr>	
	</c:forEach>
	  <tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF;">
		<td colspan="2">
		         总计：${requestScope.classPage.totalRows } 条数据&nbsp;&nbsp;&nbsp;
			当前：第 ${requestScope.classPage.currentPage }/${requestScope.classPage.totalPages }  页
			请选择：第 
			<c:forEach var="i" begin="1" end="${requestScope.classPage.totalPages }">
				<c:if test="${i == requestScope.classPage.currentPage }">
				&nbsp;【${i }】&nbsp;
				</c:if>
				<c:if test="${i != requestScope.classPage.currentPage }">
				&nbsp;<a href="/SSH04/commodityclass_findByPage.action?currentPage=${i }">${i }</a>&nbsp;
				</c:if>				
			</c:forEach>
			 页
		</td>
	</tr>
	
</table>
</body>
</html>