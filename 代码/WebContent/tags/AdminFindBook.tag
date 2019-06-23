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
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  Connection con;
  Statement sql;
  ResultSet rs;
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
    queryResult.append("<th>电影编号</td>");
    queryResult.append("<th>电影名称</td>");
    queryResult.append("</tr>");
    int ziduangeshu=10;
    while (rs.next()) {
      queryResult.append("<tr>");
      String bookISBN="";
  	  for(int k=1;k<=ziduangeshu;k++) {
		if(k==2) {
			bookISBN=rs.getString(k);
			queryResult.append("<td>"+bookISBN+"</td>");
		}
		if(k==3) {
			String bookName=rs.getString(k);
			String bookNameLink="<a href=\"LookBookAbstract.jsp?bookISBN="+bookISBN+"\">"+bookName+"</a>";
			queryResult.append("<td>"+bookNameLink+"</td>");
		}
	  }
  	  String buy="<a href=\"ModifyFilm.jsp?bookISBN="+bookISBN+"\">修改信息</a>";
  	  queryResult.append("<td>"+buy+"</td>");
  	  String del="<a href=\"DoFilm.jsp?deletedISBN="+bookISBN+"\">删除</a>";
  	  queryResult.append("<td>"+del+"</td>");
    }
    queryResult.append("</table>");
    jspContext.setAttribute("giveResult",queryResult);
  } catch(SQLException exp) {
    jspContext.setAttribute("giveResult",new StringBuffer("请给出查询条件"));
  }
%>