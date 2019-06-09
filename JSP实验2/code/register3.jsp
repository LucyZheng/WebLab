<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String submit1 = request.getParameter("submit1");
String submit2 = request.getParameter("submit2");
String name = request.getParameter("name");
String method = request.getMethod();
String stuid = request.getParameter("stuid");
String grade = request.getParameter("grade");
String grades[]= {"","","",""};
String[] values={"","",""};
String explain = request.getParameter("explain");
String campuss[]= {"","","","",""};
String campus = request.getParameter("campus");
String password = request.getParameter("password");
String clubs[]= {"","",""};
boolean post = method.equalsIgnoreCase("post");
if (name==null )name="";
if (name!="") name += "*";
if(stuid==null) stuid="";
if(password==null) password="";
if(campus==null) campus="";

if(campus.equals("north")) campuss[0] = "checked";
else if(campus.equals("south")) campuss[1] = "checked";
else if(campus.equals("east")) campuss[2] = "checked";
else if(campus.equals("zhuhai")) campuss[3] = "checked";
else if(campus.equals("shenzhen")) campuss[4] = "checked";

if(grade==null) grade="";
if(grade.equals("freshman")) grades[0] = "selected";
else if(grade.equals("sophomore")) grades[1] = "selected";
else if(grade.equals("junior")) grades[2] = "selected";
else if(grade.equals("senior")) grades[3] = "selected";

if(request.getMethod().equalsIgnoreCase("post")) values = request.getParameterValues("club");
if (values!=null)
for(int i = 0 ; i < values.length ; i++)
  if(values[i].equals("dance"))
    clubs[0] = "checked";
  else if(values[i].equals("photo"))
    clubs[1] = "checked";
  else if(values[i].equals("basketball"))
    clubs[2] = "checked";

if(explain==null) explain=""; 
if (explain!="") explain += "*";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册</title>
  </head>  
  <body>
  <form action="register3.jsp" method="post">
		<input type="hidden" name="stuid" value="16337327" />
		同学名: <input type="text" id="txt1" name="name" value="<%=name%>" onfocus="disapear(this)"/>
		<br><br>
		密码：<input type="password" name="password" value="<%=password%>"/><br>
		校区: 
			北校区<input type="radio" name="campus" value="north"  <%=campuss[0]%>/>
                        南校区<input type="radio" name="campus" value="south"<%=campuss[1]%>/>
                        东校区<input type="radio" name="campus" value="east"<%=campuss[2]%>/>
			深圳校区<input type="radio" name="campus" value="shenzhen"<%=campuss[3]%>/>
                        珠海校区<input type="radio" name="campus" value="zhuhai"<%=campuss[4]%>/><br>
		年级：<select name="grade">
				<option value="freshman"<%=grades[0]%>>大一</option>
				<option value="sophomore"<%=grades[1]%>>大二</option>
				<option value="junior"<%=grades[2]%>>大三</option>
				<option value="senior"<%=grades[3]%>>大四</option>
			 </select>	<br>   
               社团 :
                       舞蹈队<input type="checkbox" name="club" value="dance"<%=clubs[0]%>/>
                       摄影<input type="checkbox" name="club" value="photo"<%=clubs[1]%>/>
                       篮球<input type="checkbox" name="club" value="basketball"<%=clubs[2]%>/><br>
               说明:<br><textarea rows="5" cols="30" name="explain" ><%=explain%></textarea>
          <input type="submit" name="submit1" value="保存" />
          <input type="submit" name="submit2" value="退出" />
          
 
  </form>
  
  </body>
</html>