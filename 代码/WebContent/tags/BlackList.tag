<%@ tag import="java.sql.*"%>
<%@ tag import="java.util.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="beletedISBN" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="price" variable-class="java.lang.Integer" scope="AT_END" %>
<%
int totalPrice=0;
int jishu=0;
String logname;
String phone;
String email;
String realname;
float bookPrice;
String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
String uname = "root";
String upassword = "movie199738M";
Connection con;
Statement sql,sqlb,sqla,sqlc,sqld,sqle;
ResultSet rs,rd;
StringBuffer str=new StringBuffer();
try {Class.forName("com.mysql.jdbc.Driver");}
catch (ClassNotFoundException e) {
  str.append(e);
}
  	String sqlStatement="select * from blacklist";
  	String sqlStatementb="INSERT INTO blacklist VALUES"+"("+"'"+beletedISBN+"')";
	String sqlStatementd="delete from blacklist where logname = '"+deletedISBN+"'";
	try {
  	  con=DriverManager.getConnection(uri,uname,upassword);
      if(beletedISBN != null) {
  	      sqla=con.createStatement();
  	      sqla.executeUpdate(sqlStatementb);}
      if (deletedISBN!=null) {
    	  sqlc=con.createStatement();
    	  sqlc.executeUpdate(sqlStatementd);
      }
  	  sqlb=con.createStatement();
  	  rs=sqlb.executeQuery(sqlStatement);
  	  str.append("<table border=1>");
  	  str.append("<tr>");
  	  str.append("<th>用户名</td>");
  	  str.append("<th>用户手机号</td>");
  	  str.append("<th>用户邮箱</td>");
  	  str.append("<th>用户昵称</td>");
  	  str.append("</tr>");
  	  while(rs.next()) {
  		  logname=rs.getString("logname");
  		  String sqlStatementf="select * from user where logname = '"+logname+"'";
  	      sqle=con.createStatement();
  	      rd=sqle.executeQuery(sqlStatementf);
  	      while(rd.next()){
  	    	totalPrice++;
  		    str.append("<tr>");
  		    logname=rd.getString("logname");
  		    phone=rd.getString("phone");
  		    email=rd.getString("email");
  		    realname=rd.getString("realname");
  		    str.append("<td>"+logname+"</td>");
  		    str.append("<td>"+phone+"</td>");
  		    str.append("<td>"+email+"</td>");
  		    str.append("<td>"+realname+"</td>");
  		    String del="<a href=\"BlackList.jsp?deletedISBN="+logname+"\">移出黑名单</a>";
  		    str.append("<td>"+del+"</td>");
  		    str.append("</tr>");}
  	      }
  	  con.close();
  	str.append("</table>");  
	}
  	catch(SQLException exp) {
  		str.append(exp);
  	}
jspContext.setAttribute("price",new Integer(totalPrice));
jspContext.setAttribute("giveResult",str);
%>