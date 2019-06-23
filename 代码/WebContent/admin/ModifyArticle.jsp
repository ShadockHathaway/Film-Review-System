<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="getArticle"%>
<title>文章信息修改页面</title>
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
  <div id="biao">
<center>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  boolean isModify=false;
  String ISBN=request.getParameter("ISBN");
%>
<getArticle:GetArticle ISBN="<%=ISBN %>"/>
   <div class="form_con">
     <h3>影片信息</h3>
     <table border=1>
     <tr>
     <td id="a">文章编号</td><td id="b"><%=ISBN%></td>
     </tr>
     <tr>
     <td id="a">文章标题</td><td id="b"><%=oldtitle%></td>
     </tr>
     <tr>
     <td id="a">文章作者</td><td id="b"><%=oldauthor%></td>
     </tr>
     <tr>
     <td id="a">文章摘要</td><td id="b"><%=oldabstract%></td>
     </tr>
     <tr>
     <td id="a">文章封面</td><td id="b"><center><image src=<%=oldpic%> width=200 height=120/></center></td>
     </tr></table>
     <link rel="stylesheet" media="screen" href="../css/table2.css"/>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
</div>
<br><center><a href="ToModifyArticle.jsp">
<button class="button">修改文章信息</button></a>
<a href="bian.jsp">
<button class="button">修改文章内容</button></a>
<a href="upload.jsp">
<button class="button">修改文章封面</button></a></center>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
</article>
</body>
</html>