<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="bookISBN" required="true" %>
<%@ variable name-given="giveResult1" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
int total=0;
String logname=(String)session.getAttribute("logname");
int mm=logname.indexOf(",");
logname=logname.substring(0,mm);
String tableName=logname+"board";
String mtime="";
String mmessage="";
String mISBN="";
String del="";
try {Class.forName("com.mysql.jdbc.Driver");}
catch (ClassNotFoundException e) {
    out.print(e);
}
Connection con;
Statement sql,sqla,sqlb,sqlc,sqld;
String lii;
ResultSet rs,rd;
StringBuffer presentPageResult;
CachedRowSet rowSet=RowSetProvider.newFactory().createCachedRowSet();
presentPageResult=new StringBuffer();
String uri="jdbc:mysql://localhost:3306/"+dataSource;
String uname = "root";
String upassword = "movie199738M";
try {
    con=DriverManager.getConnection(uri,uname,upassword);
    sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sqlStatement="delete from "+bookISBN+"board where utime = '"+deletedISBN+"'";
	    String conditionb="use userboard";
	    String conditionc="delete from "+tableName+" where mtime = '"+deletedISBN+"'";
	    String conditiond="use movieboard";
		String conditiona="select count(*) as dt from "+logname+"board";
    if (deletedISBN!=null) {
      sqlb=con.createStatement();
      sqlb.executeUpdate(conditionb);
      sqlc=con.createStatement();
      sqlc.executeUpdate(conditionc);
      sqld=con.createStatement();
      sqld.executeUpdate(conditiond);
  	  sqla=con.createStatement();
  	  sqla.executeUpdate(sqlStatement);
    }
    sqlb=con.createStatement();
    sqlb.executeUpdate(conditionb);
    String s="select * from "+tableName;
    rs=sql.executeQuery(s);
    if (rs.next()) {
        String ull="<ul class=\"mes-board\">";
        presentPageResult.append(ull);
    	lii="<br><li class=\"mes-content\">";
    	presentPageResult.append(lii);
    	total++;
    	for(int k=1;k<=3;k++) {
    		if(k==1) {
    			mtime=rs.getString(k);
    			mtime=mtime.substring(0,mtime.length());
    		}
    		if(k==2) {
    			mmessage=rs.getString(k);
    		}
    		if(k==3) {
    			mISBN=rs.getString(k);
    		}
    	}
		presentPageResult.append("<small>"+mtime+"</small>");
		presentPageResult.append("<p>"+mmessage+"</p>");
		del="<a href=\"LookMessage.jsp?deletedISBN="+mtime+"&bookISBN="+mISBN+"\">删除影评</a>";
		presentPageResult.append("<p>"+del+"</p>");
    	presentPageResult.append("</li>");
        while(rs.next()) {
    	    lii="<li class=\"mes-content\">";
    	    total++;
    	    presentPageResult.append(lii);
        	for(int k=1;k<=3;k++) {
    	    	if(k==1) {
    			    mtime=rs.getString(k);
    			    mtime=mtime.substring(0,mtime.length());
    		    }
    		    if(k==2) {
    		    	mmessage=rs.getString(k);
    	    	}
    		    if(k==3) {
    		    	mISBN=rs.getString(k);
    	    	}
    	    }
	    	presentPageResult.append("<small>"+mtime+"</small>");
		    presentPageResult.append("<p>"+mmessage+"</p>");
		    del="<a href=\"LookMessage.jsp?deletedISBN="+mtime+"&bookISBN="+mISBN+"\">删除影评</a>";
		    presentPageResult.append("<p>"+del+"</p>");
    	    presentPageResult.append("</li>");
        }
    } else {
		lii="<br><li class=\"mes-content\">";
		presentPageResult.append(lii);
		presentPageResult.append("<p>您还未发布任何影评！</p>");
		presentPageResult.append("</li>");
    }
    presentPageResult.append("</ul>");
    if (total!=0) {
    	String Total="您共发布了以下"+total+"条影评";
    	out.println(Total);
    }
    jspContext.setAttribute("giveResult1",presentPageResult);
    con.close();
}
catch(SQLException exp) {
	jspContext.setAttribute("giveResult1",new StringBuffer(""+exp));
}
%>