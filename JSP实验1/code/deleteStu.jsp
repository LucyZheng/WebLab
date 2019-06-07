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
String pid = request.getParameter("pid");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(connectString,user, pwd);
Statement stmt = con.createStatement();
try{ 
	String fmt="delete from stu where id=%s";
	String sql = String.format(fmt,pid);
	int cnt = stmt.executeUpdate(sql);
	msg = "删除成功!";
	stmt.close(); con.close();
}
catch (Exception e){
	msg = e.getMessage();
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
<title>删除学生记录</title>
</head>
<body>
<div class="container">
			<h1>删除学生记录</h1>
			<br>
			<%=msg %>
			<a href='browseStu.jsp'>返回</a>
		</div>

</body>
</html>
