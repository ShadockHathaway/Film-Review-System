# 爱影网影评系统 设计说明书

## 接口API设计

### 1、管理员录入影片
    
#### 1）参数说明

| 参数名 | 数据类型 | 描述 | 必需 |
| ---- | ---- | ---- | ---- |
| bookISBN | string | 电影编号 | 是 |
| bookName | string | 电影名 | 是 |
| filmDirector | string | 电影导演 | 是 |
| bookAuthor | string | 电影演员 | 是 |
| bookPublish | string | 电影制片地区 | 是 |
| bookAbstract | string | 电影摘要 | 是 |

#### 2）返回值

| HTTP状态码 | 返回格式 | 描述 |
| ---- | ---- | ---- |
| 200 | NULL | 成功 |
| 404 | {message: 'reason'} | 错误的请求 |

#### 3）示例

```js
<%
  String bookISBN=request.getParameter("bookISBN");
  String bookName=request.getParameter("bookName");
  String filmDirector=request.getParameter("filmDirector");
  String bookAuthor=request.getParameter("bookAuthor");
  String bookPublish=request.getParameter("bookPublish");
  String bookAbstract=request.getParameter("bookAbstract");
%>
<film:Film bookISBN="<%=bookISBN %>"
bookName="<%=bookName %>"
filmDirector="<%=filmDirector %>"
bookAuthor="<%=bookAuthor %>"
bookPublish="<%=bookPublish %>"
bookAbstract="<%=bookAbstract %>"/>
<p>返回的消息：<%=backMess %></p>
```
```js
<%@ attribute name="bookISBN" required="true" %>
<%@ attribute name="bookName" required="true" %>
<%@ attribute name="filmDirector" required="true" %>
<%@ attribute name="bookAuthor" required="true" %>
<%@ attribute name="bookPublish" required="true" %>
<%@ attribute name="bookAbstract" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
```

### 2、用户注册
    
#### 1）参数说明

| 参数名 | 数据类型 | 描述 | 必需 |
| ---- | ---- | ---- | ---- |
| logname | string | 用户名 | 是 |
| password | string | 密码 | 是 |
| email | string | 电子邮件 | 是 |
| realname | string | 用户昵称 | 是 |
| phone | string | 手机号 | 是 |
| address | string | 用户个性签名 | 否 |

#### 2）返回值

| HTTP状态码 | 返回格式 | 描述 |
| ---- | ---- | ---- |
| 200 | NULL | 成功 |
| 404 | {message: 'reason'} | 错误的请求 |

#### 3）示例

```js
<%
  String logname=request.getParameter("logname");
  String password=request.getParameter("password");
  String email=request.getParameter("email");
  String realname=request.getParameter("realname");
  String phone=request.getParameter("phone");
  String address=request.getParameter("address");
%>
<register:Register logname="<%=logname %>"
password="<%=password %>"
email="<%=email %>"
realname="<%=realname %>"
phone="<%=phone %>"
address="<%=address %>"/>
<p>返回的消息：<%=backMess %></p>
```
```js
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="realname" required="true" %>
<%@ attribute name="phone" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
```

### 3、上传图片
    
#### 1）参数说明

| 参数名 | 数据类型 | 描述 | 必需 |
| ---- | ---- | ---- | ---- |
| oldpic | string | 图片地址 | 是 |

#### 2）返回值

| HTTP状态码 | 返回格式 | 描述 |
| ---- | ---- | ---- |
| 200 | NULL | 成功 |
| 404 | {message: 'reason'} | 错误的请求 |

#### 3）示例

```js
<form action="../helpUpload" method="post" ENCTYPE="multipart/form-data">
  <input type=FILE name="fileName" size="40"><br><br>
  <input type="submit" name="g" value="提交">
</form>
```
```js
String pic = "C:/Users/admin/eclipse-workspace/tushuguan/image/" + savedFileName;
String rd = "UPDATE article SET pic = '"+pic+"' WHERE ISBN='"+logname+"'";
Statement sqla=con.createStatement();
sqla.executeUpdate(rd);
rs.updateString(5,pic);
int index=rs.getRow();
rs.absolute(index);
rs.updateRow();
backNews=fileName+"成功上传"+rd;
upFile.setFileName(fileName);
upFile.setSavedFileName(savedFileName);
upFile.setBackNews(backNews);
```

### 4、用户登录
    
#### 1）参数说明

| 参数名 | 数据类型 | 描述 | 必需 |
| ---- | ---- | ---- | ---- |
| logname | string | 用户名 | 是 |
| password | string | 密码 | 是 |

#### 2）返回值

| HTTP状态码 | 返回格式 | 描述 |
| ---- | ---- | ---- |
| 200 | NULL | 成功 |
| 404 | {message: 'reason'} | 错误的请求 |

#### 3）示例

```js
<%@ attribute name="logname" required="true" %>
<%@ attribute name="password" required="true" %>
<%@ variable name-given="backMess" scope="AT_END" %>
session.setAttribute("logname",str);
session.setAttribute("password",password);
```
```js
<% String logname1=(String)session.getAttribute("logname");
  if (logname1==null) {
    out.print("<a href=\"Login.jsp\">登录</a>");
  } else {
  out.print("<a href=\"ExitLogin.jsp\">退出登录</a>");
  }
%>
```

### 4、显示影评
    
#### 1）参数说明

| 参数名 | 数据类型 | 描述 | 必需 |
| ---- | ---- | ---- | ---- |
| mname| string | 发布影评用户昵称 | 是 |
| mtime | string | 影评发布时间 | 是 |
| mmessage | string | 影评内容 | 是 |
| maddress | string | 发布影评用户个性签名 | 是 |

#### 2）返回值

| HTTP状态码 | 返回格式 | 描述 |
| ---- | ---- | ---- |
| 200 | NULL | 成功 |
| 404 | {message: 'reason'} | 错误的请求 |

#### 3）示例

```js
<br>每页最多显示10条留言
<showMessage:ShowMessage dataSource="movieboard" 
tableName="<%=tablename %>" bookAmountlnPage="10" zuduanAmount="4" 
page="<%=number %>" deletedISBN="<%=deletedISBN %>"/>
<br>共有<%=pageAllCount %>页，当前显示第<%=showPage %>页
<br>
<%=giveResult1 %>
<link rel="stylesheet" media="screen" href="table.css"/>
<%
    int m=showPage.intValue();
%>
<a href="template.jsp?page=<%=m-1 %>">上一页</a>
<a href="template.jsp?page=<%=m+1 %>">下一页</a>
```

```js
<%@ attribute name="dataSource" required="true" %>
<%@ attribute name="deletedISBN" required="true" %>
<%@ attribute name="bookAmountlnPage" required="true" %>
<%@ attribute name="page" required="true" %>
<%@ attribute name="zuduanAmount" required="true" %>
<%@ variable name-given="showPage" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="pageAllCount" variable-class="java.lang.Integer" scope="AT_END" %>
<%@ variable name-given="giveResult1" variable-class="java.lang.StringBuffer" scope="AT_END" %>
presentPageResult.append("<h1>"+mname+"</h1>");
presentPageResult.append("<small>"+mtime+"</small>");
presentPageResult.append("<br><small id=\"sss\">"+maddress+"</small>");
presentPageResult.append("<p>"+mmessage+"</p>");
```
