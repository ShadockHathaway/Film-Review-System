<%@ tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="utf-8"%>
<%  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%@ attribute name="bookISBN" required="true" %>
<%@ attribute name="bookName" required="true" %>
<%@ attribute name="filmDirector" required="true" %>
<%@ attribute name="bookAuthor" required="true" %>
<%@ attribute name="bookPublish" required="true" %>
<%@ attribute name="bookAbstract" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
<% boolean boo=true;
   StringBuffer presentPageResult=new StringBuffer();
   String Link = "<br><a href=\"upload.jsp\"><button class=\"button\">上传影片封面</button></a>";
   String bookPic = "C:/Users/admin/eclipse-workspace/tushuguan/image";
   if(bookISBN!=null) {
       if(bookISBN.contains("，")||bookISBN.contains(",")) {
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
	   String condition="INSERT INTO bookform VALUES";
	   String conditiona="use movieboard";
	   String conditionb="create table "+bookISBN+"board"+
	   "("+"uname varchar(20) not null"+","+"utime DATETIME not null"+","+"umessage TEXT not null"+","+"uaddress TEXT not null"+","+"ulogname varchar(20) not null"+")";
	   condition+="("+"'"+bookPic;
	   condition+="','"+bookISBN;
	   condition+="','"+bookName;
	   condition+="','"+bookAuthor;
	   condition+="','"+bookPrice;
	   condition+="','"+bookPublish;
	   condition+="','"+bookAbstract;
	   condition+="','"+filmDirector+"')";
	   try {
	       String uri="jdbc:mysql://localhost:3306/bookshop?useSSL=false&useUnicode=true&characterEncoding=utf-8";
	 	   String uname = "root";
		   String upassword = "movie199738M";
	       con=DriverManager.getConnection(uri,uname,upassword);
	       sql=con.createStatement();
	       sql.executeUpdate(condition);
	       sqla=con.createStatement();
	       sqla.executeUpdate(conditiona);
	       sqlb=con.createStatement();
	       sqlb.executeUpdate(conditionb);
	       con.close();
	       String mess="编号"+bookISBN+"影片录入成功";
	       session.setAttribute("AorF","F");
	       mess+=Link;
	       jspContext.setAttribute("backMess",mess);
	       session.setAttribute("bookISBN", bookISBN);
	       con.close();
	   }
	   catch(Exception e) {
	       jspContext.setAttribute("backMess","没有填写影片编号或影片编号已经被占用");
	   }
   } else {
	   jspContext.setAttribute("backMess","录入失败（影片编号不能为空或含有逗号）");
   }
 %>