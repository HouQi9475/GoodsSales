<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js">
</script>
<style>
body {
	font-size: 12px;
	background-color: lavender;
}

div {
	border: 1px solid #FFFFFF;
	background-color: #FFFFFF;
	padding: 10px;
	text-align: center;
}

div table .infobar {
	background-color: #FFFFFF;
}

div table {
	width: 80%;
	border: 1px solid lavender;
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
}

table tr td {
	background-color: lavender;
	padding: 3px;
}

#btnEdit {
	cursor: pointer;
	border: 1px solid orange;
	border-radius: 5px;
	color: #FFFFFF;
	background-color: orange;
	height: 25px;
	width: 50px;
}

#btnDelete {
	cursor: pointer;
	border: 1px solid #FF0000;
	border-radius: 5px;
	color: #FFFFFF;
	background-color: #FF0000;
	height: 25px;
	width: 50px;
}

#btnReturn {
	cursor: pointer;
	margin-bottom: 5px;
	border: 1px solid #0000FF;
	border-radius: 5px;
	color: #FFFFFF;
	background-color: #0000FF;
	height: 25px;
	width: 80px;
}

#btnSearch {
	cursor: pointer;
	margin-bottom: 5px;
	border: 1px solid #0000FF;
	border-radius: 5px;
	color: #FFFFFF;
	background-color: #0000FF;
	height: 25px;
	width: 80px;
}
</style>
<script type="text/javascript">
function showLargeImage(img){
	var td = img.parentNode;
	var div = document.createElement("div");
	div.setAttribute("style","border:solid 0px #cccccc; background-color:#FFFFFF; position:absolute; top:0px; right:40px;");
	div.innerHTML = "<img src='"+ img.src +"' width='100' height='100' />";
	td.appendChild(div);
}
function hiddenLargeImage(img){
	var td = img.parentNode;
	var div = td.getElementsByTagName("div")[0];
	td.removeChild(div);
}
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
			location="/SSH04/delBatch_commodity.action?commodityIds="+data;
		}	
	}else{
		alert("警告：至少选择一个商品!");
	}
		
}
</script>
</head>

<body>
	<c:if test="${empty requestScope.commodityPage }">
		<script>location="/SSH04/commodity_findByPages.action";</script>
	</c:if>


	<div>
		<input type="button" id="btnReturn" name="btnReturn" value="返回首页" />&nbsp;
		<s:form id="form" name="form" namespace="/" method="post"
					action="commodity_findByPages" theme="simple">
		<table>
			<tr>
				
					<td height="25">筛选条件:</td>
					<td height="25">所在类别:<select
						id="commodityclass.commodityClassId"
						name="commodityclass.commodityClassId">
							<option value="0">---请选择---</option>
							<c:forEach items="${requestScope.lstClass }" var="commodityclass">
								<option value="${commodityclass.commodityClassId }">${commodityclass.commodityClassName }</option>
							</c:forEach>
					</select></td>

					<td height="25">上架时间:自 <input type="text" name="begin"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						src="skin/datePicker.gif" width="16" height="22" /> 至 <input
						type="text" name="end" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>

					<td><s:submit id="btnSearch" name="btnSearch" value="立即查询" /></td>
				
			</tr>
		</table>
		</s:form>
		<table>
			<tr style="position: relative;">
				<td height="25">
                </td>
				<td>商品ID</td>
				<td>商品名称</td>
				<td>商品类别</td>
				<td>商品品牌</td>
				<td>商品描述</td>
				<td>商品原价</td>
				<td>商品现价</td>
				<td>商品数量</td>
				<td>商品余量</td>
				<td>商品上架时间</td>
				<td>商品图片</td>
				<td height="25">&nbsp;</td>
			</tr>

			<c:forEach items="${requestScope.commodityPage.list }"
				var="commodity">
				<tr>
					<td height="25"> <input type="checkbox" id="commodityIds" name="commodityIds" value="${commodity.commodityId }"/>
					</td>
					<td>${commodity.commodityId }</td>
					<td>${commodity.commodityName }</td>
					<td>${commodity.commodityclass.commodityClassName }</td>
					<td>${commodity.manufacturer }</td>
					<td width="150">${commodity.commodityDepict }</td>
					<td>${commodity.commodityPrice }</td>
					<td>${commodity.fcPrice}</td>
					<td>${commodity.commodityAmount }</td>
					<td>${commodity.commodityLeaveNum }</td>
					<td>${commodity.regTime }</td>
					<td style="position: relative;"><img
						onmouseover="showLargeImage(this)"
						onmouseout="hiddenLargeImage(this)" src="images/goodsimage/${commodity.image }"
						width="60" />
					<td height="25" width="30"><input type="button" id="btnEdit"
						name="btnEdit" value="编辑" onclick="javascript:location='/SSH04/preupdate_commodity.action?commodityId=${commodity.commodityId }';"/>&nbsp; <input type="button"
						id="btnDelete" name="btnDelete" value="删除"
						onclick="javascript:if(confirm('确定删除该商品吗？')){location='/SSH04/delete_commodity.action?commodityId=${commodity.commodityId }'};" />&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
		<table class="infobar">
			<tr>
				<td height="25">总共:${requestScope.commodityPage.totalRows} 条记录
					&nbsp; &nbsp; 当前:第${requestScope.commodityPage.currentPage}/
					${requestScope.commodityPage.totalPages}页 &nbsp; &nbsp; 请选择：第 <c:forEach
						begin="1" end="${requestScope.commodityPage.totalPages}" var="i">
                 &nbsp;<a
							href="/SSH04/commodity_findByPages.action?currentPage=${i }">${i }
						</a>&nbsp;
              </c:forEach>页
              <input type="button" value="全选" onclick="javascript:selectAllCheckBox('commodityIds');"/>&nbsp;
			<input type="button" value="反选" onclick="javascript:selectAllReverseCheckBox('commodityIds');"/>&nbsp;
			<input type="button" value="批量删除" onclick="javascript:delBatchClass('commodityIds');"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>