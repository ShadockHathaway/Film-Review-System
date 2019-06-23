<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
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
   if(realname!=null&&realname!="") {
       if(realname.length()<=8) {
    	   coo=true;
       } else {
    	   coo=false;
       }
   } else {
	   coo=false;
   }
   if(boo&&aoo&coo) {
	   try { Class.forName("com.mysql.jdbc.Driver");}
	   catch(ClassNotFoundException e) {
	       out.print(e);
	   }
	   Connection con;
	   Statement sql,sqlb,sqlc,sqld,sqle;
	   ResultSet rs;
	   String condition="INSERT INTO user VALUES";
	   String conditiona="use userisbn";
	   String conditionb="create table "+logname+"isbn"+"("+"ISBN varchar(45) not null"+")";
	   String conditionc="select count(*) as ct from user where realname = '"+realname+"'";
	   String conditiond="select count(*) as dt from user where phone = '"+phone+"'";
	   String conditione="select count(*) as et from user where email = '"+email+"'";
	   String conditionf="use userboard";
	   String conditiong="create table "+logname+"board"+"("+"mtime VARCHAR(45) not null"+","+"mmessage TEXT not null"+","+"mISBN VARCHAR(45) not null"+")";
	   condition+="("+"'"+logname;
	   condition+="','"+password;
	   condition+="','"+phone;
	   condition+="','"+email;
	   condition+="','"+address;
	   condition+="','"+realname+"')";
	   try {
	       String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	 	   String uname = "root";
		   String upassword = "movie199738M";
	       con=DriverManager.getConnection(uri,uname,upassword);
	       PreparedStatement ps = con.prepareStatement(conditionc);
	       ResultSet Judge = ps.executeQuery();
	       Judge.next();
	       int ct = Judge.getInt("ct");
	       PreparedStatement psd = con.prepareStatement(conditiond);
	       ResultSet Judged = psd.executeQuery();
	       Judged.next();
	       int dt = Judged.getInt("dt");
	       PreparedStatement pse = con.prepareStatement(conditione);
	       ResultSet Judgee = pse.executeQuery();
	       Judgee.next();
	       int et = Judgee.getInt("et");
	       if(ct == 0) {
	    	   if(dt == 0) {
	    		   if(et == 0) {
		               sql=con.createStatement();
		               sql.executeUpdate(condition);
		               sqlc=con.createStatement();
		               sqlc.executeUpdate(conditiona);
		               sqlb=con.createStatement();
		               sqlb.executeUpdate(conditionb);
		               sqld=con.createStatement();
		               sqld.executeUpdate(conditionf);
		               sqle=con.createStatement();
		               sqle.executeUpdate(conditiong);
		               con.close();
		               mess=logname+"注册成功";
	    		   } else {
	    			   mess="注册失败！此邮箱已被占用！";
	    		   }
	    	   } else {
	    		   mess="注册失败！此手机号已被占用！";
	    	   }
		   } else {
			   mess="注册失败！此昵称已被占用！";
	       }
	       jspContext.setAttribute("backMess",mess);
	       con.close();
	   }
	   catch(Exception e) {
	       jspContext.setAttribute("backMess","没有填写用户名或用户名已经被注册");
	   }
   } else {
	   jspContext.setAttribute("backMess","注册失败！没有按规定填写用户名/密码/昵称。");
   }
 %>