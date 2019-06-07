<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
  request.setCharacterEncoding("GB2312");
  String msg ="";
  String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
          + "?autoReconnect=true&useUnicode=true"
          + "&characterEncoding=UTF-8"; 
  String id = request.getParameter("sel");
  if (id == null) id = "";
  String buttonsel = request.getParameter("sub");
  StringBuilder table=new StringBuilder("");
  table.append("<table>");
  table.append("<tr><th>id</th><th>学号</th><th>姓名</th><th>-</th></tr></tr>");
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, 
                   "user", "123");
    Statement stmt=con.createStatement();
    if (buttonsel == null) {
        ResultSet rs = stmt.executeQuery("select * from stu");
        while(rs.next()) {
        	table.append("<tr><td>"+rs.getString("id") + "</td><td>"+ rs.getString("num") + "</td><td>"+rs.getString("name") + "</td>");
        	table.append("<td>" + "<a href='updateStu.jsp?pid=" + rs.getString("id") + "'>修改</a> " + "<a href='deleteStu.jsp?pid=" + rs.getString("id") + "'>删除</a></td></tr>");
        }
        rs.close();
    }
    else {
        ResultSet rs = stmt.executeQuery("select * from stu where num like '%" + id + "%' or name like '%" + id +"%'");
        while(rs.next()) {
        	table.append("<tr><td>"+rs.getString("id") + "</td><td>"+ rs.getString("num") + "</td><td>"+rs.getString("name") + "</td>");
        	table.append("<td>" + "<a href='updateStu.jsp?pid=" + rs.getString("id") + "'>修改</a> " + "<a href='deleteStu.jsp?pid=" + rs.getString("id") + "'>删除</a></td></tr>");
        }
        rs.close();
    }
    stmt.close();
    con.close();
  }
  catch (Exception e){
    msg += e.getMessage();
  }
  table.append("</table>");
%><!DOCTYPE HTML>
<html>
<head>
<style>
  
  .container {
  	position:absolute;
  	left:500px;
    width: 500px;
    text-align: center;
  }
  table {
    border-collapse: collapse;
  }
  td, th {
    border: solid 1px black;
    width: 15rem;
    height: 2rem;
  }
</style>
<title>查询学生名单</title>
</head>
<body>
  <div class="container">
    <h1>查询学生名单</h1>
    <form action="queryStu.jsp" method="post" name="f">
    输入查询：<input id="sel" name="sel" type="text" value="<%=id%>">
    <input type="submit" name="sub" value="查询"><br><br>
    </form>  
    <div><%=table%></div><br><br>  
    <div style="float:left">
      <a href="addStu.jsp">新增</a>
      <a href="browseStu.jsp">返回</a>
    </div><br><br>
  </div>
</body>
</html>
