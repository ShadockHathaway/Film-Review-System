<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="bookName" required="true" %>
<%@ attribute name="filmDirector" required="true" %>
<%@ attribute name="bookAuthor" required="true" %>
<%@ attribute name="bookPublish" required="true" %>
<%@ attribute name="bookAbstract" required="true" %>
<%@ attribute name="bookPic" required="true" %>
<%@ variable name-given="giveResult" variable-class="java.lang.StringBuffer" scope="AT_END" %>
<%
  String bookISBN=(String)session.getAttribute("bookISBN");
  try {Class.forName("com.mysql.jdbc.Driver");}
  catch (ClassNotFoundException e) {
    out.print(e);
  }
  StringBuffer str=new StringBuffer();
  Connection con;
  Statement sql;
  ResultSet rs,rd,rf;
  String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
  String uname = "root";
  String upassword = "movie199738M";
  try {
    con=DriverManager.getConnection(uri,uname,upassword);
    String updateCondition="UPDATE bookform SET bookName='"+bookName+"',filmDirector='"+filmDirector+"',bookAuthor='"+bookAuthor+"',bookPublish='"+bookPublish+"',bookAbstract='"+bookAbstract+"' WHERE bookISBN='"+bookISBN+"'";
    sql=con.createStatement();
    int m=sql.executeUpdate(updateCondition);
    if (m==1) {
        str.append("修改信息成功");
        session.setAttribute("AorF","F");
    } else {
    	str.append("更新失败");
    }
    con.close();
  } catch(SQLException exp) {
    str.append("更新失败"+exp);
  }
  jspContext.setAttribute("giveResult",str);
%>