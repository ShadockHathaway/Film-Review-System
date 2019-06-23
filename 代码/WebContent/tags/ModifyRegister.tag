<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  String a = email;
  String b = address;
  String c = realname;
  String d = phone;
  String logname=(String)session.getAttribute("logname");
  if (logname!=null) {
	  int m=logname.indexOf(",");
	  logname=logname.substring(0,m);
  }
  boolean wr=true;
  boolean wp=true;
  boolean we=true;
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql,sqla,sqlb,sqlc;
  ResultSet rs,rd,rf;
  String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    String updateCondition="UPDATE user SET phone='"+d+"',email='"+a+"',address='"+b+"',realname='"+c+"' WHERE logname='"+logname+"'";
	String conditionc="select * from user where realname = '"+c+"'";
	String conditiond="select * from user where phone = '"+d+"'";
	String conditione="select * from user where email = '"+a+"'";
    sqla=con.createStatement();
    rs=sqla.executeQuery(conditionc);
    sqlb=con.createStatement();
    rd=sqlb.executeQuery(conditiond);
    sqlc=con.createStatement();
    rf=sqlc.executeQuery(conditione);
    while(rs.next()) {
    	String lo=rs.getString("logname");
    	if (!lo.equals(logname)) {
    		wr=false;
    	}
    }
    while(rd.next()) {
    	String li=rd.getString("logname");
    	if (!li.equals(logname)) {
    		wp=false;
    	}
    }
    while(rf.next()) {
    	String lf=rf.getString("logname");
    	if (!lf.equals(logname)) {
    		we=false;
    	}
    }
    if (wr) {
    	if (wp) {
    		if (we) {
                sql=con.createStatement();
                int m=sql.executeUpdate(updateCondition);
                if (m==1) {
                    str.append("修改信息成功");
	                session.setAttribute("phone",d);
	                session.setAttribute("email",a);
	                session.setAttribute("address",b);
	                session.setAttribute("realname",c);
                } else {
    	            str.append("更新失败");
                }
    		} else {
    			str.append("更新失败，此邮箱已被他人占用！");
    		}
    	} else {
    		str.append("更新失败，此手机号已被他人占用！");
    	}
    } else {
    	str.append("更新失败，此昵称已被他人占用！");
    }
        con.close();
  } catch(SQLException exp) {
    str.append("更新失败"+exp);
  }
  jspContext.setAttribute("giveResult",str);
%>