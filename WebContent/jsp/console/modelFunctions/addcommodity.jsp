<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 100%;
	height: 450px;
	border-radius: 8px;
	background-color: # 0F0;
	margin-top: 15px;
}

#container #mainBody {
	width: 98%;
	height: 98%;
	border-radius: 8px;
	border: 0px dashed #F33;
	margin: 10px 10px;
	padding-top: 15px;
}

#body {
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 10px;
}

#addAdminForm {
	border: 1px solid #c9c9c9;
	padding: 5px;
	border-radius: 8px;
	padding-left: 280px;
}

#addAdminForm #formTitle {
	border: 1px solid #0099FF;
	background-color: #00CCFF;
	height: auto;
	width: auto;
	color: #FFF;
	font-size: 12px;
	font-weight: bold;
	padding: 8px;
	border-radius: 8px;
	text-align: center;
}

.textStyle {
	width: 150px;
	height: 20px;
	border: 1px solid #E6E6E6;
	border-radius: 5px;
	background-color: #FFFFCC;
	font-size: 12px;
	padding-left: 10px;
	font-weight: bold;
	margin: 5px;
}

.btn {
	width: 120px;
	height: 20px;
	border: 1px solid #5E78B7;
	background-color: #3855B8;
	border-radius: 5px;
	color: #F3F3F3;
	text-align: center;
}

.btn1 {
	width: 120px;
	height: 20px;
	border: 1px solid #5E78B7;
	background-color: #3855B8;
	border-radius: 5px;
	color: #F3F3F3;
	text-align: center;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js">
</script>
</head>
<body>
	<c:if test="${empty requestScope.lstClasss }">
		<script>location="/SSH04/commodity_preadd.action";</script>
	</c:if>
	<div id="container">
		<div id="mainBody">
			<s:form id="addAdminForm" name="addcommodityForm" method="post"
				action="commodity_add" namespace="/" theme="simple" enctype="multipart/form-data">
				<table width="403" border="0">
					<tr>
						<td id="" height="25">&nbsp;</td>
						<td height="25" align="center" id="formTitle">添加商品信息</td>
						<td id="" height="25">&nbsp;</td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">商品名称：</td>
			      <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="commodityName"
								id="commodityName" cssClass="textStyle" /></td>
						<td width="156" align="left" valign="middle" style="color: #999">必填，不少于6位</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">商品类别：</td>
				  <td colspan="2" align="left" valign="middle"><label
							for="roles"></label> <label for="roles"></label> 
							<select id="commodityclass.commodityClassId"
						            name="commodityclass.commodityClassId" class="textStyle">
							<option value="0">---请选择---</option>
							<c:forEach items="${requestScope.lstClasss }" var="classes">
								<option value="${classes.commodityClassId }">${classes.commodityClassName }</option>
							</c:forEach>
					</select></td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">商品品牌：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="manufacturer"
								id="manufacturer" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">商品简介：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="commodityDepict"
								id="commodityDepict" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td width="103" height="25" align="left" valign="middle">商品原价：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="commodityPrice"
								id="commodityPrice" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td width="103" height="25" align="left" valign="middle">商品现价：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="fcPrice"
								id="fcPrice" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">商品总数：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="commodityAmount"
								id="commodityAmount" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">剩余数量：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="commodityLeaveNum"
								id="commodityLeaveNum" cssClass="textStyle" /></td>
					</tr>
					<tr>
					   <td width="103" height="30" align="left" valign="middle">上架时间: </td>
					   <td width="168" align="left" valign="middle"><label
							for="acount"></label>
					   <s:textfield name="regTime" id="regTime"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						src="skin/datePicker.gif" width="16" height="22" cssClass="textStyle"/></td>
					</tr>
					<tr>
						<td width="103" height="25" align="left" valign="middle">商品图片：</td>
					  <td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:file name="goodspicture"
								id="goodspicture" cssClass="textStyle" /></td>
					</tr>
					<tr>
						<td height="25" align="center" valign="middle">&nbsp;</td>
				    <td height="25" align="center" valign="middle">
				     <input type="submit" name="btnAddcommodity" id="btnAddcommodity" value="添加商品" class="btn1" >
				     </td>
						<td height="25" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table>
			</s:form>

		</div>
	</div>
</body>
</html>