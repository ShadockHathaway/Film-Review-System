<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib tagdir="/WEB-INF/tags" prefix="modifyRegister"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getRegister"%>
<title>修改注册信息</title>
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
<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  boolean isModify=false;
  String logname=(String)session.getAttribute("logname");
  String realname1=(String)session.getAttribute("realname");
  String phone1=(String)session.getAttribute("phone");
  String address1=(String)session.getAttribute("address");
  String email1=(String)session.getAttribute("email");
  if (logname!=null) {
	  int m=logname.indexOf(",");
	  logname=logname.substring(0,m);
	  isModify=true;
  } else {
	  response.sendRedirect("Login.jsp");
  }
%>
<getRegister:GetRegister logname="<%=logname %>"/>
   <div class="form_con">
     <h3>修改个人信息</h3>
     <p>输入您的信息，带*号项必须填写。</p>
     <form action="" name=form> 
       <label for="">电子邮件:</label>
       <input type="text" name="email" class="input_text" placeholder="<%=email1%>">*<br><br>
       <label for="">用户昵称:</label>
       <input type="text" name="realname" class="input_text" placeholder="<%=realname1%>">*<br><br>
       <label for="">联系电话:</label>
       <input type="text" name="phone" class="input_text" placeholder="<%=phone1%>">*<br><br>
       <label for="">个性签名:</label>
       <textarea name="address" cols="30" rows="30" class="input_text2" placeholder="<%=address1%>"></textarea><br><br>
       <input type="submit" name="enter" value="提交" class="m180">
       <input type="reset" value="重置" class="m180">
       </form>
<link rel="stylesheet" media="screen" href="../css/register.css"/></div>
</center>
<%
  String address=address1;
  String realname=realname1;
  String phone=phone1;
  String email=email1;
  String enter=request.getParameter("enter");
  if (request.getParameter("email")!="") {
	  email=request.getParameter("email");
  }
  if (request.getParameter("realname")!="") {
	  realname=request.getParameter("realname");
  }
  if (request.getParameter("phone")!="") {
	  phone=request.getParameter("phone");
  }
  if (request.getParameter("address")!="") {
	  address=request.getParameter("address");
  }
  boolean ok=(enter!=null);
  if(ok&&isModify) {
  %>
    <modifyRegister:ModifyRegister logname="<%=logname%>" email="<%=email%>"
    phone="<%=phone%>" address="<%=address%>" realname="<%=realname%>"/>
    <center><h2><%=giveResult %></h2></center>
  <%}
%>
</center>
</div>
</article>
</body>
</html>