<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="getFilm"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getArticle"%>
<title>图片上传页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  boolean isModify=false;
  String bookISBN=(String)session.getAttribute("bookISBN");
  String ISBN=(String)session.getAttribute("ISBN");
  String logname2=(String)session.getAttribute("adminlogname");
    if (logname2!=null) {
    	  int m=logname2.indexOf(",");
    	  logname2=logname2.substring(0,m);
    } else {
    	  response.sendRedirect("admin.jsp");
    }
  %>
<getFilm:GetFilm bookISBN="<%=bookISBN %>"/>
<getArticle:GetArticle ISBN="<%=ISBN %>"/>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li>
        <% String logname1=(String)session.getAttribute("adminlogname");
           if (logname1==null) {
               out.print("<a href=\"admin.jsp\">管理员登录</a>");
           } else {
        	   out.print("<a href=\"AdminExit.jsp\">退出登录</a>");
           }
        %></li>
        <li><a href="DoFilm.jsp">影片管理</a></li>
        <li><a href="DoArticle.jsp">影讯管理</a></li>
        <li><a href="DoUser.jsp">用户管理</a></li>
      </ul>
    </nav>
  </header>
    <article>
<center><div id="biao">
需要更改的原图片为：
<%
String AF=(String)session.getAttribute("AorF");
if (AF == "F") {
%>
<br><image src=<%=oldbookPic%> width=140 height=200/>
<%} else {%>
<br><image src=<%=oldpic%> width=200 height=120/><%} %>
<p>文件将被上传到C:\Users\admin\eclipse-workspace\tushuguan\image 中。
<p>选择将要上传的图像照片文件（名字不可以含有非ASCII码字符，比如汉字等）：
<br><form action="../helpUpload" method="post" ENCTYPE="multipart/form-data">
  <input type=FILE name="fileName" size="40"><br><br>
  <input type="submit" name="g" value="提交">
</form><link rel="stylesheet" media="screen" href="../css/table2.css"/></div>
</center></article>
</body>
</html>