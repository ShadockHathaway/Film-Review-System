<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="title" required="true" %>
<%@ attribute name="author" required="true" %>
<%@ attribute name="abst" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  String ISBN=(String)session.getAttribute("ISBN");
  String file=ISBN+".jsp";
  session.setAttribute("aISBN",file);
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql;
  ResultSet rs,rd,rf;
  String uri="jdbc:mysql://localhost:3306/article?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    String updateCondition="UPDATE article SET title='"+title+"',author='"+author+"',abstract='"+abst+"' WHERE ISBN='"+ISBN+"'";
    sql=con.createStatement();
    int m=sql.executeUpdate(updateCondition);
    if (m==1) {
        str.append("修改信息成功");
        session.setAttribute("AorF","A");
    } else {
    	str.append("更新失败");
    }
    con.close();
  } catch(SQLException exp) {
    str.append("更新失败"+exp);
  }
  jspContext.setAttribute("giveResult",str);
%>