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
<script type="text/javascript">
function selectAllCheckBox(checkBoxName){
	var ckBoxs = document.getElementsByName(checkBoxName);
	for(var i=0; i<ckBoxs.length; i++){
		if(ckBoxs[i].checked == false){
			ckBoxs[i].checked = true;
		}
	}
}
function selectAllReverseCheckBox(checkBoxName){
	var ckBoxs = document.getElementsByName(checkBoxName);
	for(var i=0; i<ckBoxs.length; i++){
		if(ckBoxs[i].checked == false){
			ckBoxs[i].checked = true;
		}else{
			ckBoxs[i].checked = false;
		}
	}
}
function delBatchClass(checkBoxName){
	var ckBoxs = document.getElementsByName(checkBoxName);
	var flag = false;
	var data = "";
	for(var i=0; i<ckBoxs.length; i++){
		if(ckBoxs[i].checked == true){
			flag = true;			
			break;
		}
	}
	if(flag){
		if(confirm("确定删除这些管理员吗?")){
			for(var i=0; i<ckBoxs.length; i++){
				if(ckBoxs[i].checked == true){
					data += ckBoxs[i].value+",";
				}				
			}
			data = data.substring(0, data.length-1);
			location="/SSH04/delBatch_admins.action?adminids="+data;
		}	
	}else{
		alert("警告：至少选择一个部门!");
	}
		
}
</script>
</head>
<body>
<!-- 使用拉取模式获取Dept部门信息集合 -->
<c:if test="${empty requestScope.adminsPage }">
	<script>location="/SSH04/admins_findByPages.action";</script>
</c:if>
<h3>管理员信息</h3>


<table class="deptTable" style="margin-top:20px;">
	<tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF; text-align:center;">
		<td></td>
		<td>管理员帐号</td>
		<td>管理员密码</td>
		<td>真实姓名</td>
		<td>管理员权限</td>		
		<td style="background-color: orange;">操作</td>
	</tr> 
	<c:forEach items="${requestScope.adminsPage.list }" var="classPage">
	<tr style="height: 25px; text-align:center; background-color: lavender;">
	    <td style="width:5%;">
			<input type="checkbox" id="adminids" name="adminids" value="${classPage.adminid }"/>
		</td>
		<td style="width:13%;">${classPage.adminacount }</td>
		<td style="width:13%;">${classPage.adminpassword }</td>
		<td style="width:11%;">${classPage.adminname }</td>
		<td style="width:11%;">${classPage.adminroles.rolesname }</td>
		<td style="width:28%;">
			<input type="button" value="更新" onclick="javascript:location='/SSH04/preupdate_admins.action?adminid=${classPage.adminid }';"/>&nbsp;
			<input type="button" value="删除" onclick="javascript:if(confirm('确定删除该管理员吗？')){location='/SSH04/delete_admins.action?adminid=${classPage.adminid}'};"/>
		</td>		
	</tr>	
	</c:forEach>
	  <tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF;">
		<td colspan="3">
			总计：${requestScope.adminsPage.totalRows } 条数据&nbsp;&nbsp;&nbsp;
			当前：第 ${requestScope.adminsPage.currentPage }/${requestScope.adminsPage.totalPages }  页
		</td>
		<td colspan="4">
			<input type="button" value="全选" onclick="javascript:selectAllCheckBox('adminids');"/>&nbsp;
			<input type="button" value="反选" onclick="javascript:selectAllReverseCheckBox('adminids');"/>&nbsp;
			<input type="button" value="批量删除" onclick="javascript:delBatchClass('adminids');"/>
		
			请选择：第 
			<c:forEach var="i" begin="1" end="${requestScope.adminsPage.totalPages }">
				<c:if test="${i == requestScope.adminsPage.currentPage }">
				&nbsp;【${i }】&nbsp;
				</c:if>
				<c:if test="${i != requestScope.adminsPage.currentPage }">
				&nbsp;<a href="/SSH04/admins_findByPages.action?currentPage=${i }">${i }</a>&nbsp;
				</c:if>				
			</c:forEach>
			 页
			 
		</td>
	</tr>
	
</table>
</body>
</html>