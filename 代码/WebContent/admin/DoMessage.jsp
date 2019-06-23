<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminMessageByPage"%>
<title>影评管理页面</title>
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
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   String number=request.getParameter("page");
   String ISBN=request.getParameter("bookISBN");
   String deletedISBN=request.getParameter("deletedISBN");
   String logname=request.getParameter("logname");
   String tableName=ISBN+"board";
   if(number==null) {
	   number="1";
   }
%>
<div id="biao">
<link rel="stylesheet" media="screen" href="../css/board.css"/>
每页最多显示10条影评。
<adminMessageByPage:AdminMessageByPage dataSource="movieboard" 
tableName="<%=tableName %>" bookAmountlnPage="10" zuduanAmount="10" 
page="<%=number %>" bookISBN="<%=ISBN %>" deletedISBN="<%=deletedISBN %>"
logname="<%=logname %>"/>
共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br>
<center>
<%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table3.css"/>
<%
    int m=showPage.intValue();
%>
<a href="DoFilm.jsp?page=<%=m-1 %>">上一页</a>
<a href="DoFilm.jsp?page=<%=m+1 %>">下一页</a>
<form action="">
    输入页码:<input type=text name="page">
    <input type=submit value="提交">
</form>
</center>
  </article>
</div>
</body>
</html>
