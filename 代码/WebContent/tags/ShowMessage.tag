<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult1" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
    String bookISBN=(String)session.getAttribute("bookISBN");
    String logname=(String)session.getAttribute("logname");
	int mm=logname.indexOf(",");
	logname=logname.substring(0,mm);
    String tableName=bookISBN+"board";
    try {Class.forName("com.mysql.jdbc.Driver");}
    catch (ClassNotFoundException e) {
	    out.print(e);
    }
    Connection con;
    Statement sql,sqla,sqlb,sqlc,sqld;
    String lii;
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
        sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        String sqlStatement="delete from "+tableName+" where utime = '"+deletedISBN+"'"+" AND ulogname = '"+logname+"'";
 	    String conditionb="use userboard";
 	    String conditionc="delete from "+logname+"board where mtime = '"+deletedISBN+"'";
 	    String conditiond="use movieboard";
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
        String s="select * from "+tableName;
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
        String ull="<ul class=\"mes-board\">";
        presentPageResult.append(ull);
        rowSet.absolute((p-1)*pageSize+1);
        int ziduangeshu=10;
        ziduangeshu=Integer.parseInt(zuduanAmount);
		if (rowSet.size()!=0) {
        for (int i=1; i<=pageSize;i++) {
        	if (i==1) {
            lii="<br><li class=\"mes-content\">";
        	} else {
        		lii="<li class=\"mes-content\">";
        	}
        	presentPageResult.append(lii);
    		String mname="";
    		String mtime="";
    		String mmessage="";
    		String maddress="";
    		String mlogname="";
        	for(int k=1;k<=5;k++) {
        		if(k==1) {
        			mname=rowSet.getString(k);
        		} else if(k==2) {
        			mtime=rowSet.getString(k);
        			mtime=mtime.substring(0,mtime.length()-2);
        		} else if(k==3) {
        			mmessage=rowSet.getString(k);
    		    } else if(k==4) {
    			    maddress=rowSet.getString(k);
    		    } else if(k==5) {
    		    	mlogname=rowSet.getString(k);
    		    }
        	}
    		presentPageResult.append("<h1>"+mname+"</h1>");
    		presentPageResult.append("<small>"+mtime+"</small>");
    		presentPageResult.append("<br><small id=\"sss\">"+maddress+"</small>");
    		presentPageResult.append("<p>"+mmessage+"</p>");
    		if (mlogname.equals(logname)) {
    			String del="<a href=\"LookBookAbstract.jsp?deletedISBN="+mtime+"&bookISBN="+bookISBN+"\">删除影评</a>";
    			presentPageResult.append("<p>"+del+"</p>");
    		}
        	presentPageResult.append("</li>");
        	boolean boo=rowSet.next();
        	if(boo==false) break;
        }
		} else {
			lii="<br><li class=\"mes-content\">";
			presentPageResult.append(lii);
			presentPageResult.append("<p>本网站还未有用户对该影片进行评论！</p>");
			presentPageResult.append("</li>");
		}
        presentPageResult.append("</ul>");
        jspContext.setAttribute("giveResult1",presentPageResult);
        con.close();
	}
	catch(SQLException exp) {
		jspContext.setAttribute("showPage",new Integer(1));
		jspContext.setAttribute("pageAllCount",new Integer(1));
		jspContext.setAttribute("giveResult1",new StringBuffer(""+exp));
	}
%>