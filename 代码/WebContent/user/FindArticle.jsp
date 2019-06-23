<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="findArticle"%>
<title>查询影讯页面</title>
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
        <li><a href="template.jsp">影片中心</a></li>
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
             输入查询关键字:<input type=text name="findContent" value="电影">
    <input type=submit value="提交">
  </form>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String findContent=request.getParameter("findContent");
    if (findContent==null) {
    	findContent="";
    }
  %>
  <br>查询到的影讯:
  <findArticle:FindArticle dataSource="article" tableName="article" 
  findContent="<%=findContent %>"/>
  <br><%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table1.css"/>
</center>
</div>
</article>
</body>
</html>