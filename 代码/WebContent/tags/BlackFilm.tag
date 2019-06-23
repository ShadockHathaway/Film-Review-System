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
String isbn;
String name;
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
  	String sqlStatement="select * from blackform";
  	String sqlStatementb="INSERT INTO blackform VALUES"+"("+"'"+beletedISBN+"')";
	String sqlStatementd="delete from blackform where bookISBN = '"+deletedISBN+"'";
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
  	  str.append("<th>电影编号</td>");
  	  str.append("<th>电影名称</td>");
  	  str.append("</tr>");
  	  while(rs.next()) {
  		  isbn=rs.getString("bookISBN");
  		  String sqlStatementf="select * from bookform where bookISBN = '"+isbn+"'";
  	      sqle=con.createStatement();
  	      rd=sqle.executeQuery(sqlStatementf);
  	      while(rd.next()){
  	    	totalPrice++;
  		    str.append("<tr>");
  		    isbn=rd.getString("bookISBN");
  		    name=rd.getString("bookName");
  		    str.append("<td>"+isbn+"</td>");
  		    str.append("<td>"+name+"</td>");
  		    String buy="<a href=\"ModifyFilm.jsp?bookISBN="+isbn+"\">修改信息</a>";
  		    str.append("<td>"+buy+"</td>");
      	    String dell="<a href=\"DoMessage.jsp?bookISBN="+isbn+"\">影评管理</a>";
      	    str.append("<td>"+dell+"</td>");
  		    String del="<a href=\"BlackFilm.jsp?deletedISBN="+isbn+"\">取消隐藏</a>";
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