<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="login"%>
<title>登录页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li><a href="index.jsp">网站主页</a></li>
        <li><a href="template.jsp">影片中心</a></li>
        <li><a href="LookArticle.jsp">影讯中心</a></li>
        <li><a href="Login.jsp">登录</a></li>
        <li><a href="Center.jsp">个人中心</a></li>
      </ul>
    </nav>
  </header>
  <article>
  <div id="content">
    <div class="login-header">
        <h3>用户登录</h3>
    </div>
    <form action="">
        <div class="login-input-box">
            <span class="icon icon-user"></span>
            <input type="text" placeholder="请输入您的用户名" name="logname"/>
        </div>
        <div class="login-input-box">
            <span class="icon icon-password"></span>
            <input type="password" placeholder="请输入您的密码" name="password"/>
        </div>
            <div class="login-button-box">
        <button>登录</button>
    </div>
    </form>
    <div class="logon-box">
        还没有账号，<a href="Register.jsp">点击注册</a>
    </div>
</div>
<link rel="stylesheet" media="screen" href="../css/normalize.css" />
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String logname=request.getParameter("logname");
        if(logname==null) {
    	    logname="";
        }
        String password=request.getParameter("password");
        if(password==null) {
    	    password="";
        }
    %>  <div id="biao">
    <link rel="stylesheet" media="screen" href="../css/table.css"/>
    <login:Login logname="<%=logname %>" password="<%=password %>"/>
    <center><p><%=backMess %>
    </center>
    </div>
    </article>
 </body>
 </html>