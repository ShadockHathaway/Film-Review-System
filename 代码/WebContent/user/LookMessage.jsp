<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookMessage"%>
<title>网站主页</title>
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
        <li><a href="Center.jsp">个人中心</a></li>
      </ul>
    </nav>
  </header>
  <article>
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   String deletedISBN=request.getParameter("deletedISBN");
   String bookISBN=request.getParameter("bookISBN");
%>
<center>
<div id="biao">
<lookMessage:LookMessage dataSource="userboard" 
bookISBN="<%=bookISBN %>" deletedISBN="<%=deletedISBN %>"/>
<div class="wrap">
<%=giveResult1 %></div>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
<link rel="stylesheet" media="screen" href="../css/table1.css"/>
<link rel="stylesheet" media="screen" href="../css/wrap.css"/>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
</center>
</article>
</div>
</body>
</html>