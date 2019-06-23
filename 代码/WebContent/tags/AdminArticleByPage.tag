<%@ tag import="java.sql.*"%>
<%@ tag import="javax.sql.rowset.*" %>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="tableName" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
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
    Statement sql,sqla,sqlb;
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
        String s="select * from "+tableName+" ORDER BY ISBN DESC";
        String sqlStatement="delete from "+tableName+" where ISBN = '"+deletedISBN+"'";
        if (deletedISBN!=null) {
        	  sqla=con.createStatement();
        	  sqla.executeUpdate(sqlStatement);
          }
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
        presentPageResult.append("<th>文章编号</td>");
        presentPageResult.append("<th>文章封面</td>");
        presentPageResult.append("<th>文章标题</td>");
        presentPageResult.append("<th>文章摘要</td>");
        presentPageResult.append("</tr>");
        rowSet.absolute((p-1)*pageSize+1);
        int ziduangeshu=10;
        ziduangeshu=Integer.parseInt(zuduanAmount);
        for (int i=1; i<=pageSize;i++) {
        	String ISBN="";
        	String mtitle="";
        	String mLink="";
        	String mauthor="";
        	String mabstract="";
        	String mpic="";
        	for(int k=1;k<=ziduangeshu;k++) {
        		if(k==1) {
        			ISBN=rowSet.getString(k);
        		} else if(k==2) {
        			mtitle=rowSet.getString(k);
        			mLink="<a href=\"../user/ShowArticle.jsp?ISBN="+ISBN+"\">"+mtitle+"</a>";
        		} else if(k==3) {
        			mauthor=rowSet.getString(k);
        		} else if(k==4) {
        			mabstract=rowSet.getString(k);
        		} else if(k==5) {
        			mpic="<image src="+rowSet.getString(k)+" width=200 height=120/>";
        		}
        	}
        	String sqlStatementf="select * from blackarticle where ISBN = '"+ISBN+"'";
  	        sqlb=con.createStatement();
  	        rd=sqlb.executeQuery(sqlStatementf);
  	        if(!rd.next()) {
        	presentPageResult.append("<tr>");
			presentPageResult.append("<td>"+ISBN+"</td>");
			presentPageResult.append("<td>"+mpic+"</td>");
			presentPageResult.append("<td>"+mLink+"</td>");
			presentPageResult.append("<td>"+mabstract+"</td>");
        	String buy="<a href=\"ModifyArticle.jsp?ISBN="+ISBN+"\">修改信息</a>";
        	presentPageResult.append("<td>"+buy+"</td>");
  		    String del="<a href=\"BlackArticle.jsp?beletedISBN="+ISBN+"\">隐藏影讯</a>";
  		    presentPageResult.append("<td>"+del+"</td>");
			presentPageResult.append("</tr>");}
        	boolean boo=rowSet.next();
        	if(boo==false) break;
        }
        jspContext.setAttribute("giveResult",presentPageResult);
        con.close();
	}
	catch(SQLException exp) {
		jspContext.setAttribute("showPage",new Integer(1));
		jspContext.setAttribute("pageAllCount",new Integer(1));
		jspContext.setAttribute("giveResult",new StringBuffer(""+exp));
	}
%>