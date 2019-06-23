<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<% boolean boo,aoo,coo=true;
   String regex = "^[a-z0-9A-Z]+$";
   String mess="";
   if(logname!=null&&logname!="") {
       if(logname.matches(regex)) {
    	   boo=true;
       } else {
    	   boo=false;
       }
       if(logname.length()<=10&&logname.length()>=4) {
    	   boo=true;
       } else {
    	   boo=false;
       }
   } else {
	   boo=false;
   }
   if(password!=null&&password!="") {
       if(password.matches(regex)) {
    	   aoo=true;
       } else {
    	   aoo=false;
       }
       if(password.length()<=10&&password.length()>=4) {
    	   aoo=true;
       } else {
    	   aoo=false;
       }
   } else {
	   aoo=false;
   }
   if(boo&&aoo) {
	   try { Class.forName("com.mysql.jdbc.Driver");}
	   catch(ClassNotFoundException e) {
	       out.print(e);
	   }
	   Connection con;
	   Statement sql,sqlb,sqlc,sqld,sqle;
	   ResultSet rs;
	   String condition="INSERT INTO admin VALUES";
	   condition+="("+"'"+logname;
	   condition+="','"+password+"')";
	   try {
	       String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	 	   String uname = "root";
		   String upassword = "movie199738M";
	       con=DriverManager.getConnection(uri,uname,upassword);
		   sql=con.createStatement();
		   sql.executeUpdate(condition);
		   mess=logname+"注册成功";
	       jspContext.setAttribute("backMess",mess);
	       con.close();
	   }
	   catch(Exception e) {
	       jspContext.setAttribute("backMess","没有填写用户名或用户名已经被注册");
	   }
   } else {
	   jspContext.setAttribute("backMess","注册失败！没有按规定填写用户名/密码。");
   }
 %>