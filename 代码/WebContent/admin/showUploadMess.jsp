<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="getFilm"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getArticle"%>
<%@ page import="mybean.data.UploadFile"%>
<jsp:useBean id="upFile" type="mybean.data.UploadFile" scope="request"/>
<title>图片上传页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  boolean isModify=false;
  String bookISBN=(String)session.getAttribute("bookISBN");
  String ISBN=(String)session.getAttribute("ISBN");
  String logname2=(String)session.getAttribute("adminlogname");
    if (logname2!=null) {
    	  int m=logname2.indexOf(",");
    	  logname2=logname2.substring(0,m);
    } else {
    	  response.sendRedirect("admin.jsp");
    }
  %>
<getFilm:GetFilm bookISBN="<%=bookISBN %>"/>
<getArticle:GetArticle ISBN="<%=ISBN %>"/>
<body>
<article>
<center><div id="biao">
<br>
更改后的图片为：
<%
String AF=(String)session.getAttribute("AorF");
if (AF == "F") {
%>
<br><image src=<%=oldbookPic%> width=700 height=1000/>
<%} else {%>
<br><image src=<%=oldpic%> width=1000 height=600/><%} %>
</div></center></article>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</body>
</html>