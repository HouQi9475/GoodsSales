<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<link rel="stylesheet" type="text/css" href="/SSH04/css/global.css">
<link rel="stylesheet" type="text/css" href="/SSH04/css/console_login.css">
<script type="application/javascript" src="/SSH04/scripts/console_login.js"></script>
<script type="text/javascript">
// 验证表单的函数
function checkForm(){
	var code="";
	//步骤2：自定义一个方法用来生成验证码
	function createCode(){
		  //步骤2-1：将验证码变量置空
		  code="";
		  //步骤2-2：设置验证码的长度
		  var codeLength=4;
		  //步骤2-3：设置生成验证码的字符数组
		  var codeChars=new Array('a','b','c','d','e','f','g','h','i','g','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9');
		  //步骤2-4：通过算法自动生成四位验证码并存放到全局变量中
		  for(var i=0;i<codeLength;i++){
			    //步骤2-4-1：首先通过math函数随机生成0-35的随机数，用于充当字符数组的下标，
				var selectedIndex=Math.floor(Math.random()*36);
				//步骤2-4-2：通过生成的随机下标访问字符数组获取相应的字符并累加到全局的验证码变量中
				code+=codeChars[selectedIndex];
			  }
			  //步骤2-5：将设置好的四位验证码来显示到指定区域
			  document.getElementById("code").value=code;
		}
	// 判断两次密码是否一致
	var newuserpasswork = document.getElementById("newuserpasswork").value ;
	var renewuserpasswork= document.getElementById("renewuserpasswork").value;
	if(newuserpasswork!=renewuserpasswork){
		alert("两次密码输入不一致！");
		return false;
	}
	var validateCode1=document.getElementById("validateCode").value.toLowerCase();
	var validateCode2=document.getElementById("code").value.toLowerCase();
	
	if(validateCode.value!=validateCode2){
		alert("验证码错误！");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
   if(request.getParameter("code")!=null){
	   int code=Integer.parseInt(request.getParameter("code").toString());
	   switch(code){
	   case 201:
		   out.print("<script>alert('原密码错误！')</script>");
	   break;
	   }
   }
%>
<form id="form1" name="form1" method="post" action="updatePassword" onSubmit="javascript:return checkForm();">
  <table id="loginTable" width="320">
    <tr>
      <td height="25" colspan="2"  class="title">密码修改</td>
    </tr>
    <tr>
      <td height="25" align="center" valign="middle" class="text">原密码：</td>
      <td><label for="password"></label>
      <input type="password" name="olduserpasswork" id="olduserpasswork" class="textStyle"></td>
    </tr>
    <tr>
      <td height="25" align="center" valign="middle" class="text">新密码：</td>
      <td><label for="password"></label>
      <input type="password" name="newuserpasswork" id="newuserpasswork" class="textStyle"></td>
    </tr>
    <tr>
      <td height="25" align="center" valign="middle" class="text">确认新密码：</td>
      <td><label for="password"></label>
      <input type="password" name="renewuserpasswork" id="renewuserpasswork" class="textStyle"></td>
    </tr>
    <tr>
      <td height="25" align="center" valign="middle" class="text">验证码：</td>
      <td><label for="validateCode"></label>
      <input name="validateCode" type="text" id="validateCode" size="4" maxlength="4" class="ValidatetextStyle">
      <label for="code"></label>
      <input name="code" type="text" id="code" size="4" maxlength="4" class="codetextStyle" readonly>
      <a href="javascript:void(0)" onclick="javascript:createCode();">      点击刷新</a></td>
    </tr>
    <tr>
      <td height="25"  align="center" valign="middle"><a href="<%=basePath%>jsp/html/index.jsp"><input type="button" name="btnLogin" id="btnLogin" value="返回首页" class="btn"></a></td>
      <td height="25"  align="center" valign="middle"><input type="submit" name="btnUpdate" id="btnUpdate" value="立即修改" class="btn"></td>
    </tr>
  </table>
</form>
</body>
</html>