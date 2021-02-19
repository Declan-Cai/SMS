<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	body{
	background-color: #eee;
	}
	.block{
		width: 1300px;
		height: 50px;
		
		border-radius: 10px;
		margin: 0 auto;
	}
	h3{
		text-align: center;
		padding-top: 12px;
		font-family: "微软雅黑";
	}
</style>
</head>
<body>
	<div class="block">
		<%
			if((String)session.getAttribute("user")==null){
				out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='Login.html'</script>");
			}
		%>
		<h1 style="text-align:center">广州航海学院学生信息管理系统</h1>
	</div>
</body>
</html>