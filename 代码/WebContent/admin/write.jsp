<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="tom.jiafei.WriteFile" %>
<jsp:useBean id="writeFile" class="tom.jiafei.WriteFile" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<title>文章存储页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname2=(String)session.getAttribute("adminlogname");
    if (logname2!=null) {
    	  int m=logname2.indexOf(",");
    	  logname2=logname2.substring(0,m);
    } else {
    	  response.sendRedirect("admin.jsp");
    }
  %>
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
<center>
<div id="biao">
  <br>复制HTML内容并粘贴到这里：<br>
  <form action="" name=form> 
  <textarea name="fileContent" Rows="50" Cols="100"></textarea>
  <br><input type=submit value="提交" class="m180">
</form>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String filePath="C:/Users/admin/eclipse-workspace/tushuguan/WebContent/html";
  String fileContent1="<%@" + "page "+"pageEncoding=" + "\"UTF-8\""+"%"+">"+request.getParameter("fileContent");
  String aISBN=(String)session.getAttribute("aISBN");
  String fileName=aISBN+".jsp";
%>
    <jsp:setProperty name="writeFile" property="filePath" value="<%=filePath %>"/>
    <jsp:setProperty name="writeFile" property="fileName" value="<%=fileName %>"/>
    <jsp:setProperty name="writeFile" property="fileContent" value="<%=fileContent1 %>"/>
    <br>
    <a href="upload.jsp">
<button class="button">上传文章封面</button></a>
    <br>你写文件到目录：
    <jsp:getProperty name="writeFile" property="filePath"/>
    <br>文件的名字是：
    <jsp:getProperty name="writeFile" property="fileName"/>
    <br>文件的内容是：
    <jsp:getProperty name="writeFile" property="fileContent"/>
  <link rel="stylesheet" media="screen" href="../css/table.css"/>
  <link rel="stylesheet" media="screen" href="../css/register.css"/>
  <link rel="stylesheet" media="screen" href="../css/board.css"/>
  </div>
</center></article>
</body>
</html>