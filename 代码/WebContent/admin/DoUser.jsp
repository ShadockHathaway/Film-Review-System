<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminUserByPage"%>
<title>用户管理页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String logname=(String)session.getAttribute("adminlogname");
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
每页最多显示10名用户。
<adminUserByPage:AdminUserByPage dataSource="bookshop" 
tableName="user" bookAmountlnPage="10" zuduanAmount="10" 
page="<%=number %>"/>
共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br>
<form action="BlackList.jsp" name=form method="post">
<input type=submit class="button" value="查看黑名单">
</form>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<center>
<%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
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
