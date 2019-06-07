<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>40个随机数</title>
</head>
<body>
<h1>40个随机数</h1>
<%
	int n;
	for (int i=0;i<40;i++){
		n = (int)(Math.random()*999);
		out.println(n);	
	}
%>
</body>
</html>