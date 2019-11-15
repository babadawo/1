<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>超市账单管理系统-用户管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
	<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div class="menu">

		<table>
			<tbody>
				<tr>
					<td><form action="<%=request.getContextPath()%>/userlist.action" method="post">
							<input name="method" value="query" class="input-text" type="hidden">
						用户名：<input name="username" class="input-text" type="text" value="${name}">&nbsp;&nbsp;&nbsp;&nbsp;
							<input value="查 询" type="submit">
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">

		<div class="optitle clearfix">
			<em>
				<form action="<%=request.getContextPath()%>/toadduser.action" method="post" >
					<input value="添加用户" class="input-button" onclick="window.location='userAdd.html'" type="submit">
				</form>
			</em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<tbody>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">编号</div>
						</td>
						<td width="80"><div class="STYLE1" align="center">用户名</div>
						</td>
						<td width="80"><div class="STYLE1" align="center">用户账号</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">性别</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">电话</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">权限</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">头像</div>
						</td>
					</tr>
					
					<c:forEach items="${pageInfo.list}" var="item">
						<tr>
							<td>${item.userid}</td>
							<td><a href="#" name="userview">${item.username}</a></td>
							<td>${item.admin}</td>
							<td><c:if test="${item.sex=='1'}">男</c:if>
								<c:if test="${item.sex=='2'}">女</c:if></td>
							<td>${item.tel}</td>
							<td><c:if test="${item.root=='1'}">管理员</c:if>
								<c:if test="${item.root=='2'}">普通用户</c:if>
								<c:if test="${item.root=='3'}">经理</c:if></td>
							<td><c:if test="${item.headpath!=null}">
								<img src="/pic/${item.headpath}" width="100px" height="100px"/>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
	<center>
	<div >
		当前为第<span>${pageInfo.pageNum}</span>页 &nbsp;&nbsp;
		一共有<span>${pageInfo.pages}</span>页 &nbsp;&nbsp;
		<c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
		<c:if test="${pageInfo.isFirstPage==false}">
			<a href="<%=request.getContextPath()%>/userlist.action?page=${pageInfo.prePage}&username=${name}" >上一页</a>&nbsp;
			<%--<a href="#" name="pre"> <span>${name}</span>上一页</a>--%>
		</c:if>
		<c:if test="${pageInfo.isLastPage==false}">
			<a href="<%=request.getContextPath()%>/userlist.action?page=${pageInfo.nextPage}&username=${name}">下一页</a>
			<%--<a href="#" name="next"> <span>${name}</span>下一页</a>--%>
		</c:if>
		<c:if test="${pageInfo.isLastPage==true}">下一页</c:if>


	</div></center>

	<script>
		$(function () {
			var a =$("a");
			a.on("click",function () {
				for (var i = 0; i < a.length; i++) {
					var id=$(this)[i].parentNode.parentNode.children[0].innerHTML;

					if($(this)[i].name=="userview"){
						location.href="userview.action?id=" + id;
					}
				}
			})
		})


	</script>
</body></html>