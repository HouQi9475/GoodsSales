<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<div id="container">
	
	<h3>更新管理员信息</h3>
	<form id="form01" name="form01" method="post" action="/SSH04/update_admins.action">
		<table class="deptTable">
			<tr>
				<td class="title">管理员帐号：</td>
				<td><input style="border:1px solid #b3b3b3; padding-left:5px;" type="text" id="adminacount" name="adminacount" value="${requestScope.admins.adminacount}" /></td>
			</tr>
			<tr>
				<td class="title">管理员密码：</td>
				<td><input style="border:1px solid #b3b3b3; padding-left:5px;" type="text" id="adminpassword" name="adminpassword" value="${requestScope.admins.adminpassword}"/></td>
			</tr>
			<tr>
				<td class="title">真实姓名：</td>
				<td><input style="border:1px solid #b3b3b3; padding-left:5px;" type="text" id="adminname" name="adminname" value="${requestScope.admins.adminname}"/></td>
			</tr>
			<tr>
				<td class="title">管理员权限：</td>
				<td>
				<select id="adminroles.rolesid" name="adminroles.rolesid">
							<c:forEach items="${requestScope.lstAdminroles }" var="roles">
								<option value="${roles.rolesid }">${roles.rolesname }</option>
							</c:forEach>

				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="更新管理员"/></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>