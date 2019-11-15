<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="js/jquery-3.4.1.min.js"></script>
<title>超市账单管理系统-账单管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>

	<div class="menu">
		<table>
			<tbody>
				<tr>
					<td><form action="<%=request.getContextPath()%>/billlist.action" method="post">
							<input name="method" value="query" class="input-text" type="hidden"> 
						书籍名称：<input name="name" class="input-text" type="text" value="${name}">
							作者：<input name="writer" class="input-text" type="text" value="${writer}">

							是否借出：
									<input type="radio" name="go" value="1" <c:if test="${go==1}">checked</c:if>>是
									<input type="radio" name="go" value="0" <c:if test="${go==0}">checked</c:if>>否
							<input value="查 询" type="submit">
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">

		<div class="optitle clearfix">
			<em><input value="添加图书" class="input-button" onclick="window.location='billAdd.jsp'" type="button">
			</em>
			<div class="title">图书管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<thead>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">图书编号</div>
						</td>
						<td width="80"><div class="STYLE1" align="center">书籍名称</div>
						</td>
						<td width="80"><div class="STYLE1" align="center">作者</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">出版社</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">是否借出</div>
						</td>
						<td width="100"><div class="STYLE1" align="center">图书管理</div>
						</td>
						
						<td width="100"><div class="STYLE1" align="center">借阅人</div>
						</td>
					</tr>
				</thead>
					<tbody>
					<c:forEach items="${billlist.list}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><a href="#" name="bookview">${item.name}</a></td>
							<td>${item.writer}</td>
							<td>${item.cbs}</td>
							<td><c:if test="${item.go=='1'}"><c:out value="是"></c:out></c:if>
								<c:if test="${item.go=='0'}"><c:out value="否"></c:out></c:if>
							</td>
							<td >
								<div style="float: left;width: 50px">
								<form action="<%=request.getContextPath()%>/deletebook.action?page=${billlist.pageNum}&name=${name}&writer=${writer}&go=${go}" method="post" >
									<input type="submit" value="删除" class="input-button"  <c:if test="${item.go=='1'}"> style="display: none" </c:if>>
									<input type="hidden" name="bookid" value="${item.id}">
								</form>
								</div>

								<div style="float: left;width: 50px">
								<form action="<%=request.getContextPath()%>/updatebook1.action" method="post">
									<input type="submit" value="修改" class="input-button"  <c:if test="${item.go=='1'}"> style="display: none" </c:if>>
									<input type="hidden" name="bookid" value="${item.id}">
								</form>
								</div>
							</td>
<%--							<td><c:forEach items="${users}" var="i">${i.username}</c:forEach></td>--%>
							<td>${item.user.username}</td>
						</tr>
					</c:forEach>

					</tbody>
			</table>
			<center>
				<div >
					当前为第<span>${billlist.pageNum}</span>页 &nbsp;&nbsp;
					一共有<span>${billlist.pages}</span>页 &nbsp;&nbsp;
					<c:if test="${billlist.isFirstPage==true}">上一页</c:if>
					<c:if test="${billlist.isFirstPage==false}">
						<%--<a href="<%=request.getContextPath()%>/billlist.action?page=${billlist.prePage}" >上一页</a>&nbsp;--%>
						<a href="<%=request.getContextPath()%>/billlist.action?page=${billlist.prePage}&name=${name}&writer=${writer}&go=${go}" >上一页</a>&nbsp;
						<%--<a href="#" name="pre"> <span>${name}</span>上一页</a>--%>
					</c:if>
					<c:if test="${billlist.isLastPage==false}">
						<%--<a href="<%=request.getContextPath()%>/billlist.action?page=${billlist.nextPage}">下一页</a>--%>
						<a href="<%=request.getContextPath()%>/billlist.action?page=${billlist.nextPage}&name=${name}&writer=${writer}&go=${go}">下一页</a>
						<%--<a href="#" name="next"> <span>${name}</span>下一页</a>--%>
					</c:if>
					<c:if test="${billlist.isLastPage==true}">下一页</c:if>


				</div></center>

		</div>
	</div>
	<script>
		$(function () {
			var a =$("a");
			a.on("click",function () {
				for (var i = 0; i < a.length; i++) {
					var id=$(this)[i].parentNode.parentNode.children[0].innerHTML;
					if($(this)[i].name=="bookview"){
						location.href="bookview.action?id=" + id;
					}
			}
			})
		})
	</script>
</body></html>