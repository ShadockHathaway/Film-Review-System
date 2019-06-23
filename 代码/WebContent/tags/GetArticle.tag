<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="ISBN" required="true" %>
<%@ variable name-given="oldtitle" scope="AT_END" %>
<%@ variable name-given="oldauthor" scope="AT_END" %>
<%@ variable name-given="oldpic" scope="AT_END" %>
<%@ variable name-given="oldabstract" scope="AT_END" %>
<%
  session.setAttribute("aISBN", ISBN);
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql;
  ResultSet rs;
  String uri="jdbc:mysql://localhost:3306/article?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  String bookAbstract="";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    String query="select * from article WHERE ISBN='"+ISBN+"'";
    sql=con.createStatement();
    rs=sql.executeQuery(query);
    if (rs.next()) {
      jspContext.setAttribute("oldtitle",rs.getString("title"));
      jspContext.setAttribute("oldauthor",rs.getString("author"));
      jspContext.setAttribute("oldpic",rs.getString("pic"));
      jspContext.setAttribute("oldabstract",rs.getString("abstract"));
      bookAbstract=rs.getString("abstract");
      session.setAttribute("articleAbstract",bookAbstract);
      session.setAttribute("AorF","A");
    } else {
        jspContext.setAttribute("oldtitle","无");
        jspContext.setAttribute("oldauthor","无");
        jspContext.setAttribute("oldpic","无");
        jspContext.setAttribute("oldabstract","无");
    }
    con.close();
  } catch(SQLException exp) {
      jspContext.setAttribute("oldtitle","异常");
      jspContext.setAttribute("oldauthor","异常");
      jspContext.setAttribute("oldpic","异常");
      jspContext.setAttribute("oldabstract","异常");
  }
%>