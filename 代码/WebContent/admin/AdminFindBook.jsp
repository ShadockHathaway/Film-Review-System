<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminFindBook"%>
<title>管理员查询电影页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname=(String)session.getAttribute("adminlogname");
    if (logname!=null) {
    	  int m=logname.indexOf(",");
    	  logname=logname.substring(0,m);
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
  <div id="biao">
<center>
  <form action="">
             输入查询内容:<input type=text name="findContent" value="java">
    <Select name="condition" size=1>
      <Option Selected value="bookName">电影名称
      <Option value="bookISBN">电影编号
    </Select><br>
    <input type=submit value="提交">
  </form>
  <%
    String findContent=request.getParameter("findContent");
    String condition=request.getParameter("condition");
    String findMethod=request.getParameter("findMethod");
    if (findContent==null) {
    	findContent="";
    }
    if (condition==null) {
    	condition="";
    }
    if (findMethod==null) {
    	findMethod="";
    }
  %>
  <br>查询到的电影:
  <adminFindBook:AdminFindBook dataSource="bookshop" tableName="bookForm" 
  findContent="<%=findContent %>" condition="<%=condition %>"
  findMethod="<%=findMethod %>"/>
  <br><%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</center>
</div>
</article>
</body>
</html>