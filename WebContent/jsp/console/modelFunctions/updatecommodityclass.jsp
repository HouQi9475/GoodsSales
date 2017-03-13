<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-size: 12px;
}

.deptTable {
	width: 35%;
	border: 1px solid #B3B3B3;
	font-family: "微软雅黑";
	margin-top: 25px;
}

.deptTable .title {
	height: 35px;
	background-color: #B2B2B2;
	color: #FFFFFF;
	text-align: center;
	"
}

.searchTable {
	border: 1px solid #B3B3B3;
	font-family: "微软雅黑";
}

a {
	text-decoration: none;
}
</style>
</head>
<body>

	<div id="container">

		<h3>更新类别信息</h3>
		<a href="#"
			onclick="javascript:location='/SSH04/jsp/console/modelFunctions/showcommodityclass.jsp';">查询类别信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"
			onclick="javascript:location='/SSH2Demo/jsp/searchDept.jsp';">(高级)筛选条件查询</a>
		<form id="form01" name="form01" method="post"
			action="/SSH04/update_commodityclass.action">
			<table class="deptTable">
				<tr>
					<td class="title">类别编号：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityClassId" name="commodityClassId"
						value="${requestScope.commodityclass.commodityClassId}"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="title">类别名称：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityClassName" name="commodityClassName"
						value="${requestScope.commodityclass.commodityClassName}" /></td>
				</tr>
				<tr>
					<td class="title">所属大类：</td>
					<td><select id="bigcommodityclass.bigclassid"
						name="bigcommodityclass.bigclassid">
							<option value="${requestScope.commodityclass.bigcommodityclass.bigclassid }">${requestScope.commodityclass.bigcommodityclass.bigclassname }</option>
							<c:forEach items="${requestScope.lstBigclass }" var="classes">
								<option value="${classes.bigclassid }">${classes.bigclassname }</option>
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="更新类别" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>