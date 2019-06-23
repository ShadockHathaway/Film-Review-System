<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="blackList"%>
<title>黑名单用户页面</title>
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
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String beletedISBN=request.getParameter("beletedISBN");
  String deletedISBN=request.getParameter("deletedISBN");
%>
  <div id="biao">
  <blackList:BlackList beletedISBN="<%=beletedISBN %>" deletedISBN="<%=deletedISBN %>"/>
  <h2>黑名单共有<%=price %>名用户：</h2>
  <br><%=giveResult %>
  <link rel="stylesheet" media="screen" href="../css/table.css"/>
  </div>
 </article>
</body>
</html>
