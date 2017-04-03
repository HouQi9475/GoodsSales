<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js">
	
</script>
</head>
<body>
	<div id="container">
		<h3>更新商品信息</h3>
		<form id="form01" name="form01" method="post"
			action="/SSH04/update_commodity.action">
			<table class="deptTable">
				<tr>
					<td class="title">商品编号：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityId" name="commodityId"
						value="${requestScope.commodity.commodityId}" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="title">商品名称：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityName" name="commodityName"
						value="${requestScope.commodity.commodityName}" /></td>
				</tr>
				<tr>
					<td class="title">商品类别：</td>
					<td><select id="commodityclass.commodityClassId" name="commodityclass.commodityClassId">
					         <option value="${requestScope.commodity.commodityclass.commodityClassId }">${requestScope.commodity.commodityclass.commodityClassName} </option>
							<c:forEach items="${requestScope.lstClass }" var="classes">
								<option value="${classes.commodityClassId }">${classes.commodityClassName }</option>
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td class="title">商品描述：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityDepict" name="commodityDepict"
						value="${requestScope.commodity.commodityDepict}" /></td>
				</tr>
				<tr>
					<td class="title">商品原价：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityPrice" name="commodityPrice"
						value="${requestScope.commodity.commodityPrice}" /></td>
				</tr>
				<tr>
					<td class="title">商品现价：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="fcPrice" name="fcPrice"
						value="${requestScope.commodity.fcPrice}" /></td>
				</tr>
				<tr>
					<td class="title">商品总数：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityAmount" name="commodityAmount"
						value="${requestScope.commodity.commodityAmount}" /></td>
				</tr>
				<tr>
					<td class="title">剩余数量：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="commodityLeaveNum" name="commodityLeaveNum"
						value="${requestScope.commodity.commodityLeaveNum}" /></td>
				</tr>
				<tr>
					<td class="title">商品产商：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="manufacturer" name="manufacturer"
						value="${requestScope.commodity.manufacturer}" /></td>
				</tr>
				<tr>
					<td class="title">上架时间：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="text"
						id="regTime" name="regTime"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						src="skin/datePicker.gif" width="16" height="22"
						value="${requestScope.commodity.regTime}" /></td>
				</tr>
				<tr>
					<td class="title">图片：</td>
					<td><input
						style="border: 1px solid #b3b3b3; padding-left: 5px;" type="file"
						id="image" name="image"
						value="${requestScope.commodity.image}" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="更新商品" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>