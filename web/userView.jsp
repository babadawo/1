<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
			<div class="content">
				<table class="box"> 
					<tbody><tr>
						<td class="field">用户编号：</td>
						<td>${user.userid}
							<input type="hidden" id="userid" value="${user.userid}"></td>
						
					</tr>
					<tr>
						<td class="field">用户名：</td>
						<td>${user.username}</td>
					</tr>
					<tr>
						<td class="field">用户账号：</td>
						<td>${user.admin}</td>
					</tr>

					<tr>
						<td class="field">用户性别：</td>
						<td>

							<c:if test="${user.sex=='1'}"><c:out value="男"></c:out></c:if>
							<c:if test="${user.sex=='2'}"><c:out value="女"></c:out></c:if>
							
						</td>
					</tr>


					<tr>
						<td class="field">用户电话：</td>
						<td>${user.tel}
						</td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td>
							${user.adress}
						</td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>

						<td>
							<c:if test="${user.root=='1'}"><c:out value="管理员"></c:out></c:if>
							<c:if test="${user.root=='2'}"><c:out value="普通用户"></c:out></c:if>
							<c:if test="${user.root=='3'}"><c:out value="经理"></c:out></c:if>

						</td>
					</tr>
				</tbody></table>
			</div>
			<div class="buttons">
				<div  style="float: left;width: 100px"><form action="<%=request.getContextPath()%>/updateUserById1.action" method="post">
					<input type="hidden" name="userid" value="${user.userid}"/>
					<input type="submit" id="update" value="修改" class="input-button">
				</form></div>
				<div  style="float: left;width: 100px"> <form action="<%=request.getContextPath()%>/deleteUserById.action" method="post">
					<input type="hidden" name="userid" value="${user.userid}"/>
					<input type="submit" id="del" value="删除" class="input-button">
				</form></div>
				<div  style="float: left;width: 100px"><form action="<%=request.getContextPath()%>/updatePassWordById1.action" method="post">
					<input type="hidden" name="userid" value="${user.userid}"/>
					<input type="submit" id="repassword" value="重置密码" class="input-button">
				</form></div>
				<div  style="float: left;width: 100px"><form action="<%=request.getContextPath()%>/login.action" method="post">
					<input type="hidden" name="userid" value="${user.userid}"/>
					<input type="button" id="backButton" onclick="history.back(-1)" value="返回" class="input-button">
				</form></div>




			</div>
	</div>



</body></html>