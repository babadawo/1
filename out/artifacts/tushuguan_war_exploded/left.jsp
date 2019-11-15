<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>超市账单管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link type="text/css" rel="stylesheet" href="css/style.css" />

<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function logout() {
			top.location = "logout.action";}
	</script>
</head>
<body class="frame-bd">
	<ul class="left-menu">

		<%--图书管理--%>
		<li <c:if test="${user.root!='1'}"> style="display: none" </c:if>
		><a target="mainFrame" name="billlist" href="billlist.action"><img
				src="images/btn_bill.gif" />
		</a>
		</li>
			<%--//图书借阅--%>
			<li><a href="bill2.action" target="mainFrame"><img
					src="images/btn_jieyue.gif" />
			</a>
			</li>
			<%--//用户管理--%>
			<li  <c:if test="${user.root!='1'}"> style="display: none" </c:if>   >

				<a href="userlist.action" target="mainFrame"><img
					src="images/btn_users.gif" />
			</a>
			</li>

			<%--//密码修改--%>
			<li><a href="updatePwd.jsp" target="mainFrame"><img
					src="images/btn_password.gif" />
			</a>
			</li>

			<%--//退出系统--%>
			<li><a href="#" onclick="logout()"><img
					src="images/btn_exit.gif" />
			</a>

				<%--//用jquery--%>
			</li>
	</ul>

</body>
</html>
