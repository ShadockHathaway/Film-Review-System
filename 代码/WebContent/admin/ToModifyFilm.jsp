<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyFilm"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getFilm"%>
<title>电影信息修改页面</title>
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
  String bookISBN=(String)session.getAttribute("bookISBN");

%>
<getFilm:GetFilm bookISBN="<%=bookISBN %>"/>
   <div class="form_con">
     <h3>修改影片信息</h3>
     <p>输入电影的信息</p>
     <form action="" name=form> 
       <label for="">影片名称:</label>
       <input type="text" name="bookName" placeholder="<%=oldbookName%>" value="<%=oldbookName%>" class="input_text"><br><br>
       <label for="">影片导演:</label>
       <input type="text" name="filmDirector" placeholder="<%=oldfilmDirector%>" value="<%=oldfilmDirector%>" class="input_text"><br><br>
       <label for="">影片演员:</label>
       <input type="text" name="bookAuthor" placeholder="<%=oldbookAuthor%>" value="<%=oldbookAuthor%>" class="input_text"><br><br>
       <label for="">制片地区:</label>
       <input type="text" name="bookPublish" placeholder="<%=oldbookPublish%>" value="<%=oldbookPublish%>" class="input_text"><br><br>
       <label for="">剧情摘要:</label>
       <textarea name="bookAbstract" cols="30" rows="30" placeholder="<%=oldbookAbstract%>" class="input_text2"><%=oldbookAbstract%></textarea><br><br>
       <label for="">影片封面文件路径:</label>
       <input type="text" name="bookPic" placeholder="<%=oldbookPic%>" value="<%=oldbookPic%>" class="input_text"><br><br>
       <input type="submit" name="enter" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
</center>
<%
  String bookName=request.getParameter("bookName");
  String filmDirector=request.getParameter("filmDirector");
  String bookAuthor=request.getParameter("bookAuthor");
  String bookPublish=request.getParameter("bookPublish");
  String bookAbstract=(String)session.getAttribute("bookAbstract");
  if (request.getParameter("bookAbstract")!=null&&request.getParameter("bookAbstract")!="") {
	  bookAbstract=request.getParameter("bookAbstract");
  }
  String bookPic=request.getParameter("bookPic");
  String enter=request.getParameter("enter");
  boolean ok=(enter!=null);
  if(ok) {
  %>
    <modifyFilm:ModifyFilm bookName="<%=bookName%>" filmDirector="<%=filmDirector%>"
    bookAuthor="<%=bookAuthor%>" bookPublish="<%=bookPublish%>" bookAbstract="<%=bookAbstract%>"
    bookPic="<%=bookPic%>"/>
    <center><h2><%=giveResult %></h2></center>
  <%}
%>
</div>
</article>
</body>
</html>