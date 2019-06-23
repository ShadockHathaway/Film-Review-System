<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
    try {Class.forName("com.mysql.jdbc.Driver");}
    catch (ClassNotFoundException e) {
	    out.print(e);
    }
    Connection con;
    Statement sql,sqla;
    ResultSet rs,rd;
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
        sql=con.createStatement();
        String s="select * from "+tableName;
        rs=sql.executeQuery(s);
        rowSet.populate(rs);
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
        presentPageResult.append("<th>用户名</td>");
        presentPageResult.append("<th>用户手机号</td>");
        presentPageResult.append("<th>用户邮箱</td>");
        presentPageResult.append("<th>用户昵称</td>");
        presentPageResult.append("</tr>");
        rowSet.absolute((p-1)*pageSize+1);
        int ziduangeshu=10;
        ziduangeshu=Integer.parseInt(zuduanAmount);
        for (int i=1; i<=pageSize;i++) {
        	String logname="";
        	String phone="";
        	String email="";
        	String realname="";
        	for(int k=1;k<=ziduangeshu;k++) {
        		if(k==1) {
        			logname=rowSet.getString(k);
        		}
        		if(k==3) {
        			phone=rowSet.getString(k);
        		}
        		if(k==4) {
        			email=rowSet.getString(k);
        		}
        		if(k==6) {
        			realname=rowSet.getString(k);
        		}
        	}
    	    String sqlStatementf="select * from blacklist where logname = '"+logname+"'";
      	    sqla=con.createStatement();
      	    rd=sqla.executeQuery(sqlStatementf);
        	if(!rd.next()) {
            	presentPageResult.append("<tr>");
            	presentPageResult.append("<td>"+logname+"</td>");
            	presentPageResult.append("<td>"+phone+"</td>");
            	presentPageResult.append("<td>"+email+"</td>");
            	presentPageResult.append("<td>"+realname+"</td>");
            	String bel="<a href=\"BlackList.jsp?beletedISBN="+logname+"\">加入黑名单</a>";
            	presentPageResult.append("<td>"+bel+"</td>");
            	presentPageResult.append("</tr>");
        	}
        	boolean boo=rowSet.next();
        	if(boo==false) break;
        }
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