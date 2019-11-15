<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">密码修改&gt;&gt;
			</div>
		</div>
		<form action="<%=request.getContextPath()%>/updatepwd.action" method="post">
			<div class="content">
				<table class="box">
					 <tr>
					<td class="field">旧密码：</td>
					<td><input type="password" name="oldPassword" class="text" id="oldPassword"  />
						<font color="red">*</font><font color="red" id="password_span"></font>
					</td>
				</tr>
				 <tr>
					<td class="field">新密码：</td>
					<td><input type="password" name="newPassword" class="text" id="newPassword"  />
						<font color="red">*</font>
					</td>
					 <span><c:if test="${msg}!=null">${msg}</c:if></span>
				</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="submit" id="update" value="修改" class="input-button" />
			</div>
		</form>
	</div>

<script >

</script>
</body>

</html>
