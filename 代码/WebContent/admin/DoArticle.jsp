<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminArticleByPage"%>
<title>文章管理页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    String deletedISBN=request.getParameter("deletedISBN");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname=(String)session.getAttribute("adminlogname");
    out.println(logname);
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
   String number=request.getParameter("page");
   if(number==null) {
	   number="1";
   }
%>
<div id="biao">
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<a href="Article.jsp">
<button class="button">发布新影讯</button></a>
<a href="BlackArticle.jsp">
<button class="button">查看隐藏影讯</button></a><br>
每页最多显示10条影讯。
<adminArticleByPage:AdminArticleByPage dataSource="article" 
tableName="article" bookAmountlnPage="10" zuduanAmount="10" 
page="<%=number %>" deletedISBN="<%=deletedISBN %>"/>
共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br>
<center>
<%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
<%
    int m=showPage.intValue();
%>
<a href="DoArticle.jsp?page=<%=m-1 %>">上一页</a>
<a href="DoArticle.jsp?page=<%=m+1 %>">下一页</a><br>
<form action="">
    输入页码:<input type=text name="page">
    <input type=submit value="提交">
</form>
</center>
  </article>
</div>
</body>
</html>
