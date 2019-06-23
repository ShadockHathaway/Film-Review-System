<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>退出登录页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li><a href="index.jsp">网站主页</a></li>
        <li><a href="template.jsp">影片中心</a></li>
        <li><a href="LookArticle.jsp">影讯中心</a></li>
        <li><a href="Login.jsp">登录</a></li>
        <li><a href="">个人中心</a></li>
      </ul>
    </nav>
  </header>
  <article>
      <div id="biao">
      <% 
          String logname=(String)session.getAttribute("logname");
          int m=logname.indexOf(",");
          logname=logname.substring(0,m);
          session.invalidate();
          out.print("<h2>"+logname+"退出</h2>");
      %>
      </div>
    <link rel="stylesheet" media="screen" href="../css/table.css"/>
  </article>
</body></html>