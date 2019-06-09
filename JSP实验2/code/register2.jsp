<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String exit=request.getParameter("submit2");
	if (exit!=null) response.sendRedirect("http://172.18.187.6/");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册输入显示</title>
  </head>  
  <body>
		ID: <%= request.getParameter("stuid") %><br>
		同学名: <%= request.getParameter("name") %><br>
		密码: <%= request.getParameter("password") %><br>
		校区: <%= request.getParameter("campus") %><br>
		社团：
		<% 
			out.print("[");
			String[] clubs=null;
			if(request.getMethod().equalsIgnoreCase("post")) clubs = request.getParameterValues("club");
			if (clubs!=null) for(int i = 0; i < clubs.length ; i++) out.print("  " + clubs[i]);
			out.print("]");
			out.println("");
        %><br>
		年级: <%= request.getParameter("grade") %><br>
		说明: <%= request.getParameter("explain") %><br>
		method（表单的提交方法）: <%= request.getMethod() %><br>
		submit1（保存）:<%= request.getParameter("submit1") %><br>
		submit2（退出）:<%= request.getParameter("submit2") %><br>
  </body>
</html>