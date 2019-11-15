<%@ page contentType="text/html;charset=UTF-8" language="java" %><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">图书管理&gt;&gt;</div>
	</div>
	<form action="<%=request.getContextPath()%>/updatebook2.action" method="post">
		<input type="hidden" name="method" value="update">
		<input type="hidden" name="billId" id="billId" value="6">
		<div class="content">
			<table class="box">
			   <tbody><tr>
					<td class="field">书籍名称：</td>
					<td><input type="text" name="bookname" class="text" id="productName" value="西游记">
						<font color="red">*</font><font color="red" id="productName_span"></font></td>
				</tr>
				 <tr>
					<td class="field">作者：</td>
					<td><input type="text" name="bookwriter" class="text" id="productUnit" value="">
						<font color="red">*</font><font color="red" id="productUnit_span"></font></td>
				</tr>
				
			   <tr>
					<td class="field">出版社：</td>
					<td>
						<input type="text" name="cbs"/>
						<font color="red">*</font><font color="red" id="proId_span"></font>
					</td>
				</tr>

			</tbody></table>
		</div>
		<div class="buttons">
			<input type="hidden" value="${bookid}" name="bookid">
			<input type="submit" name="update" id="update" value="保存" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button"> 
		</div>

	</form>
</div>
<script type="text/javascript" src="js/bill/update.js"></script>


</body></html>