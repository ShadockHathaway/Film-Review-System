<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="center"%>
<title>个人中心</title>
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
    <center:Center logname="<%=logname %>" />
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
  <div id="biao">
<center>
<a href="LookPurchase.jsp">
    <button class="button">查看收藏片单</button></a>
<a href="LookMessage.jsp">
    <button class="button">查看我发布的影评</button></a>
<a href="ModifyRegister.jsp">
    <button class="button">修改个人信息</button></a>
<a href="ModifyPassword.jsp">
    <button class="button">修改密码</button></a>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
</center>
</div><br>
  <center><div id="aiao"><h3>个人信息</h3><%=giveResult %></div></center>
<link rel="stylesheet" media="screen" href="../css/table2.css"/>
</article>
</body>
</html>
