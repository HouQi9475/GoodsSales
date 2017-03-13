<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#container{
	 width:90%;
	 height:480px;
	 border-radius:5px;
	 background-color: #DDD;
	}
	#body{
		margin-bottom:0px;
		margin-left:0px;
		margin-right:0px;
		margin-top:0px;
	}
	#container #menu{
		list-style:none;
		padding-left:55px;
	}
	#container #menu #menuitem{
		font-size:13px;
		font-weight:bold;
		color: #585858;
		margin-bottom:5px;
		padding-top:10px;
		cursor:pointer;
	}
	#container #menu #splitLine{
		width:68%;
		border:1px solid #E1E1E1;
	}
	#container #menu .item{
		font-size:13px;
		font-weight:bold;
		color: #585858;
		margin-bottom:5px;
		cursor:pointer;
		width:120px;
		text-align:center;
		height:20px;
		padding-top:5px;
		
	}
	#container #menu .itemHover{
		font-size:13px;
		font-weight:bold;
		color: #585858;
		margin-bottom:5px;
		cursor:pointer;
		width:120px;
		text-align:center;
		height:20px;
		padding-top:5px;
		border-radius:5px;
		background-color: #EEE;

	}
#container #menu .itemSelected{
		font-size:13px;
		font-weight:bold;
		color: #FFFFFF;
		margin-bottom:5px;
		cursor:pointer;
		width:120px;
		text-align:center;
		height:20px;
		padding-top:5px;
		border-radius:5px;
		background-color: #2FBBFF;

	}
a{
	text-decoration:none;
}
</style>
<script type="application/javascript">
   function itemHover(obj){
	   if(obj.className!="itemSelected"){
	      obj.className="itemHover";
	   }
   }
   function itemOut(obj){
	   if(obj.className!="itemSelected"){
	         obj.className="item";
	     }
	   }
   function itemSelected(tabid){
	   var itemDivs=document.getElementsByName("item");
	   for(i=0;i<itemDivs.length;i++){
		     if(itemDivs[i].id=="item"+tabid){
				   itemDivs[i].className="itemSelected";
				 }else{
					 itemDivs[i].className="item";
					 }
		   }
	   
	   }
</script>
</head>
<body>
<div id="container">
		<ul id="menu">
			<li id="menuitem"><a href="/SSH04/admins_preadd.action" target="userManagerDisplay"><div name="item" id="item0" class="item"
					onMouseOver="javascript:itemHover(this)"
					onMouseOut="javascript:itemOut(this);"
					onClick="javascript:itemSelected(0);">添加管理员信息</div></a></li>
            <li><div id="splitLine"></div></li>
			<li id="menuitem"><a href="../modelFunctions/showadmins.jsp" target="userManagerDisplay"><div name="item" id="item1" class="item"
					onMouseOver="javascript:itemHover(this)"
					onMouseOut="javascript:itemOut(this);"
					onClick="javascript:itemSelected(1);">管理员信息管理</div></a></li>
                     <li><div id="splitLine"></div></li>
			<li id="menuitem"><a href="../modelFunctions/showusers.jsp" target="userManagerDisplay"><div name="item" id="item2" class="item"
					onMouseOver="javascript:itemHover(this)"
					onMouseOut="javascript:itemOut(this);"
					onClick="javascript:itemSelected(2);">用户信息管理</div></a></li>
                     <li><div id="splitLine"></div></li>
            
		</ul>
	</div>
</body>
</html>