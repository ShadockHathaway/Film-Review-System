<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="getFilm"%>
<title>电影信息修改页面</title>
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
  String bookISBN=request.getParameter("bookISBN");

%>
<getFilm:GetFilm bookISBN="<%=bookISBN %>"/>
   <div class="form_con">
     <h3>影片信息</h3>
     <table border=1>
     <tr>
     <td id="a">影片编号</td><td id="b"><%=bookISBN%></td>
     </tr>
     <tr>
     <td id="a">影片名称</td><td id="b"><%=oldbookName%></td>
     </tr>
     <tr>
     <td id="a">影片导演</td><td id="b"><%=oldfilmDirector%></td>
     </tr>
     <tr>
     <td id="a">影片演员</td><td id="b"><%=oldbookAuthor%></td>
     </tr>
     <tr>
     <td id="a">制片地区</td><td id="b"><%=oldbookPublish%></td>
     </tr>
     <tr>
     <td id="a">剧情摘要</td><td id="b"><%=oldbookAbstract%></td>
     </tr>
     <tr>
     <td id="a">影片封面</td><td id="b"><center><image src=<%=oldbookPic%> width=140 height=200/></center></td>
     </tr></table>
     <link rel="stylesheet" media="screen" href="../css/table2.css"/>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
</div>
<br><center><a href="ToModifyFilm.jsp">
<button class="button">前往修改影片信息</button></a>
<a href="upload.jsp">
<button class="button">修改影片封面</button></a></center>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
</article>
</body>
</html>