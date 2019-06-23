<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ attribute name="bookISBN" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
    try {Class.forName("com.mysql.jdbc.Driver");}
    catch (ClassNotFoundException e) {
	    out.print(e);
    }
    Connection con;
    Statement sql,sqla,sqlb,sqlc,sqld;
    ResultSet rs;
    String tableName1=logname+"board";
    int pageSize=Integer.parseInt(bookAmountlnPage);
    int allPages=0;
    int show=Integer.parseInt(page);
    StringBuffer presentPageResult;
    CachedRowSet rowSet=RowSetProvider.newFactory().createCachedRowSet();
    presentPageResult=new StringBuffer();
    String uri="jdbc:mysql://localhost:3306/"+dataSource;
	String uname = "root";
	String upassword = "movie199738M";
	try {
        con=DriverManager.getConnection(uri,uname,upassword);
        sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String s="select * from "+tableName;
        String sqlStatement="delete from "+tableName+" where utime = '"+deletedISBN+"'";
	    String conditionb="use userboard";
	    String conditionc="delete from "+tableName1+" where mtime = '"+deletedISBN+"'";
	    String conditiond="use movieboard";
        if (deletedISBN!=null) {
      	  sqla=con.createStatement();
      	  sqla.executeUpdate(sqlStatement);
      	  sqlb=con.createStatement();
    	  sqlb.executeUpdate(conditionb);
      	  sqlc=con.createStatement();
    	  sqlc.executeUpdate(conditionc);
      	  sqld=con.createStatement();
    	  sqld.executeUpdate(conditiond);
        }
        rs=sql.executeQuery(s);
        rowSet.populate(rs);
        con.close();
        rowSet.last();
        int m=rowSet.getRow();
        int n=pageSize;
        allPages=((m%n)==0)?(m/n):(m/n+1);
        int p=Integer.parseInt(page);
        if(p>allPages) {
        	p=1;
        }
        if(p<=0) {
        	p=allPages;
        }
        jspContext.setAttribute("showPage",new Integer(p));
        jspContext.setAttribute("pageAllCount",new Integer(allPages));
        presentPageResult.append("<table border=1>");
        presentPageResult.append("<tr>");
        presentPageResult.append("<th>留言用户</td>");
        presentPageResult.append("<th>留言时间</td>");
        presentPageResult.append("<th>留言内容</td>");
        presentPageResult.append("</tr>");
        rowSet.absolute((p-1)*pageSize+1);
        int ziduangeshu=10;
        ziduangeshu=Integer.parseInt(zuduanAmount);
        for (int i=1; i<=pageSize;i++) {
        	presentPageResult.append("<tr>");
        	String uName="";
        	String uTime="";
        	String uMessage="";
        	String uLogname="";
        	if(rowSet.size()!=0) {
        	for(int k=1;k<=ziduangeshu;k++) {
        		if(k==1) {
        			uName=rowSet.getString(k);
        		}
        		if(k==2) {
        			uTime=rowSet.getString(k);
        			uTime=uTime.substring(0,uTime.length()-2);
        		}
        		if(k==3) {
        			uMessage=rowSet.getString(k);
        		}
        		if(k==5) {
        			uLogname=rowSet.getString(k);
        		}
        	}
        	presentPageResult.append("<td>"+uName+"</td>");
        	presentPageResult.append("<td>"+uTime+"</td>");
        	presentPageResult.append("<td id=\"a\">"+uMessage+"</td>");
        	String del="<a href=\"DoMessage.jsp?deletedISBN="+uTime+"&logname="+uLogname+"&bookISBN="+bookISBN+"\">删除影评</a>";
        	presentPageResult.append("<td>"+del+"</td>");
        	presentPageResult.append("</tr>");
        	boolean boo=rowSet.next();
        	if(boo==false) break;
        }}
        presentPageResult.append("</table>");
        jspContext.setAttribute("giveResult",presentPageResult);
        con.close();
	}
	catch(SQLException exp) {
		jspContext.setAttribute("showPage",new Integer(1));
		jspContext.setAttribute("pageAllCount",new Integer(1));
		jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
	}
%>