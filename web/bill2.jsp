
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>图书管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
	<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div class="menu">

		<table>
			<tbody>
				<tr>
					<td><form action="<%=request.getContextPath()%>/bill2.action" method="post">
							<input name="method" value="query" class="input-text" type="hidden"> 
							书籍名称：<input name="name" class="input-text" type="text" value="${name}">
							作者：<input name="writer" class="input-text" type="text" value="${writer}">

							是否借出：<input type="radio" name="go" value="1" <c:if test="${go==1}">checked</c:if>>
									是<input type="radio" name="go" value="0" <c:if test="${go==0}">checked</c:if>>否
							<input value="查 询" type="submit">
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">

		<div class="optitle clearfix">
			
			<div class="title">借阅管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<tbody>
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
					</tr>

					<c:forEach items="#{pageInfo.list}" var="item">
						<tr>
							<td>${item.id}</td>
							<td><a href="#" name="bookview">${item.name}</a></td>
							<td>${item.writer}</td>
							<td>${item.cbs}</td>
							<td><c:if test="${item.go=='1'}"><c:out value="是"></c:out></c:if>
								<c:if test="${item.go!='1'}"><c:out value="否"></c:out></c:if></td>
							<td>
								<c:if test="${item.go!='1'}"><form action="<%=request.getContextPath()%>/borrow.action?page=${pageInfo.pageNum}&name=${name}&writer=${writer}&go=${go}" method="post">
									<input  name="jieyue" type="submit" value="借阅" class="input-button">
									<input type="hidden" name="bookid" value="${item.id}"/>
								</form></c:if>
								<c:if test="${item.go=='1'}"><input  type="button" value="借阅" class="input-button-disabled"></c:if>
							</td>
						</tr>
					</c:forEach>


				</tbody>
			</table>

			<center>
				<div >
					当前为第<span>${pageInfo.pageNum}</span>页 &nbsp;&nbsp;
					一共有<span>${pageInfo.pages}</span>页 &nbsp;&nbsp;
					<c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
					<c:if test="${pageInfo.isFirstPage==false}">
						<a href="<%=request.getContextPath()%>/bill2.action?page=${pageInfo.prePage}&name=${name}&writer=${writer}&go=${go}" >上一页</a>&nbsp;
						<%--<a href="#" name="pre"> <span>${name}</span>上一页</a>--%>
					</c:if>
					<c:if test="${pageInfo.isLastPage==false}">
						<a href="<%=request.getContextPath()%>/bill2.action?page=${pageInfo.nextPage}&name=${name}&writer=${writer}&go=${go}">下一页</a>
						<%--<a href="#" name="next"> <span>${name}</span>下一页</a>--%>
					</c:if>
					<c:if test="${pageInfo.isLastPage==true}">下一页</c:if>


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