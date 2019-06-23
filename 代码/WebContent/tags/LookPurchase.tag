<%@ tag import="java.sql.*"%>
<%@ tag import="java.util.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="buyISBN" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%@ variable name-given="price" variable-class="java.lang.Integer" scope="AT_END" %>
<%
int totalPrice=0;
int jishu=0;
String bookISBN;
String bookName;
String bookPublish;
float bookPrice;
String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
String uname = "root";
String upassword = "movie199738M";
Connection con;
Statement sql,sqlb,sqla,sqlc,sqld,sqle,sqlf,sqlg;
ResultSet rs,rd,rb;
StringBuffer str=new StringBuffer();
try {Class.forName("com.mysql.jdbc.Driver");}
catch (ClassNotFoundException e) {
  str.append(e);
}
  	String sqlStatement="select * from "+logname+"isbn";
  	String sqlStatementa="use userisbn";
  	String sqlStatementb="INSERT INTO "+logname+"isbn VALUES"+"("+"'"+buyISBN+"')";
	String sqlStatementc="select count(*) as ct from "+logname+"isbn where ISBN = '"+buyISBN+"'";
	String sqlStatementd="delete from "+logname+"isbn where ISBN = '"+deletedISBN+"'";
	String conditionc="select count(*) as dt from "+logname+"isbn";
	try {
  	  con=DriverManager.getConnection(uri,uname,upassword);
  	  sql=con.createStatement();
  	  sql.executeUpdate(sqlStatementa);
      PreparedStatement ps = con.prepareStatement(sqlStatementc);
      ResultSet Judge = ps.executeQuery();
      Judge.next();
      int ct = Judge.getInt("ct");
      if(ct == 0&&buyISBN != null) {
  	      sqla=con.createStatement();
  	      sqla.executeUpdate(sqlStatementb);}
      if (deletedISBN!=null) {
    	  sqlc=con.createStatement();
    	  sqlc.executeUpdate(sqlStatementd);
      }
  	  sqlb=con.createStatement();
  	  rs=sqlb.executeQuery(sqlStatement);
      PreparedStatement pss = con.prepareStatement(conditionc);
      ResultSet Judgee = pss.executeQuery();
      Judgee.next();
      int dt = Judgee.getInt("dt");
  	  if (dt==0) {
  	  	  str.append("还未标记已经看过电影，赶快去<a href=\"template.jsp\">浏览影片</a>标记吧！");
  	  } else {
  	  str.append("<table border=3>");
  	  str.append("<th>电影封面</td>");
  	  str.append("<th>电影名</th>");
  	  str.append("<th></th>");
  	  while(rs.next()) {
  		  bookISBN=rs.getString("ISBN");
  		  String sqlStatemente="use bookshop";
  	      sqld=con.createStatement();
  	      sqld.executeUpdate(sqlStatemente);
  		  String sqlStatementf="select * from bookform where bookISBN = '"+bookISBN+"'";
  	      sqle=con.createStatement();
  	      rd=sqle.executeQuery(sqlStatementf);
  	      String sqlStatementg="select * from blackform where bookISBN = '"+bookISBN+"'";
	      sqlg=con.createStatement();
	      rb=sqlg.executeQuery(sqlStatementg);
	      if(!rb.next()) {
  	      while(rd.next()){
  	    	totalPrice++;
  		    str.append("<tr>");
  		    String pic="<image src="+rd.getString("bookPic")+" width=70 height=100/>";
  		    str.append("<td id=\"ppic\">"+pic+"</td>");
  		    String bookname=rd.getString("bookName");
  		    String bookNameLink="<a href=\"LookBookAbstract.jsp?bookISBN="+bookISBN+"\">"+bookname+"</a>";
  		    str.append("<td>"+bookNameLink+"</td>");
  		    String del="<a href=\"LookPurchase.jsp?deletedISBN="+bookISBN+"\">删除</a>";
  		    str.append("<td>"+del+"</td>");
  		    str.append("</tr>");}
  	      }}
  	  con.close();
  	}
  	str.append("</table>");  
	}
  	catch(SQLException exp) {
  		str.append(exp);
  	}
jspContext.setAttribute("price",new Integer(totalPrice));
jspContext.setAttribute("giveResult",str);
%>