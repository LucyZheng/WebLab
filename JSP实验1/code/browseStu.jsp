<%@ page language="java" 
import="java.util.*,java.sql.*"
contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    
<%
request.setCharacterEncoding("GB2312");
String msg ="";
Integer pgno = 0; //当前页号
Integer pgcnt = 4; //每页行数
String param = request.getParameter("pgno");
if(param != null && !param.isEmpty()){
pgno = Integer.parseInt(param);
}
param = request.getParameter("pgcnt");
if(param != null && !param.isEmpty()){
pgcnt = Integer.parseInt(param);
}
int pgprev = (pgno>0)?pgno-1:0;
int pgnext = pgno+1;
String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 
String  user="user";
String  pwd="123";
StringBuilder table=new StringBuilder("");
table.append("<table><tr> <th>id</th><th>学号</th><th>姓名</th><th>-</th> </tr>");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(connectString, "user", "123");
	Statement stmt=con.createStatement(); 
	String sql=String.format("select * from stu limit %d,%d",
			pgno*pgcnt,pgcnt);
	ResultSet rs=stmt.executeQuery(sql);
	String name,id,stuid;
	while(rs.next()){
		id=rs.getString("id");
		name=rs.getString ("name");
		stuid=rs.getString("num");
		table.append("<tr><td>"+id+"</td>"+"<td>"+stuid+"</td>"+"<td>"+name+"</td>");
		table.append("<td><a href='updateStu.jsp?pid="+id+"'>修改"+"  "+"</a><a href='deleteStu.jsp?pid="+id+"'>删除</a></tr>");
	}
	
	rs.close(); 
	stmt.close(); 
	con.close();
	table.append("</table>");
}
catch (Exception e){
	msg = e.getMessage();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
		table {
			width:500px;
			border-collapse:collapse
		}
		#a1{
			text-align:center;
			position:absolute;
			left:38%;
			top:20%
		
		}
		#a2{
			position:absolute;
			left:80%;
			top:50%
		}
		h1{
			position:absolute;
			left:50%
		}
		td,th{
			border:solid 1px black;
			width : 10rem;
			height : 2rem;
		}
		
		
	</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>浏览名单</title>
</head>
<body>
<h1>浏览名单</h1>
<div id="a1"><%=table%><br><br><div><a href="addStu.jsp" >新增</a></div><br><br></div>
<div id="a2">
<a href="browseStu.jsp?pgno=<%=pgprev%>&pgcnt=<%=pgcnt%>">上一页</a>
<a href="browseStu.jsp?pgno=<%=pgnext%>&pgcnt=<%=pgcnt%>">下一页</a>
</div>
<br><br>
</body>
</html>
