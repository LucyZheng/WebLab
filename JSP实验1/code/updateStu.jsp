<%@ page language="java" contentType="text/html; charset=GB18030"
	import="java.util.*,java.sql.*"
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
if (num==null) num="";
String name = request.getParameter("name");
if (name==null) name="";
String buttonupdate=request.getParameter("update");
String pid=request.getParameter("pid");
	try{ 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString,user, pwd);
		Statement stmt = con.createStatement();
		if(buttonupdate == null){
	 		ResultSet rs = stmt.executeQuery(String.format("select * from stu where id=%d",Integer.parseInt(pid)));
	 		if(rs.next()){
	 	        num = rs.getString("num");
	 	        name = rs.getString("name");
	 	    }
		}
		else{
			int cnt = stmt.executeUpdate(String.format("update stu set num='%s',name='%s' where id=%d",num,name,Integer.parseInt(pid)));
	 		if(cnt>0) msg = "修改成功!";
		}
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
<title>修改学生记录</title>
</head>
<body>
<div class="container">
			<h1>修改学生记录</h1>
			<form action="updateStu.jsp?pid=<%=pid%>" method="post">
				学号:	<input id="num" name="num" type="text" value=<%=num %> ><br>
				姓名:	<input id="name" type="text" name="name" value=<%=name %>><br>
				<input type="submit" name="update" value="修改">
				<%=msg %>
			</form>
			<a href='browseStu.jsp'>返回</a>
		</div>
</body>
</html>