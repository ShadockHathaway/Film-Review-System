# 爱影网影评系统 设计说明书

## 架构设计、详细设计（BCE方法）到应用程序框架映射指南

### 1、映射指南
    
在将逻辑架构映射到物理架构时，应考虑下列因素：

- Entity：领域对象或数据实体
- Boundary：与外部 Actor 交互的类。包括 UI、外部系统接口
- Controller：处理外部事件，实现控制流的类。通常是一个子系统、一个用例一个类

### 2、逻辑视图

![逻辑视图](../image/逻辑视图.png)

### 3、框架目录

#### 1）用户端

|____index <br>
　　　|____index.jsp <br>
|____login <br>
　　　|____Login.jsp <br>
　　　|____ExitLogin.jsp <br>
　　　|____Register.jsp <br>
|____moviecenter <br>
　　　|____template.jsp <br>
　　　　　　|____FindBook.jsp <br>
　　　　　　|____LookBookAbstract.jsp <br>
　　　　　     　|____SubmitMessage.jsp <br>
　　　　     　　|____ShowMessage.tag <br>
　　　　　　|____LookPurchase.jsp <br>
　　　　　　|____ShowBookByPage.tag <br>
|____newscenter <br>
　　　|____LookArticle.jsp <br>
　　　　　　|____ShowArticleByPage.tag <br>
　　　　　　|____ShowArticle.jsp <br>
　　　　　　|____FindArticle.jsp
|____usercenter <br>
　　　|____Center.jsp <br>
　　　　　　|____LookPurchase.jsp <br>
　　　　　　|____LookMessage.jsp <br>
　　　　　　|____ModifyRegister.jsp <br>
　　　　　　|____ModifyPassword.jsp <br>
