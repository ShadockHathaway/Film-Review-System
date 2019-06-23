<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="bookISBN" required="true" %>
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
	String s="select * from bookForm where bookISBN= '"+bookISBN+"'";
	rs=sql.executeQuery(s);
	str.append("<table border=1>");
	str.append("<tr>");
	str.append("<th>电影封面</td>");
	str.append("<th>电影名</th>");
	str.append("<th>摘要</th>");
	str.append("</tr>");
	while (rs.next()) {
		str.append("<tr>");
		String pic="<image src="+rs.getString("bookPic")+" width=70 height=100/>";
		str.append("<td>"+pic+"</td>");
		str.append("<td>"+rs.getString("bookName")+"</td>");
		str.append("<td>"+rs.getString("bookAbstract")+"</td>");
		str.append("</tr>");
	}
	str.append("</table>");
	if (bookISBN!=null) {
	session.setAttribute("bookISBN",bookISBN);}
	jspContext.setAttribute("giveResult",str);
	con.close();
  }
  catch(SQLException exp) {
    jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
  }
%>