<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
request.setCharacterEncoding("GB2312");
String msg ="";
String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 
String  user="user";
String  pwd="123";
String num = request.getParameter("num");
String name = request.getParameter("name");
if(request.getMethod().equalsIgnoreCase("post")){
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(connectString,user, pwd);
	Statement stmt = con.createStatement();
	try{ 
		String fmt="insert into stu(num,name) values('%s', '%s')";
		String sql = String.format(fmt,num,name);
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0)msg = "保存成功!";
		stmt.close(); con.close();
	}
	catch (Exception e){
		msg = e.getMessage();
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	.container{
		position:absolute;
		left:50%;
	}
	form{
		line-height:80px;
	}
	
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>新增学生记录</title>
</head>
<body>
<div class="container">
			<h1>新增学生记录</h1>
			<form action="addStu.jsp" method="post" name="f">
				学号:<input id="num" name="num" type="text" ><br>
				姓名:<input id="name" type="text" name="name" ><br>
				<input type="submit" name="sub" value="保存">
			</form>
			<br>
			<a href='browseStu.jsp'>返回</a>
		</div>

</body>
</html>
