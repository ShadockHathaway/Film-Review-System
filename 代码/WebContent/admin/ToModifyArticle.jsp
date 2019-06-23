<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyArticle"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getArticle"%>
<title>文章信息修改页面</title>
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
  <div id="biao">
<center>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String ISBN=(String)session.getAttribute("ISBN");

%>
<getArticle:GetArticle ISBN="<%=ISBN %>"/>
   <div class="form_con">
     <h3>修改文章信息</h3>
     <p>输入文章的信息</p>
     <form action="" name=form> 
       <label for="">文章标题:</label>
       <input type="text" name="title" placeholder="<%=oldtitle%>" value="<%=oldtitle%>" class="input_text"><br><br>
       <label for="">文章作者:</label>
       <input type="text" name="author" placeholder="<%=oldauthor%>" value="<%=oldauthor%>" class="input_text"><br><br>
       <label for="">文章摘要:</label>
       <textarea name="abst" cols="30" rows="30" placeholder="<%=oldabstract%>" class="input_text2"><%=oldabstract%></textarea><br><br>
       <input type="submit" name="enter" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
</center>
<%
  String title=request.getParameter("title");
  String author=request.getParameter("author");
  String abst=request.getParameter("abst");
  String enter=request.getParameter("enter");
  boolean ok=(enter!=null);
  if(ok) {
  %>
    <modifyArticle:ModifyArticle title="<%=title%>" author="<%=author%>"
    abst="<%=abst%>"/>
    <center><h2><%=giveResult %></h2></center>
  <%}
%>
</div>
</article>
</body>
</html>