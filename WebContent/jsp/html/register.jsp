<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 100%;
	height: 575px;
	background-color: #DDD;
	margin-top: 15px;
}

#container #mainBody {
	width: 35%;
	height: 50%;
	border-radius: 8px;
	border: 0px dashed #F33;
	margin: 10px 10px;
	padding-top: 100px;
	margin-left: 450px;
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

}

#addAdminForm #formTitle {
	border: 1px solid #0099FF;
	background-color: #666;
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
 <script type='text/javascript' src='/SSH04/dwr/interface/usersaction.js'></script>
  <script type='text/javascript' src='/SSH04/dwr/engine.js'></script>
<script type="text/javascript">
function checkForm(){
	 var adminacount = document.getElementById("useracount");
	   if(adminacount.value.length<3 || adminacount.value.length>20 ||adminacount.value==null){
			alert("用户名的长度必须为3-20位！");
			adminacount.select();
			return false;
		}
	 var password=document.getElementById("userpasswork").value;
	 var repassword=document.getElementById("reuserpasswork").value;
	   if(password!=repassword){
		   alert("两次密码不一致!");
		   return false;
	   }
	
		   return true;
}
//检测用户名的方法
function checkUsername(){
	var adminacount = document.getElementById("useracount");
	var message = document.getElementById("message");
	message.innerHTML = "<img src='images/loading.gif' /> 正在请求用户名……";
	usersaction.usernameExists(adminacount.value,checkUsernameCallback);
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
	
	<div id="container">
		<div id="mainBody">
			<s:form id="addAdminForm" name="addAdminForm" method="post"
				action="users_add" namespace="/" theme="simple" onSubmit="javascript:return checkForm();">
				<table width="441" border="0">
					<tr>
						<td id="" height="25">&nbsp;</td>
						<td id="formTitle" height="25">用户注册</td>
						<td id="" height="25">&nbsp;</td>
					</tr>
					<tr>
						<td width="103" height="30" align="left" valign="middle">登录帐号：</td>
						<td width="168" align="left" valign="middle"><label
							for="acount"></label> <s:textfield name="useracount"
								id="useracount" cssClass="textStyle" onblur="checkUsername()" /></td>
						<td width="156" align="left" valign="middle" style="color: #999"><span id="message">必填，不少于3位</span></td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">登录密码：</td>
						<td align="left" valign="middle"><label for="password"></label>
							<s:password name="userpasswork" id="userpasswork"
								cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填，不少于6位</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">密码确认：</td>
						<td align="left" valign="middle"><label for="repassword"></label>
							<s:password name="reuserpasswork" id="reuserpasswork"
								cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填，两次密码一致</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">用户姓名：</td>
						<td align="left" valign="middle"><label for="truename"></label>
							<s:textfield name="username" id="username" cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">用户电话：</td>
						<td align="left" valign="middle"><label for="truename"></label>
							<s:textfield name="userphone" id="userphone" cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填</td>
					</tr>
					<tr>
						<td height="30" align="left" valign="middle">用户地址：</td>
						<td align="left" valign="middle"><label for="truename"></label>
							<s:textfield name="useraddress" id="useraddress" cssClass="textStyle" /></td>
						<td align="left" valign="middle" style="color: #999;">必填</td>
					</tr>
					<tr>
						<td height="30" align="center" valign="middle">&nbsp;</td>
						<td height="30" align="center" valign="middle"><input
							type="submit" name="btnAddAdmin" id="btnAddAdmin" value="点击注册"
							class="btn1" ></td>
						<td height="30" align="center" valign="middle"><a href="<%=basePath%>jsp/html/usersLogin.jsp"><input
							type="button" name="btnAddAdmin" id="btnAddAdmin" value="返回登录"
							class="btn1" ></a></td>
					</tr>
				</table>
			</s:form>

		</div>
	</div>
</body>
</html>