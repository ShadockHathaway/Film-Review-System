<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="logname" required="true" %>
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
    Statement sql,sqla,sqlb,sqlc,sqld;
    ResultSet rs,rd,rb;
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
        presentPageResult.append("<th>电影封面</td>");
        presentPageResult.append("<th>电影名称</td>");
        presentPageResult.append("<th>演员</td>");
        presentPageResult.append("<th>制片地区</td>");
        presentPageResult.append("<th>导演</td>");
        presentPageResult.append("</tr>");
        rowSet.absolute((p-1)*pageSize+1);
        int ziduangeshu=10;
        ziduangeshu=Integer.parseInt(zuduanAmount);
        for (int i=1; i<=pageSize;i++) {
        	presentPageResult.append("<tr>");
        	String bookISBN="";
        	String author="";
        	String publish="";
        	String director="";
        	String bookPic="";
        	String bookName="";
        	String bookNameLink="";
        	for(int k=1;k<=ziduangeshu;k++) {
        		if(k==1) {
        			bookPic="<image src="+rowSet.getString(k)+" width=70 height=100/>";
        		} else if(k==2) {
        			bookISBN=rowSet.getString(k);
        		} else if(k==3) {
        			bookName=rowSet.getString(k);
        			bookNameLink="<a href=\"LookBookAbstract.jsp?bookISBN="+bookISBN+"\">"+bookName+"</a>";
        		} else if(k==4) {
        			author=rowSet.getString(k);
        		} else if(k==6) {
        			publish=rowSet.getString(k);
        		} else if(k==8) {
        			director=rowSet.getString(k);
    		    }
        	}
        	String sqlStatemente="use bookshop";
        	String sqlStatementf="select * from blackform where bookISBN = '"+bookISBN+"'";
        	sqld=con.createStatement();
        	sqld.executeUpdate(sqlStatemente);
        	sqlc=con.createStatement();
      	    rb=sqlc.executeQuery(sqlStatementf);
      	    if(!rb.next()) {
      	      presentPageResult.append("<td>"+bookPic+"</td>");
      	      presentPageResult.append("<td>"+bookNameLink+"</td>");
      	      presentPageResult.append("<td>"+author+"</td>");
      	      presentPageResult.append("<td>"+publish+"</td>");
      	      presentPageResult.append("<td>"+director+"</td>");
              String sa="use userisbn";
              String sb="select * from "+logname+"isbn where ISBN = '"+bookISBN+"'";
        	  sqla=con.createStatement();
          	  sqla.executeUpdate(sa);
        	  sqlb=con.createStatement();
          	  rd=sqlb.executeQuery(sb);
          	  if (rd.next()) {
          		presentPageResult.append("<td>已收藏</td>");
          	  } else {
        	    String buy="<a href=\"LookPurchase.jsp?buyISBN="+bookISBN+"\">收藏</a>";
        	    presentPageResult.append("<td>"+buy+"</td>");
          	  }
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