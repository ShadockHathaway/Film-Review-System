<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%@ tag import="javax.sql.rowset.*" %>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="findContent" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  String logname=(String)session.getAttribute("logname");
  int mm=logname.indexOf(",");
  ResultSet rs;
  logname=logname.substring(0,mm);
  int ziduangeshu=10;
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  Connection con;
  Statement sql,sqla,sqlb;
  String b = ""+findContent;
  StringBuffer queryResult=new StringBuffer();
  String uri="jdbc:mysql://localhost:3306/"+dataSource;
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    sql=con.createStatement();
    String s="";
    s="select * from "+tableName+" where title Like '%"+b+"%' or abstract Like '%"+b+"%' ORDER BY ISBN DESC";
    rs=sql.executeQuery(s);
    String ISBN="";
    String mtitle="";
    String mLink="";
    String mauthor="";
    String mabstract="";
    String mpic="";
    while (rs.next()) {
    for(int k=1;k<=ziduangeshu;k++) {
    	if(k==1) {
    		ISBN=rs.getString(k);
    	} else if(k==2) {
    		mtitle=rs.getString(k);
    		mLink="<a href=\"ShowArticle.jsp?ISBN="+ISBN+"\">"+mtitle+"</a>";
    	} else if(k==3) {
    		mauthor=rs.getString(k);
    	} else if(k==4) {
    		mabstract=rs.getString(k);
    	} else if(k==5) {
    		mpic="<image src="+rs.getString(k)+" width=200 height=120/>";
    	}
    }
    queryResult.append("<div id=\"abc\"><table border=1><tr>");
    queryResult.append("<th>"+mLink+"</th>");
    queryResult.append("</tr></table>");
    queryResult.append("<table border=1><tr><td>"+mpic+"</td>");
    queryResult.append("<td id=\"bc\">"+mabstract+"</td>");
    queryResult.append("</tr></table></div>");
    }
    jspContext.setAttribute("giveResult",queryResult);
    con.close();
  } catch(SQLException exp) {
    jspContext.setAttribute("giveResult",new StringBuffer("请给出查询条件"));
  }
%>