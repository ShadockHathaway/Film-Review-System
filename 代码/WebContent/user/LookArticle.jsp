<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="showArticleByPage"%>
<title>电影俱乐部影评系统</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
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
<%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   String number=request.getParameter("page");
   if(number==null) {
	   number="1";
   }
%><center>
<div id="biao">
<form action="FindArticle.jsp" name=form method="post">
<input type=submit class="button" value="查询影讯">
</form>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<br>每页最多显示6条影讯
<showArticleByPage:ShowArticleByPage dataSource="article" 
tableName="article" bookAmountlnPage="6" zuduanAmount="10" 
page="<%=number %>"/>
<br>共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br><br>
<%=giveResult %>
<link rel="stylesheet" media="screen" href="../css/table1.css"/>
<%
    int m=showPage.intValue();
%>
<a href="LookArticle.jsp?page=<%=m-1 %>">上一页</a>
<a href="LookArticle.jsp?page=<%=m+1 %>">下一页</a>
<form action="">
    输入页码:<input type=text name="page">
    <input type=submit value="提交">
</form></div>
</center>
  </article>
</body>
</html>