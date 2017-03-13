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
		if(confirm("确定删除这些类别吗?")){
			for(var i=0; i<ckBoxs.length; i++){
				if(ckBoxs[i].checked == true){
					data += ckBoxs[i].value+",";
				}				
			}
			data = data.substring(0, data.length-1);
			location="/SSH04/delBatch_commodityclass.action?commodityClassIds="+data;
		}	
	}else{
		alert("警告：至少选择一个部门!");
	}
		
}
</script>
</head>
<body>
<!-- 使用拉取模式获取Dept部门信息集合 -->
<c:if test="${empty requestScope.orders }">
	<script>location="/SSH04/ordersfindall.action";</script>
</c:if>
<h3>订单信息</h3>

<a href="#" onclick="javascript:location='/SSH2Demo/jsp/searchDept.jsp';">条件查询</a>

<table class="deptTable" style="margin-top:20px;">
	<tr style="height: 35px; background-color: #B2B2B2; color: #FFFFFF; text-align:center;">
		
		<td>订单编号</td>
		<td>下单时间</td>
		<td>下单用户</td>
		<td>总价</td>	
		<td>收货人</td>
        <td>电话</td>
		<td>地址</td>
		<td>状态</td>	
		<td style="background-color: orange;">操作</td>
	</tr> 
	<c:forEach items="${requestScope.orders }" var="orders">
	<tr style="height: 25px; text-align:center; background-color: lavender;">
	   
		<td style="width:5%;"><input type="hidden" name="orderid" value="${orders.orderid }"/>${orders.orderid }</td>
		<td style="width:13%;">${orders.orderdate }</td>
		<td style="width:6%;">${orders.users.username }</td>
		<td style="width:10%;">${orders.totalPrice }</td>
		<td style="width:10%;">${orders.name }</td>
		<td style="width:11%;">${orders.phone }</td>
		<td style="width:13%;">${orders.address }</td>
		<td style="width:9%;"><c:if test="${orders.status==1 }">已发货</c:if>
					            <c:if test="${orders.status==0 }">未发货</c:if></td>
		<td style="width:35%;">
		    <c:if test="${orders.status==1 }">
			<input type="button" value="发货" disabled="disabled"/>&nbsp;
			</c:if>
			<c:if test="${orders.status==0 }">
			<input type="button" value="发货" onclick="javascript:location='/SSH04/setstatus.action?orderid=${orders.orderid }';" />&nbsp;
			</c:if>
			<input type="button" value="查看详情" onclick="javascript:location='/SSH04/findbypage_orders.action?orderid=${orders.orderid }';"/>
		</td>		
	</tr>	
	</c:forEach>
	 
</table>
</body>
</html>