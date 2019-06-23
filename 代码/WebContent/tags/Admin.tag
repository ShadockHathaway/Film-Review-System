<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<%
byte[] a=logname.getBytes("utf-8");
logname=new String(a);
byte[] b=password.getBytes("utf-8");
password=new String(b);
String mess="";
try {Class.forName("com.mysql.jdbc.Driver");}
catch (ClassNotFoundException e) {
	out.print(e);
}
Connection con;
Statement sql,sqla;
ResultSet rs,rd;
String loginMess=(String)session.getAttribute("adminlogname");
if(loginMess==null) {
	loginMess="**********";
} else {
	mess=logname+"已经登录了";
}
String str=logname+","+password;
if(loginMess.equals(str)) {
	mess=logname+"已经登录了";
} else {
    String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	String uname = "root";
	String upassword = "movie199738M";
	boolean boo=(logname.length()>0)&&(password.length()>0);
	try {
        con=DriverManager.getConnection(uri,uname,upassword);
        String condition="select * from admin where logname='"+logname+"' and password ='"+password+"'";
        sql=con.createStatement();
        if(boo) {
    	    rs=sql.executeQuery(condition);
    	    boolean m=rs.next();
    	    if(m==true) {
    		    mess=logname+"登录成功";
    		    str=logname+","+password;
    		    session.setAttribute("adminlogname",str);
    		    session.setAttribute("password",password);
    	    } else {
    		    mess="您输入的用户名"+logname+"不存在，或密码不般配";}
    	} else {
    	    mess="还没有登录或您输入的用户名不存在、或密码不般配";
        }
        con.close();
    }
	catch(SQLException exp) {
		mess="问题："+exp;
	}
}
	jspContext.setAttribute("backMess",mess);
%>
