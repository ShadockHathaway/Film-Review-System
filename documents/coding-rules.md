# 爱影网影评系统 生产规范与指南

## 代码规范

### 1、JSP规范

JSP文件中，可以包含以下内容：HTML(CSS,JavaScript)、注释(前面有一篇博文已涉及)、Java代码、指令、隐含对象

JSP页面中的HTML包括：HTML标记、CSS、JavaScript

JSP页通过特殊标记“<%”和“%>”使用“脚本元素”，脚本元素通过适当方式嵌入HTML元素标记。Web容器中的JSP引擎能恰如其分地解释特殊标记。在引入脚本元素时，要谨慎从事，以防破坏HTML元素的语法规则。JSP技术的脚本元素分为以下5种。 

注释。注释类型有3种：HTML注释、JSP页注释和Java语言注释。JSP注释和Java语言注释显示在脚本标记“<%”和“%>”中，HTML注释不在脚本元素中显示。JSP注释供开发人员参考使用，在成功编译JSP页后，它们将不再出现。 

指令(directive)标记。指令标记为转换阶段提供全局信息，其语法如下： 

<%@ directive %> 

指令类型有3种：page指令、include指令和taglib指令。下面是一个page指令例子： 

<%@ page session=false %> 

声明(declaration)标记。声明标记允许在脚本标记“<%”和“%>”中引入Java程序以及与Java相关的声明。下面是一个声明例子： 

<%! public static final double pi = 3.1415926535897932; %> 

这是一个Java声明变量pi的简单表示。Java使用的任何声明类型均可在这个标记中显示，如类变量、实例变量、实例方法、静态方法和内部类等。规范没有限制声明标记中的Java代码。但编写者要谨慎行事，勿将不必要的Java代码写入声明标记。 

Scriptlet标记。Scriptlet标记允许将任何Java代码嵌入“<%”和“%>”标记中。开发人员要注意，输入代码将转换为_jspService()方法的一部分。通过精心设计，可将Scriptlet标记与HTML元素巧妙地结合在一起，以便在执行_jspService()方法时生成需要的动态输出。 

表达式(express)标记。表达式标记包含Java语言表达式的特定部分，在运行时，经过计算表达式生成输出。通过精心设计，可将表达式标记与HTML元素巧妙地结合在一起，以设置所需的输出格式。下面是一个表达式标记例子： 

<%= (pi*5*5)/4 %> 

注意，与Scriptlet标记不同，表达式不以“;”结尾。 

### 2、Tag文件规范


编写了一个Tag文件会对应生成一个Tag标记,Tag标记的格式为:

<Tag 文件名字/>或

<Tag 文件名字>

         标记体

</Tag 文件名字>

当JSP页面希望向Tag文件传递相应的信息时,可以使用标记体来传递,在Tag文件中通过<jsp:doBody/>来调用标记体

一个Tag文件对应一个Tag标记,那么该目录下有若干个Tag文件就行成了一个库,在JSP页面要调用Tag文件,就要通过taglib指令来引入相应目录下的一个标记库,只有这样JSP页面才能调用相应的Tag文件并动态执行该Tag文件

<%@taglib prefix="前缀" tagdir="自定义标记库的位置"%>

注意:使用前缀可以区别不同标记库下相同名字的标记文件

如:调用/WEB-INF/tags/math/random.tag文件就可以在JSP页面中这样写

<%@taglib prefix="math" tagdir="/WEB-INF/tags/math/"%>来引入标记库

之后可以<math:random/>或者<math:random>标记体</math:random>来调用了并执行相应tag文件了
