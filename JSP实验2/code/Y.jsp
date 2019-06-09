<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<% 
String course = (String)session.getAttribute("course"); 
String sid= session.getId(); 
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session Y</title>
</head>
<body>
  <h1>Session Y</h1>
  sessionID:<%= sid%><br>
  course:<%= course %><br>
  <a href=X.jsp>X.jsp</a> <br>
  <a href=Z.jsp>Z.jsp</a>
</body>
</html>