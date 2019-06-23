<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"
+ request.getServerName()+":"+ request.getServerPort()
+ path +"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>信息发布</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->
<style type="text/css">
#showContent {
WIDTH:1000px;
BACKGROUND:#e4eefa;
FLOAT: left;
border:1px solid #FC9;
}

#showContent {

MARGIN-BOTTOM:-32767px!important
}
</style>
</head>

<body>
类别：${requestScope.category}<br>
标题：${requestScope.title}<br>

内容为：
<br/>
<div id="showContent">
${requestScope.content}
</div>
</body>
</html>