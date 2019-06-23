<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="showMessage"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bookAbstract"%>
<title>影讯详情</title>
</head>
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
<div id="bg">
<div id="bga">
<% String ISBN=request.getParameter("ISBN");
   String aaa="../html/"+ISBN+".jsp";
%><jsp:include page="<%=aaa%>" flush="true"/></div></div>
<link rel="stylesheet" media="screen" href="../css/bg.css"/></article>
</body>
</html>