<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">圖書管理&gt;&gt;</div>
</div>
		<div class="content">
			<table class="box">
			  <tbody><tr>
					<td class="field">圖書编号：</td>
					<td name="id">${book.id}

						<input type="hidden" id="bookid" value="{book.id}">
					</td>
				</tr>
			   <tr>
					<td class="field">书籍名称：</td>
					<td>${book.name}</td>
				</tr>
				 <tr>
					<td class="field">作者：</td>
					<td>${book.writer}</td>
				</tr>
				
			   <tr>
					<td class="field">出版社：</td>
					<td>${book.cbs}</td>
				</tr>
				 <tr>
					<td class="field">是否借出：</td>
						<td>
							<c:if test="${book.go=='1'}">是</c:if>
							<c:if test="${book.go=='2'}">否</c:if>
						</td>
				</tr>
			</tbody></table>
		</div>
		<div class="buttons">
			<div style="float: left;width: 200px">
			<form action="<%=request.getContextPath()%>/updateById.action" method="post">
			<input type="hidden" name="id" value="${book.id}">
			<input type="submit" name="update" id="update" value="修改" class="input-button">
			</form>
			</div>
			<div style="float: left;width: 200px">
			<form action="<%=request.getContextPath()%>/deleteById.action" method="post">
			<input type="hidden" name="id" value="${book.id}">
			<input type="submit" name="del" id="del" value="删除" class="input-button">
			</form>
			</div>
			<div style="float: left;width: 200px" >
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
			</div>
		</div>

</div>



</body></html>