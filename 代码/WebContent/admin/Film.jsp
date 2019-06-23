<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="film"%>
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
     <h3>录入影片</h3>
     <p>输入电影的信息</p>
     <form action="" name=form> 
       <label for="">影片编号:</label>
       <input type="text" name="bookISBN" class="input_text"><br><br>
       <label for="">影片名称:</label>
       <input type="text" name="bookName" class="input_text"><br><br>
       <label for="">影片导演:</label>
       <input type="text" name="filmDirector" class="input_text"><br><br>
       <label for="">影片演员:</label>
       <input type="text" name="bookAuthor" class="input_text"><br><br>
       <label for="">制片地区:</label>
       <input type="text" name="bookPublish" class="input_text"><br><br>
       <label for="">剧情摘要:</label>
       <textarea name="bookAbstract" cols="30" rows="30" class="input_text2"></textarea><br><br>
       <input type="submit" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String bookISBN=request.getParameter("bookISBN");
  String bookName=request.getParameter("bookName");
  String filmDirector=request.getParameter("filmDirector");
  String bookAuthor=request.getParameter("bookAuthor");
  String bookPublish=request.getParameter("bookPublish");
  String bookAbstract=request.getParameter("bookAbstract");
%>
<film:Film bookISBN="<%=bookISBN %>"
bookName="<%=bookName %>"
filmDirector="<%=filmDirector %>"
bookAuthor="<%=bookAuthor %>"
bookPublish="<%=bookPublish %>"
bookAbstract="<%=bookAbstract %>"/>
<center><div id="biao"><p>返回的消息：<%=backMess %></div></center></article>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</body>
</html>