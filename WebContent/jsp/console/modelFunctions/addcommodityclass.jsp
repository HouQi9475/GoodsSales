<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加类别</title>
<style type="text/css">
body{
   font-size: 12px;
}
</style>
<style type="text/css">
	body{font-size:12px;}
	.deptTable{
		width:35%;
		border:1px solid #B3B3B3;
		font-family: "微软雅黑";
		margin-top: 25px;}
	.deptTable .title{
	    height: 35px; 
	    background-color: #B2B2B2; 
	    color: #FFFFFF; 
	    text-align:center;"}
	.searchTable{
		border:1px solid #B3B3B3;
		font-family: "微软雅黑";
		}
	a{text-decoration: none;}
</style>
</head>
<body>
  <h2>添加商品类别</h2>
  <s:form id="form1" name="form1" method="post" action="commodityclass_add" namespace="/" theme="simple">
     <table width="200px" cellspacing="2">
     <tr>
       <td>类别名称</td>
       <td><input type="text" name="commodityClassName"/></td>
     </tr>
     <tr>
       <td>所属大类</td>
       <td><select id="bigcommodityclass.bigclassid" name="bigcommodityclass.bigclassid">
							<c:forEach items="${requestScope.lstBigclass }" var="classes">
								<option value="${classes.bigclassid }">${classes.bigclassname }</option>
							</c:forEach>

					</select></td>
     </tr>
     <tr>
      <td><input type="submit" value="点击添加"/></td>
     </tr>
     </table>
  </s:form>
</body>
</html>