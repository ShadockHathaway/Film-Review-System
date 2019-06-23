<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="findContent" required="true" %>
<%@ attribute name="condition" required="true" %>
<%@ attribute name="findMethod" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  String logname=(String)session.getAttribute("logname");
  int mm=logname.indexOf(",");
  logname=logname.substring(0,mm);
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  Connection con;
  Statement sql,sqla,sqlb,sqld,sqlc;
  ResultSet rs,rd,rb;
  String b = ""+findContent;
  StringBuffer queryResult=new StringBuffer();
  String uri="jdbc:mysql://localhost:3306/"+dataSource;
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    sql=con.createStatement();
    String s="";
    s="select * from "+tableName+" where "+condition+" Like'%"+b+"%'";
    rs=sql.executeQuery(s);
    queryResult.append("<table border=1>");
    queryResult.append("<tr>");
    queryResult.append("<th>电影封面</td>");
    queryResult.append("<th>电影名称</td>");
    queryResult.append("<th>演员</td>");
    queryResult.append("<th>制片地区</td>");
    queryResult.append("<th>导演</td>");
    queryResult.append("</tr>");
    int ziduangeshu=10;
    while (rs.next()) {
      String bookISBN="";
  	  String author="";
  	  String publish="";
  	  String director="";
  	  String bookPic="";
  	  String bookName="";
  	  String bookNameLink="";
  	  for(int k=1;k<=ziduangeshu;k++) {
		if(k==1) {
			bookPic="<image src="+rs.getString(k)+" width=70 height=100/>";
		} else if(k==2) {
			bookISBN=rs.getString(k);
		} else if(k==3) {
			bookName=rs.getString(k);
			bookNameLink="<a href=\"LookBookAbstract.jsp?bookISBN="+bookISBN+"\">"+bookName+"</a>";
		} else if(k==4) {
			author=rs.getString(k);
		} else if(k==6) {
			publish=rs.getString(k);
		} else if(k==8) {
			director=rs.getString(k);
	    }
	  }
      	String sqlStatemente="use bookshop";
    	String sqlStatementf="select * from blackform where bookISBN = '"+bookISBN+"'";
    	sqld=con.createStatement();
    	sqld.executeUpdate(sqlStatemente);
	    sqlc=con.createStatement();
	    rb=sqlc.executeQuery(sqlStatementf);
	    if(!rb.next()) {
	      queryResult.append("<tr>");
	      queryResult.append("<td>"+bookPic+"</td>");
	      queryResult.append("<td>"+bookNameLink+"</td>");
	      queryResult.append("<td>"+author+"</td>");
	      queryResult.append("<td>"+publish+"</td>");
	      queryResult.append("<td>"+director+"</td>");
          String sa="use userisbn";
          String sb="select * from "+logname+"isbn where ISBN = '"+bookISBN+"'";
	      sqla=con.createStatement();
  	      sqla.executeUpdate(sa);
	      sqlb=con.createStatement();
  	      rd=sqlb.executeQuery(sb);
  	      if (rd.next()) {
  	    	queryResult.append("<td>已收藏</td>");
  	      } else {
	        String buy="<a href=\"LookPurchase.jsp?buyISBN="+bookISBN+"\">收藏</a>";
	        queryResult.append("<td>"+buy+"</td>");
  	      }
  	      queryResult.append("</tr>");
	    }}
    queryResult.append("</table>");
    jspContext.setAttribute("giveResult",queryResult);
  } catch(SQLException exp) {
    jspContext.setAttribute("giveResult",new StringBuffer("请给出查询条件"));
  }
%>