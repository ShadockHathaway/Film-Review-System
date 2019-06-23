<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="message" required="true" %>
<%@ attribute name="bookISBN" required="true" %>
<%@ attribute name="now" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<% boolean boo=true;
   String rname="";
   String raddress="";
   String rlogname=logname;
   if(message==null) {
	   boo=false;
   }
   if(boo) {
	   try { Class.forName("com.mysql.jdbc.Driver");}
	   catch(ClassNotFoundException e) {
	       out.print(e);
	   }
	   Connection con;
	   Statement sql,sqlb,sqlc,sqla,sqld;
	   ResultSet rs;
	   String condition="INSERT INTO "+bookISBN+"board VALUES";
	   String conditiona="use movieboard";
	   String conditionb="use userboard";
	   String conditionc="INSERT INTO "+rlogname+"board VALUES";
	   String s="select * from user where logname= '"+logname+"'";
	   try {
	       String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	 	   String uname = "root";
		   String upassword = "movie199738M";
	       con=DriverManager.getConnection(uri,uname,upassword);
	       sql=con.createStatement();
		   rs=sql.executeQuery(s);
		   while (rs.next()) {
		   raddress = rs.getString("address");
		   rname = rs.getString("realname");}
		   condition+="("+"'"+rname;
		   condition+="','"+now;
		   condition+="','"+message;
		   condition+="','"+raddress;
		   condition+="','"+rlogname+"')";
		   conditionc+="("+"'"+now;
		   conditionc+="','"+message;
		   conditionc+="','"+bookISBN+"')";
	       sqla=con.createStatement();
	       sqla.executeUpdate(conditiona);
	       sqlc=con.createStatement();
	       sqlc.executeUpdate(condition);
	       sqlb=con.createStatement();
	       sqlb.executeUpdate(conditionb);
	       sqld=con.createStatement();
	       sqld.executeUpdate(conditionc);
	       con.close();
	       String mess=rname+"留言成功";
	       jspContext.setAttribute("backMess",mess);
	       session.setAttribute("bookISBN",bookISBN);
	       con.close();
	   }
	   catch(Exception e) {
	       jspContext.setAttribute("backMess","留言失败");
	   }
   } else {
	   jspContext.setAttribute("backMess","留言不能为空");
   }
 %>