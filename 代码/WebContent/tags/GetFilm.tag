<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="bookISBN" required="true" %>
<%@ variable name-given="oldbookName" scope="AT_END" %>
<%@ variable name-given="oldbookAuthor" scope="AT_END" %>
<%@ variable name-given="oldbookPic" scope="AT_END" %>
<%@ variable name-given="oldbookPublish" scope="AT_END" %>
<%@ variable name-given="oldbookAbstract" scope="AT_END" %>
<%@ variable name-given="oldfilmDirector" scope="AT_END" %>
<%
  session.setAttribute("bookISBN", bookISBN);
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
  String bookAbstract="";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    String query="select * from bookform WHERE bookISBN='"+bookISBN+"'";
    sql=con.createStatement();
    rs=sql.executeQuery(query);
    if (rs.next()) {
      jspContext.setAttribute("oldbookName",rs.getString("bookName"));
      jspContext.setAttribute("oldbookAuthor",rs.getString("bookAuthor"));
      jspContext.setAttribute("oldbookPic",rs.getString("bookPic"));
      jspContext.setAttribute("oldbookPublish",rs.getString("bookPublish"));
      jspContext.setAttribute("oldbookAbstract",rs.getString("bookAbstract"));
      bookAbstract=rs.getString("bookAbstract");
      jspContext.setAttribute("oldfilmDirector",rs.getString("filmDirector"));
      session.setAttribute("bookAbstract",bookAbstract);
      session.setAttribute("AorF","F");
    } else {
        jspContext.setAttribute("oldbookName","无");
        jspContext.setAttribute("oldbookAuthor","无");
        jspContext.setAttribute("oldbookPic","无");
        jspContext.setAttribute("oldbookPublish","无");
        jspContext.setAttribute("oldbookAbstract","无");
        jspContext.setAttribute("oldfilmDirector","无");
    }
    con.close();
  } catch(SQLException exp) {
      jspContext.setAttribute("oldbookName","异常");
      jspContext.setAttribute("oldbookAuthor","异常");
      jspContext.setAttribute("oldbookPic","异常");
      jspContext.setAttribute("oldbookPublish","异常");
      jspContext.setAttribute("oldbookAbstract","异常");
      jspContext.setAttribute("oldfilmDirector","异常");
  }
%>