<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
<%@ taglib tagdir="/WEB-INF/tags" prefix="lookPurchase"%>
<title>查看收藏片单</title>
</head>
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
        <li><a href="Center.jsp">个人中心</a></li>
      </ul>
    </nav>
  </header>
  <article>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  boolean isAdd=false;
  String logname=(String)session.getAttribute("logname");
  if (logname!=null) {
	  int m=logname.indexOf(",");
	  logname=logname.substring(0,m);
	  isAdd=true;
  } else {
	  response.sendRedirect("Login.jsp");
  }
  String buyISBN=request.getParameter("buyISBN");
  if((buyISBN!=null)&&isAdd) {
	  session.setAttribute(buyISBN+","+logname,buyISBN);
  }
  String deletedISBN=request.getParameter("deletedISBN");
  if((deletedISBN!=null)&&isAdd) {
	  session.removeAttribute(deletedISBN+","+logname);
  }
%>
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   String number=request.getParameter("page");
   if(number==null) {
	   number="1";
   }
%>
  <div id="biao">
  <lookPurchase:LookPurchase logname="<%=logname %>" deletedISBN="<%=deletedISBN %>"
  buyISBN="<%=buyISBN %>"/>
  <h2>你共标记“看过”<%=price %>部电影：</h2>
  <br><%=giveResult %>
  <link rel="stylesheet" media="screen" href="../css/table.css"/>
  </div>
</article>
</center>
</body>
</html>