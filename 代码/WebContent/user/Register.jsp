<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="register"%>
<title>注册页面</title>
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
        <li><a href="Login.jsp">登录</a></li>
        <li><a href="Center.jsp">个人中心</a></li>
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
       <label for="">用户昵称:</label>
       <input type="text" name="realname" class="input_text">*<br>（长度不能超过8个字符）<br><br>
       <label for="">电子邮件:</label>
       <input type="text" name="email" class="input_text"><br><br>
       <label for="">联系电话:</label>
       <input type="text" name="phone" class="input_text"><br><br>
       <label for="">个性签名:</label>
       <textarea name="address" cols="30" rows="30" class="input_text2"></textarea><br><br>
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
  String email=request.getParameter("email");
  String realname=request.getParameter("realname");
  String phone=request.getParameter("phone");
  String address=request.getParameter("address");
%>
<register:Register logname="<%=logname %>"
password="<%=password %>"
email="<%=email %>"
realname="<%=realname %>"
phone="<%=phone %>"
address="<%=address %>"/>
<center><div id="biao"><p>返回的消息：<%=backMess %></p></div></center>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
</article>
</body>
</html>