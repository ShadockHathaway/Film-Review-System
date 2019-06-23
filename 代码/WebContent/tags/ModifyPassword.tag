<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="logname" required="true" %>
<%@ attribute name="oldPassword" required="true" %>
<%@ attribute name="newPassword" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql;
  ResultSet rs;
  String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    sql=con.createStatement();
    String s="SELECT * FROM user where logname='"+logname+"'And password='"+oldPassword+"'";
    rs=sql.executeQuery(s);
    if (rs.next()) {
      String updateString="UPDATE user SET password='"+newPassword+"' where logname='"+logname+"'";
      int m=sql.executeUpdate(updateString);
      if (m==1) {
        str.append("密码更新成功");
      } else {
        str.append("密码更新失败");
      }
    } else {
      str.append("密码更新失败");
    }
    con.close();
  } catch(SQLException exp) {
    str.append("密码更新失败"+exp);
  }
  jspContext.setAttribute("giveResult",str);
  %>