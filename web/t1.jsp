<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/18
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>



书名：<input type="text" name="name"/>
作者：<input type="text" name="writer" >
<input type="button" value="搜索" name="abc">

<div>
    <table>
        <thead>
        <tr>
            <td>书名</td>
            <td>出版社</td>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>


<script type="text/javascript">
    $(function () {
        // console.log("123456");
        $("input[name=abc]").on("click",function () {
            var name=$("input[name=name]");
            var writer=$("input[name=writer]");
            var data={"name":name.val(),"writer":writer.val()}
            console.log(data);
            $.ajax({
                url:"<%=request.getContextPath()%>/soushu.action",
                data:JSON.stringify(data),
                dataType:"json",
                type:"post",
                contentType:"application/json",
                success:function (d) {
                    $("tbody").empty();
                    for(var i=0;i<d.length;i++){
                        $("tbody").append("<tr><td>"+d[i].name+"</td><td>"+d[i].cbs+"</td></tr>")
                    }
                }
            })
        })
    })
</script>
</body>
</html>
