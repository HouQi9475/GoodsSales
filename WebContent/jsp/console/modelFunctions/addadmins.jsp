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
	height: 480px;
	border-radius: 8px;
	background-color: #DDD;
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
	padding: 10px;
	border-radius: 8px;
	padding-left: 280px;
}

#addAdminForm #formTitle {
	border: 1px solid #0099FF;
	background-color: #00CCFF;
	height: auto;
	width: auto;
	color: #FFF;
	font-size: 14px;
	font-weight: bold;
	padding: 10px;
	border-radius: 8px;
	text-align: center;
}

.textStyle {
	width: 150px;
	height: 25px;
	border: 1px solid #E6E6E6;
	border-radius: 5px;
	background-color: #FFFFCC;
	font-size: 13px;
	padding-left: 10px;
	font-weight: bold;
	margin: 5px;
}

.btn {
	width: 120px;
	height: 25px;
	border: 1px solid #5E78B7;
	background-color: #3855B8;
	border-radius: 5px;
	color: #F3F3F3;
	text-align: center;
}

.btn1 {
	width: 120px;
	height: 25px;
	border: 1px solid #5E78B7;
	background-color: #3855B8;
	border-radius: 5px;
	color: #F3F3F3;
	text-align: center;
	cursor: pointer;
}
</style>
<script type='text/javascript' src='/SSH04/dwr/interface/adminsaction.js'></script>
<script type='text/javascript' src='/SSH04/dwr/engine.js'></script>
<script type="text/javascript">
function checkForm(){
	 var adminacount = document.getElementById("adminacount");
	   if(adminacount.value.length<3 || adminacount.value.length>20){
			alert("用户名的长度必须为3-20位！");
			adminacount.select();
			return false;
		}
	 var password=document.getElementById("adminpassword").value;
	 var repassword=document.getElementById("readminpassword").value;
	   if(password!=repassword){
		   alert("两次密码不一致!");
		   return false;
	   }
	
		   return true;
}
//检测用户名的方法
function checkUsername(){
	var adminacount = document.getElementById("adminacount");
	var message = document.getElementById("message");
	message.innerHTML = "<img src='images/loading.gif' /> 正在请求用户名……";
	adminsaction.usernameExists(adminacount.value,checkUsernameCallback);
}
function checkUsernameCallback(data){
	var message = document.getElementById("message");
	if(data==true){
		message.innerHTML = "<font color='red'>很遗憾，用户名已经被占用！</font>";
	}else{
		message.innerHTML = "<font color='green'>恭喜，用户名可用！</font>";
	}
}  
</script>
</head>
<body>
	<c:if test="${empty requestScope.lstAdminroles }">
		<script>location="/SSH04/admins_preadd.action";</script>
	</c:if>
	<div id="container">
		<div id="mainBody">
			<s:form id="addAdminForm" name="addAdminForm" method="post"
				action="admins_add" namespace="/" theme="simple" onSubmit="javascript:return checkForm();">
				<table width="441" border="0">
					<tr>
						<td id="" height="25">&nbsp;</td>
						<td id="formTitle" height="25">添加管理员信息</td>
						<td id="" height="25">&nbsp;</td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">登录帐号：</td>
						<td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="adminacount"
								id="adminacount" cssClass="textStyle" onblur="checkUsername()" /></td>
						<td width="156" align="left" valign="middle" style="color: #999"><span id="message">必填，不少于3位</span></td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">登录密码：</td>
						<td align="left" valign="middle"><label for="password"></label>
							<s:password name="adminpassword" id="adminpassword"
								cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填，不少于6位</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">密码确认：</td>
						<td align="left" valign="middle"><label for="repassword"></label>
							<s:password name="readminpassword" id="readminpassword"
								cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填，两次密码一致</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">管理员姓名：</td>
						<td align="left" valign="middle"><label for="truename"></label>
							<s:textfield name="adminname" id="adminname" cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">管理员角色：</td>
						<td colspan="2" align="left" valign="middle"><label
							for="roles"></label> <label for="roles"></label> 
							<select id="adminroles.rolesid"
						            name="adminroles.rolesid" class="textStyle">
							<option value="0">---请选择---</option>
							<c:forEach items="${requestScope.lstAdminroles }" var="roles">
								<option value="${roles.rolesid }">${roles.rolesname }</option>
							</c:forEach>
					</select></td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">管理员状态：</td>
						<td colspan="2"><input name="adminstatus" type="radio"
							id="rdostatus" value="true" checked> <label for="rdostatus">启用
								<input type="radio" name="adminstatus" id="rdostatus2" value="false">
								禁用
						</label></td>
					</tr>
					<tr>
						<td height="30" align="center" valign="middle">&nbsp;</td>
						<td height="30" align="center" valign="middle"><input
							type="submit" name="btnAddAdmin" id="btnAddAdmin" value="添加管理员"
							class="btn1" ></td>
						<td height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table>
			</s:form>

		</div>
	</div>
</body>
</html>