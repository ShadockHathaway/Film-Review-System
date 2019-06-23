<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyPassword"%>
<title>修改密码</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
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
  <div id="biao">
<center>
   <div class="form_con">
     <h3>请输入您当前的密码和新密码：</h3><br>
     <form action="" method="post">
       <label for="">当前密码：</label>
       <input type="password" name="oldPassword" class="input_text"><br><br>
       <label for="">新密码：:</label>
       <input type="password" name="newPassword" class="input_text"><br><br>
       <input type="submit" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
<%
  boolean isModify=false;
  String logname=(String)session.getAttribute("logname");
  if (logname!=null) {
    int m=logname.indexOf(",");
    logname=logname.substring(0,m);
    isModify=true;
  } else {
    response.sendRedirect("Login.jsp");
  }
  String oldPassword=request.getParameter("oldPassword");
  String newPassword=request.getParameter("newPassword");
  boolean ok=oldPassword!=null&&newPassword!=null;
  if (ok&&isModify) {
  %>
  <modifyPassword:ModifyPassword logname="<%=logname %>"
    oldPassword="<%=oldPassword %>"
    newPassword="<%=newPassword%>"/>
    <center><h2><%=giveResult %></h2></center>
  <%}%>
</center>
</div>
</article>
</body>
</html>