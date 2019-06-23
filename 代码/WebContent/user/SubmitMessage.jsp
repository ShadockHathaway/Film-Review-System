<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="submitMessage"%>
<title>留言板页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<%
String bookISBN=(String)session.getAttribute("bookISBN");
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
<center>
  <form action="SubmitMessage.jsp?bookISBN=bookISBN" name=form method="post" class="smart-green">
  <h1>输入您的影评
  <span>从电影中感悟生活。</span>
  </h1>
  <label>
  <textarea id="message" name="message" placeholder="Your Message to Us">
  </textarea></label>
  <label>
  <input type=submit class="button" value="提交">
  </label></form>
</center>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String message=request.getParameter("message");
  if((bookISBN!=null)) {
	  session.setAttribute(bookISBN+","+logname,bookISBN);
  }
  Date d = new Date();
  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String now = df.format(d);
%>
<submitMessage:SubmitMessage logname="<%=logname %>"
message="<%=message %>"
bookISBN="<%=bookISBN %>"
now="<%=now %>"/>
<div class="biao">
<center><p>返回的消息：<%=backMess %></center>
    <% 
	String bookNameLink="<a href=\"LookBookAbstract.jsp?bookISBN="+bookISBN+"\">返回电影页面</a>";
	out.println(bookNameLink);
	%>
</div>
</body>
</html>