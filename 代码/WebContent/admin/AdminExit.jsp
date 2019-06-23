<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminBookByPage"%>
<title>管理员退出登录</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li><a href="admin.jsp">管理员登陆</a></li>
        <li><a href="DoFilm.jsp">影片管理</a></li>
        <li><a href="DoArticle.jsp">影讯管理</a></li>
        <li><a href="DoUser.jsp">用户管理</a></li>
      </ul>
    </nav>
  </header>
 <article>
      <div id="biao">
      <% 
          String logname=(String)session.getAttribute("adminlogname");
          int m=logname.indexOf(",");
          logname=logname.substring(0,m);
          session.invalidate();
          out.print("<h2>"+logname+"退出</h2>");
      %>
      </div>
    <link rel="stylesheet" media="screen" href="../css/table.css"/>
  </article>
</div>
</body>
</html>
