<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<%@ taglib tagdir="/WEB-INF/tags" prefix="article"%>
<title>电影信息录入页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname2=(String)session.getAttribute("adminlogname");
    if (logname2!=null) {
    	  int m=logname2.indexOf(",");
    	  logname2=logname2.substring(0,m);
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
<center>
   <div class="form_con">
     <h3>发布影讯</h3>
     <p>输入文章信息</p>
     <form action="" name=form> 
       <label for="">文章编号:</label>
       <input type="text" name="ISBN" class="input_text"><br><br>
       <label for="">文章标题:</label>
       <input type="text" name="title" class="input_text"><br><br>
       <label for="">文章作者:</label>
       <input type="text" name="author" class="input_text"><br><br>
       <label for="">文章摘要:</label>
       <textarea name="abst" cols="30" rows="30" class="input_text2"></textarea><br><br>
       <input type="submit" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String ISBN=request.getParameter("ISBN");
  String title=request.getParameter("title");
  String author=request.getParameter("author");
  String abst=request.getParameter("abst");
%>
<article:Article ISBN="<%=ISBN %>"
title="<%=title %>"
author="<%=author %>"
abst="<%=abst %>"/>
<center><div id="biao"><p>返回的消息：<%=backMess %></div><br>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</center></article>
</body>  
</html>  