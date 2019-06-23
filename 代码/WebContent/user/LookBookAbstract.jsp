<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
<%@ taglib tagdir="/WEB-INF/tags" prefix="showMessage"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bookAbstract"%>
<title>电影摘要</title>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String bookISBN=request.getParameter("bookISBN");
    String logname=(String)session.getAttribute("logname");
    if(bookISBN!=null) {
    	session.setAttribute("bookISBN",bookISBN);
    }
    String bookiSBN=(String)session.getAttribute("bookISBN");
    if (logname!=null) {
    	  int m=logname.indexOf(",");
    	  logname=logname.substring(0,m);
    } else {
    	  response.sendRedirect("Login.jsp");
    }
  %>
    <bookAbstract:BookAbstract bookISBN="<%=bookiSBN %>" />
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
<div class="biao">
  <%=giveResult %>
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   String number=request.getParameter("page");
   String deletedISBN=request.getParameter("deletedISBN");
   if(number==null) {
	   number="1";
   }
%>
<br>每页最多显示10条留言
<bookAbstract:ShowMessage dataSource="movieboard" 
bookAmountlnPage="10" zuduanAmount="3" 
page="<%=number %>" deletedISBN="<%=deletedISBN %>"/>
<br>共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br></div>
<div class="wrap">
<%=giveResult1 %>
</div>
<link rel="stylesheet" media="screen" href="../css/table1.css"/>
<link rel="stylesheet" media="screen" href="../css/wrap.css"/>
<div class="biao">
<%
    int m=showPage.intValue();
%>
<form action="SubmitMessage.jsp?bookISBN=bookISBN" name=form method="post">
<input type=submit class="button" value="我也要写影评">
</form>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<br><a href="template.jsp?page=<%=m-1 %>">上一页</a>
<a href="template.jsp?page=<%=m+1 %>">下一页</a>
<form action="">
    输入页码:<input type=text name="page">
    <input type=submit value="提交">
</form>
</div></center></article>
</body>
</html>