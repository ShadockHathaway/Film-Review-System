<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="ISBN" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="author" required="true" %>
<%@ attribute name="abst" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<% boolean boo=true;
   session.setAttribute("ISBN",ISBN);
   String file=ISBN+".jsp";
   String Link = "<br><center><a href=\"bian.jsp\"><button class=\"button\">前往编写文章</button></a></center>";
   String pic = "C:/Users/admin/eclipse-workspace/tushuguan/image1/"+ISBN+".jpg";
   session.setAttribute("aISBN",file);
   if(ISBN!=null) {
       if(ISBN.contains("，")||ISBN.contains(",")) {
           boo=false;
       }
   } else {
	   boo=false;
   }
   if(boo) {
	   try { Class.forName("com.mysql.jdbc.Driver");}
	   catch(ClassNotFoundException e) {
	       out.print(e);
	   }
	   Connection con;
	   Statement sql,sqla,sqlb;
	   ResultSet rs;
	   float bookPrice=1;
	   String condition="INSERT INTO article VALUES";
	   condition+="("+"'"+ISBN;
	   condition+="','"+title;
	   condition+="','"+author;
	   condition+="','"+abst;
	   condition+="','"+pic+"')";
	   try {
	       String uri="jdbc:mysql://localhost:3306/article?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	 	   String uname = "root";
		   String upassword = "movie199738M";
	       con=DriverManager.getConnection(uri,uname,upassword);
	       sql=con.createStatement();
	       sql.executeUpdate(condition);
	       con.close();
	       String mess="编号"+ISBN+"文章录入成功";
	       jspContext.setAttribute("backMess",mess);
	       session.setAttribute("AorF","A");
	       con.close();
	       out.println(Link);
	   }
	   catch(Exception e) {
	       jspContext.setAttribute("backMess","没有填写文章编号或文章编号已经被占用");
	   }
   } else {
	   jspContext.setAttribute("backMess","录入失败（文章编号不能为空或含有逗号）");
   }
 %>