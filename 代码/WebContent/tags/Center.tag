<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql;
  ResultSet rs;
  String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  try {
	con=DriverManager.getConnection(uri,uname,upassword);
	sql=con.createStatement();
	String s="select * from user where logname= '"+logname+"'";
	rs=sql.executeQuery(s);
	str.append("<table border=1>");
	while (rs.next()) {
		str.append("<tr>");
		str.append("<td id=\"a\">昵称</td>");
		str.append("<td id=\"b\">"+rs.getString("realname")+"</td>");
		str.append("</tr>");
		str.append("<tr>");
		str.append("<td id=\"a\">个性签名</td>");
		str.append("<td id=\"b\">"+rs.getString("address")+"</td>");
		str.append("</tr>");
		str.append("<tr>");
		str.append("<td id=\"a\">手机号</td>");
		str.append("<td id=\"b\">"+rs.getString("phone")+"</td>");
		str.append("</tr>");
		str.append("<tr>");
		str.append("<td id=\"a\">邮箱</td>");
		str.append("<td id=\"b\">"+rs.getString("email")+"</td>");
		str.append("</tr>");
	}
	str.append("</table>");
	jspContext.setAttribute("giveResult",str);
	con.close();
  }
  catch(SQLException exp) {
    jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
  }
%>