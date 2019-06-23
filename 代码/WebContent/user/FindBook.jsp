<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="findBook"%>
<title>查询电影页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname=(String)session.getAttribute("logname");
    if (logname!=null) {
    	  int m=logname.indexOf(",");
    	  logname=logname.substring(0,m);
    } else {
    	  response.sendRedirect("Login.jsp");
    }
  %>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li><a href="index.jsp">网站主页</a></li>
        <li><a href="template.jsp">影片中心</a></li>
        <li><a href="LookArticle.jsp">影讯中心</a></li>
        <li>
        <% String logname1=(String)session.getAttribute("logname");
           if (logname1==null) {
               out.print("<a href=\"Login.jsp\">登录</a>");
           } else {
        	   out.print("<a href=\"ExitLogin.jsp\">退出登录</a>");
           }
        %>
        </li>
        <li><a href="">个人中心</a></li>
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
      <Option value="bookAuthor">电影演员
      <Option value="filmDirector">电影导演
      <Option value="bookPublish">电影制片地区
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
  <findBook:FindBook dataSource="bookshop" tableName="bookForm" 
  findContent="<%=findContent %>" condition="<%=condition %>"
  findMethod="<%=findMethod %>"/>
  <br><%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</center>
</div>
</article>
</body>
</html>