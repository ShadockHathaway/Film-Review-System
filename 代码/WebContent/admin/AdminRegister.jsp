<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="adminRegister"%>
<title>管理员注册页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li><a href="admin.jsp">管理员登陆</a></li>
        <li><a href="DoFilm.jsp">影片管理</a></li>
        <li><a href="DoArticle.jsp">影讯管理</a></li>
        <li><a href="DoUser.jsp">用户管理</a></li>
      </ul>
    </nav>
  </header>
  <article>
<center>
   <div class="form_con">
     <h3>注册账户</h3>
     <p>输入您的信息，带*号项必须填写。</p>
     <form action="" name=form> 
       <label for="">用户名:</label>
       <input type="text" name="logname" class="input_text">*<br>（只能包含字母和数字，且长度为4-10个字符之间）<br><br>
       <label for="">设置密码:</label>
       <input type="password" name="password" class="input_text">*<br>（只能包含字母和数字，且长度为4-10个字符之间）<br><br>
       <input type="submit" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String logname=request.getParameter("logname");
  String password=request.getParameter("password");
%>
<adminRegister:AdminRegister logname="<%=logname %>"
password="<%=password %>"/>
<center><div id="biao"><p>返回的消息：<%=backMess %></p></div></center>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</article>
</body>
</html>
