<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>
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
<c:if test="${empty requestScope.orderitems }">
	<script>location="/SSH04/findbypage_orders.action";</script>
</c:if>
<h3>订单详情</h3>


<table class="deptTable" style="margin-top:20px;">
	<tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF; text-align:center;">
		
		<td>图片</td>
		<td>商品名称</td>
		<td>数量</td>	
	</tr> 
	<c:forEach items="${requestScope.orderitems }" var="orderitems">
	<tr style="height: 25px; text-align:center; background-color: lavender;">
		<td style="width:13%;"><img width="80px" height="80"
									src="<%=basePath%>images/goodsimage/${orderitems.commodity.image }" alt="iMac" title="iMac" /></td>
		<td style="width:13%;">${orderitems.commodity.commodityName }</td>
		<td style="width:11%;">${orderitems.quantity }</td>
	</tr>	
	</c:forEach>
</table>
</body>
</html>