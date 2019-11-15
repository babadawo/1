﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>

	</div>
	<form action="<%=request.getContextPath()%>/updateUserById2.action" method="post" enctype="multipart/form-data">
		<input type="hidden" name="method" value="update">
		<div class="content">
			<font color="red"></font><table class="box">
			<tbody><tr>
					<td class="field">用户编号：</td>
					<td>
						<input type="hidden" name="Id" value="${userid}">
						<input type="text" name="userid" value="${user.userid}"/>
					</td>

				</tr>
			<tr>
					<td class="field">用户账号：</td>
					<td>
						<input type="text" value="${user.admin}" name="admin"/>
						<font color="red">*</font><font color="red" id="name_span"></font></td>
				</tr>
				<tr>
					<td class="field">用户性别：</td>
					<td><select name="sex" id="gender">
						    <option value="1" checked="">男</option>
						    <option value="2">女</option>
						 </select></td>
			</tr>

				<tr>
					<td class="field">用户电话：</td>
					<td><input type="text" name="tel" class="text" id="phone" value="111"> <font color="red">*</font><font color="red" id="phone_span"></font></td>

				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><input name="adress" id="address" class="text" value=""></td>
				</tr>
				<tr>
					<td class="field">用户权限：</td>

					<td><input type="radio" name="root" value="1">管理员<input type="radio" name="root" value="2" checked="true">普通用户
					<input type="radio" name="root" value="3">经理</td>
				</tr>
			<tr>
				<td>
					<c:if test="${user.headpath}!=null"><img src="/pic/${user.headpath}" /></c:if>

					<input name="picturename" type="file"/>
				</td>
			</tr>
			</tbody></table>
		</div>
		<div class="buttons">
			<input type="submit" name="update" id="update" value="修改" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button"> 
		</div>

	</form>
</div>



</body></html>