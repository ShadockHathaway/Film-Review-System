<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>
<%@ page import="tom.jiafei.WriteFile" %>
<jsp:useBean id="writeFile" class="tom.jiafei.WriteFile" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>  
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->  
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->  
<script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">  
  div{  
    width:100%;  
  }  
</style>  
<title>文章编写页面</title>
<link rel="stylesheet" media="screen" href="../css/basic.css"/>
</head>
  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String aISBN=(String)session.getAttribute("aISBN");
    String logname2=(String)session.getAttribute("adminlogname");
    if (logname2!=null) {
    	  int m=logname2.indexOf(",");
    	  logname2=logname2.substring(0,m);
    } else {
    	  response.sendRedirect("admin.jsp");
    }
  %>
<body>
  <header>
    <img src="C:/Users/admin/eclipse-workspace/tushuguan/images/2.jpg"/>
    <nav>
      <ul>
        <li>
        <% String logname1=(String)session.getAttribute("adminlogname");
           if (logname1==null) {
               out.print("<a href=\"admin.jsp\">管理员登录</a>");
           } else {
        	   out.print("<a href=\"AdminExit.jsp\">退出登录</a>");
           }
        %></li>
        <li><a href="DoFilm.jsp">影片管理</a></li>
        <li><a href="DoArticle.jsp">影讯管理</a></li>
        <li><a href="DoUser.jsp">用户管理</a></li>
      </ul>
    </nav>
  </header>
<html>
<body>
<article>
<center>
<div id="biao">
<div>  
 <form action="yulan.jsp" method="post" target="_blank">  
    <h1>请编写文章</h1>
    <script id="editor" type="text/plain" style="width:800px;height:500px;">  
    </script>
    <input type="submit" value="预览" class="m180">
</form>
</div></div>
</center>
<center><br>
<a href="write.jsp">
<button class="button">复制HTML内容并存储</button></a>
<link rel="stylesheet" media="screen" href="../css/table.css"/>
<link rel="stylesheet" media="screen" href="../css/board.css"/>
<link rel="stylesheet" media="screen" href="../css/register.css"/>
</center></article>
<script type="text/javascript">
    //实例化编辑器  
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例  
    var ue = UE.getEditor('editor');
    function getContent() {  
        var arr = [];  
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");  
        arr.push("内容为：");
        arr.push(editor.getContent());  
        alert(arr.join("\n"));  
    }  
    function uptext(){
        if (!UE.getEditor('editor').hasContents()){
        alert('请先填写内容!');
        }else{
        document.setweb.info.value=UE.getEditor('editor').getContent();
        document.setweb.submit();
        }
      }
</script>  
</body>  
</html>