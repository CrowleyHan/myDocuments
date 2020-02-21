# spring

Spring是个轻量化的企业级开源框架

简化Java企业级应用开发

简化java企业级应用的开发，对服务器端友好，对解决java的web项目后天

## spring优点

1：轻量化，Spring是个轻量化的框架，基本大小才2M

核心：控制反转，和面向切面，

#### 控制反转（IOC）

把创建对象这个步骤交给代码去完成。---ioc容器，

ioc容器管理对象的创建销毁。

##### 控制反转的事例

###### 1----setter方法注入-----属性注入：

```java
package com.spring.demo02.entity;  
  
public class Programmer {  
  
    private String name;  
    private String sex;  
  
    // 在这里定义要依赖的computer属性，加上set方法  
    private Computer computer;  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    public String getSex() {  
        return sex;  
    }  
  
    public void setSex(String sex) {  
        this.sex = sex;  
    }  
  
    public Computer getComputer() {  
        return computer;  
    }  
  
    /** 
     * 加上Setter方法 
     * */  
    public void setComputer(Computer computer) {  
        this.computer = computer;  
    }  
} 
```

```java
	package com.spring.demo02.entity;  
public class Computer {  
      
    private String brand;  
    private String color;  
    private String size;  
      
    public void coding() {  
        System.out.println("Computer is coding!!!");  
    }  
  
    public String getBrand() {  
        return brand;  
    }  
  
    public void setBrand(String brand) {  
        this.brand = brand;  
    }  
  
    public String getColor() {  
        return color;  
    }  
  
    public void setColor(String color) {  
        this.color = color;  
    }  
  
    public String getSize() {  
        return size;  
    }  
  
    public void setSize(String size) {  
        this.size = size;  
    }    
}
————————————————
版权声明：本文为CSDN博主「旧城以西林」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/zhaoraolin/article/details/78941062
```



```xml

<?xml version="1.0" encoding="UTF-8"?>  
  
<beans xmlns="http://www.springframework.org/schema/beans"  
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
    xsi:schemaLocation="http://www.springframework.org/schema/beans  
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">  
      
  <bean id="programmer" class="com.spring.demo2.entity.Programmer">  
    <property name="name" value="小李"></property>  
    <property name="sex" value="男"></property>  
    <property name="computer" ref="computer"></property>  
  </bean>  
    
  <bean id="computer" class="com.spring.demo2.entity.Computer">  
    <property name="brand" value="hp"></property>  
    <property name="color" value="黑"></property>  
    <property name="size" value="14"></property>  
  </bean>  
    
</beans>
```

以上，就是属性注入了。关键的是在类里面声明属性，写set方法，然后在xml里面配置bean和property的值

在被依赖的类里写依赖类的set方法

###### 2----构造器注入 

定义一个有参构造器---类似于上面的属性注入

```java
package com.spring.demo03.entity;  
  
import com.spring.demo02.entity.Computer;  
  
public class Programmer {  
      
    private Computer computer;  
      
    public Programmer(Computer computer){  
        this.computer = computer;  
    }  
}
```



```java

package com.spring.demo03.entity;  
  
public class Computer {  
  
    private String brand;  
    private String color;  
    private String size;  
  
    public Computer(String brand, String color, String size) {  
        this.brand = brand;  
        this.color = color;  
        this.size = size;  
    }  
} 
```

上面两个类都有一个有参的构造器，接下来，在xml里面配置这两个bean，然后再配置构造器的参数值就可以了

```xml

<?xml version="1.0" encoding="UTF-8"?>  
  
<beans xmlns="http://www.springframework.org/schema/beans"  
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
    xsi:schemaLocation="http://www.springframework.org/schema/beans  
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">  
      
  <bean id="programmer" class="com.spring.demo3.entity.Programmer">  
    <constructor-arg ref="computer"></constructor-arg>  
  </bean>  
    
  <!-- 构造器里面没有name字段，只有value，是根据构造器的方法参数顺序来定义的 -->  
  <bean id="computer" class="com.spring.demo3.entity.Computer">  
    <constructor-arg value="联想"></constructor-arg>  
    <constructor-arg value="红色"></constructor-arg>  
    <constructor-arg value="15.6寸"></constructor-arg>  
  </bean>  
    
</beans> 
————————————————
版权声明：本文为CSDN博主「旧城以西林」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/zhaoraolin/article/details/78941062
```

###### 3----自动装配---注解---Autowried

```java
package com.spring.demo04.entity;  
  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Component;  
  
@Component  
public class Programmer {  
      
    @Autowired  
    Computer computer;  
}
```

```java
package com.spring.demo04.entity;  
  
import org.springframework.stereotype.Component;  
  
@Component  
public class Computer {  
    private String brand;  
    private String color;  
    private String size;
 
    public String getBrand() {  
        return brand;  
    }  
  
    public void setBrand(String brand) {  
        this.brand = brand;  
    }  
  
    public String getColor() {  
        return color;  
    }  
  
    public void setColor(String color) {  
        this.color = color;  
    }    
    public String getSize() {  
        return size;  
    }   
    public void setSize(String size) {  
        this.size = size;  
    }  
}
```

```xml

<?xml version="1.0" encoding="UTF-8"?>  
  
<beans xmlns="http://www.springframework.org/schema/beans"  
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
    xmlns:context="http://www.springframework.org/schema/context"  
    xsi:schemaLocation="http://www.springframework.org/schema/beans  
    http://www.springframework.org/schema/context   
    http://www.springframework.org/schema/context/spring-context-3.0.xsd   
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">  
      
    <context:component-scan base-pakage="com.spring.demo04">  
    
</beans>
原文链接：https://blog.csdn.net/zhaoraolin/article/details/78941062
```

@Component注解写在类上，

@Autowired注解写在需要注入的类中的对象属性上面，

xml中的配置的自动扫描会扫描所有的带有component注解的类，

<context:component-scan base-pakage="com.spring.demo04">  

//context:component-scan ---自动扫描

被@controller 、@service、@repository 、@component 注解的类，都会把这些类纳入进spring容器中进行管理

根据@Autowired名字找到对应的类进行注入

其他相关注解，

@Component用来注解在类上，分层后细化出来的各个层有具体的细分注解，能效新基本一样

@Service  ---服务层的注解

@Controller ---控制层

@Repository ---Dao层

建议在注解上加入别名，

```java
@Component("programmer")  
public class Programmer {  
      
    @Autowired  
    Computer computer;  
}
```


###### 其他相关注解

@Qualifier---

> 消除歧义，起别名
>
> 如果按照类型，自动装配的时候，不止一个匹配类型，使用qualifier注解指定一个别名，消除歧义

@Autowired

> 自动装配，**默认按类型**进行自动装配。

@ Required 

@Required注释为为了保证所对应的属性必须被设置，**@Required** 注释应用于 bean 属性的 setter 方法，它表明受影响的 bean 属性在配置时必须放在 XML 配置文件中，否则容器就会抛出一个 BeanInitializationException 异常。下面显示的是一个使用 @Required 注释的示例。*直接的理解就是，如果你在某个java类的某个set方法上使用了该注释，那么该set方法对应的属性在xml配置文件中必须被设置，否则就会报错！！！*

> 该依赖关系必须装配（手动或自动装配），否则将抛出BeanInitializationException异常。
>
> 异常如下：

```java
Caused by: org.springframework.beans.factory.BeanInitializationException: Property 'designation'is required for bean 'manager'

    at org.springframework.beans.factory.annotation.RequiredAnnotationBeanPostProcessor.postProcessPropertyValues(RequiredAnnotationBeanPostProcessor.java:156)

    at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1202)

    ... 11 more
```





##### 注意事项

1: 如果使用了构造器注入和setter属性注入，会覆盖掉自动装配的依赖关系，即，构造注入和setter注入大于自动装配。

2: 基本数据类型的值，字符串字面量，类字面量，无法使用自动装配注入

3:优先考虑使用显式的装配来进行更精确的依赖注入而不是使用自动装配 



####  面向切面（AOP）

面向切面编程：

​	从侧面切入到程序里，切面通常是一个类

基本概念

> 1：Aspect（切面）--通常是一个类，在里面定义切入点和通知

> 2：jointPoint （连接点）--程序执行过程中明确的点，一般是方法的调用
>
> 3：Advice（通知）AOP在特定的点上执行增强处理  //有before,after,afterReturning,afterThrowing,around
>
> 4：Pointcut（切入点）带有通知的连接点（jointpoint），在程序中主要体现为书写切入点表达式（写方法）
>
> 5：AOP代理：AOP框架创建的对象，代理就是对目标对象的增强，有两种AOP代理方式：JDK动态代理和CGLIB代理，JDK代理基于接口，CGLIB基于子类上

**通知方法:**

1. 前置通知:在我们执行目标方法之前运行(**@Before**)
2. 后置通知:在我们目标方法运行结束之后 ,不管有没有异常**(@After)**
3. 返回通知:在我们的目标方法正常返回值后运行**(@AfterReturning)**
4. 异常通知:在我们的目标方法出现异常后运行**(@AfterThrowing)**
5. 环绕通知:动态代理, 需要手动执行joinPoint.procced()(其实就是执行我们的目标方法执行之前相当于前置通知, 执行之后就相当于我们后置通知**(@Around)**

**Spring中的AOP代理还是离不开Spring的IOC容器，代理的生成，管理及其依赖关系都是由IOC容器负责，Spring默认使用JDK动态代理，在需要代理类而不是代理接口的时候，Spring会自动切换为使用CGLIB代理，不过现在的项目都是面向接口编程，所以JDK动态代理相对来说用的还是多一些。**

----------------------

**切面类**

```java

package com.enjoy.cap10.aop;
 
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
 
//日志切面类
@Aspect
public class LogAspects {
	@Pointcut("execution(public int com.enjoy.cap10.aop.Calculator.*(..))")
	public void pointCut(){};
	
	//@before代表在目标方法执行前切入, 并指定在哪个方法前切入
	@Before("pointCut()")
	public void logStart(){
		System.out.println("除法运行....参数列表是:{}");
	}
	@After("pointCut()")
	public void logEnd(){
		System.out.println("除法结束......");
	}
	@AfterReturning("pointCut()")
	public void logReturn(){
		System.out.println("除法正常返回......运行结果是:{}");
	}
	@AfterThrowing("pointCut()")
	public void logException(){
		System.out.println("运行异常......异常信息是:{}");
	}
	@Around("pointCut()")
	public Object Around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		System.out.println("@Arount:执行目标方法之前...");
		Object obj = proceedingJoinPoint.proceed();//相当于开始调div地
		System.out.println("@Arount:执行目标方法之后...");
		return obj;
	}
}
```

**目标方法**

```java

package com.enjoy.cap10.aop;
 
public class Calculator {
	//业务逻辑方法
	public int div(int i, int j){
		System.out.println("--------");
		return i/j;
	}
}
```

**配置类：**

```java
package com.enjoy.cap10.config; 
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import com.enjoy.cap10.aop.Calculator;
import com.enjoy.cap10.aop.LogAspects; 
@Configuration
@EnableAspectJAutoProxy
public class Cap10MainConfig {	
    @Bean	
    public Calculator calculator(){	
        return new Calculator();
    } 	
    @Bean	
    public LogAspects logAspects(){	
        return new LogAspects();	
    }
}
```

**测试类：**

```java
public class Cap10Test {
	@Test
	public void test01(){
		AnnotationConfigApplicationContext app = new AnnotationConfigApplicationContext(Cap10MainConfig.class);	
		Calculator c = app.getBean(Calculator.class);
		int result = c.div(4, 3);
		System.out.println(result);
		app.close();
	}
}
```

在这个注解比较流行的年代里,当我们想要使用spring 的某些功能时只需要加上一行代码就可以了,比如:

- @EnableAspectJAutoProxy开启AOP
- @EnableTransactionManagement开启spring事务管理,
- @EnableCaching开启spring缓存
- @EnableWebMvc 开启webMvc





### SpringMVC

设计思路

M - Model - 模型---传统架构中的pojo，Dao层和Service层

V - View - 视图----对模型数据进行展示，包 括  html，jsp，excel，pdf。json，xml等

C - Controller 控制器---用于衔接 模型和视图的之间的调度工作，servlet层

接收用户请求，拿给model做处理，处理完了把结果拿给view做渲染（将数据转发或者重定向到jsp或者html）

思路：

核心：前端控制器，DispatcharServlet 管理和分发用户发来的请求，

1、用户请求request====>

2、前端控制器DispatcharServlet拦截请求==>

3、DispatcharServlet拿到请求后调用处理器 映射器handlerMapping中去找对应的处理器handler===>

4、找到Handler后===>HandlerMapping将Handler返回，返回的是不仅仅是处理器Handler，还有一个拦截器链（处理器执行链）===>

> 此时，DispatcharServlet已经得到了Handler的目标

5、然后，DispatcharServlet--前端控制器--调用 处理器适配器 执行拿到的Handler==> ， 

> 处理器适配器的作用就是执行满足条件的处理器
>
> 处理器能被处理器适配器调用必须满足处理器适配器的要求

6、处理器适配器HandlerAdaptor 执行对应的处理器Handler==》handler调用模型model处理数据，并把执行结果返回给处理器适配器（结果为ModelAndView---视图模型）一般为逻辑视图名 如 list.jsp或者index.html。

7、处理器适配器HandlerAdaptor将结果（ModelAndView）返回给前端控制器DispatcharServlet，==》

8、前端控制器DispatchaServlet将结果ModelAndView 转换成视图，调用视图解析器解析成真正的视图(如jsp，html等)。

9、视图解析器返回真正的视图，前端控制器将拿到是视图与模型渲染到一起，然后将渲染好的视图响应给用户。

##### SpringMVC的组件

三大组件：HandlerMapping(处理器映射器)HandlerAdaptor(处理器适配器)ViewResolver(视图解析器)

手动组件：handler(处理器)是需要我们编写的主要的 View（视图）也是我们需要写的，也就是jsp或者html

核心组件：DispatcharServlet（前端控制器）



转发地址不会发生变化，重定向会

**开发方式**

1：配置前端控制器

2：在springMVC.xml中配置视图解析器

> 视图解析器需要配置前缀和后缀

```xml
<!-- 配置SpringMVC的视图解析器 -->
	<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!--前缀 -->
		<property name="prefix" value="/WEB-INF/jsp/"/>
		<!--前缀 -->
        <property name="suffix" value=".jsp"/>
	</bean>
	<!-- html视图解析器 必须先配置freemarkerConfig,注意html是没有prefix前缀属性的-->
    <bean id="freemarkerConfig" class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">  
        <property name="templateLoaderPath">  
            <value>/WEB-INF/html/</value>  
        </property>  
    </bean>  
```



3： 编写Controller 添加@Controller注解

4：编写Handler（Controller中的方法）添加@RequestMapping注解与url绑定

> @Controller添加在类上面，表明这个类是个处理器适配器
>
> @RequestMapping("/name")添加在这个类的方法上，表明这是个处理器handler

5：在SpringMVC.xml中配置Spring的全局扫描包

##### 配置详情

###### 1： web.xml 中必须配置的前端控制器，DispatcharServlet

```xml
	<!-- springMVC核心配置 -->
	<!-- 配置spring mvc的相关内容，此处的servlet-name任意，但必须有<your servlet-name>-servlet.xml与之对应 -->
	<servlet>
		<servlet-name>springMVC</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>classpath:springMVC-servlet.xml</param-value>
		</init-param>
		<!-- 启动顺序，让这个Servlet随Servlet容器一起启动。 -->
		<load-on-startup>1</load-on-startup>
	</servlet>
	<servlet-mapping>
		<servlet-name>springMVC</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
	<!-- 配置过滤器，同时把所有的请求都转为utf-8编码 -->
	<filter>
		<filter-name>characterEncodingFilter</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
		<init-param>
			<param-name>forceEncoding</param-name>
			<param-value>true</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>characterEncodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
```

**示例web.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://java.sun.com/xml/ns/javaee"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
	version="2.5">

	<!-- 读取spring配置文件 -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>
            classpath:applicationContext.xml
        </param-value>
	</context-param>
	<listener>
		<description>spring监听器</description>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<!-- 防止spring内存溢出监听器 -->
	<listener>
		<description>Introspector缓存清除监听器</description>
		<listener-class>org.springframework.web.util.IntrospectorCleanupListener</listener-class>
	</listener>

	<!-- springMVC核心配置 -->
	<!-- 配置spring mvc的相关内容，此处的servlet-name任意，但必须有<your servlet-name>-servlet.xml与之对应 -->
	<servlet>
		<servlet-name>springMVC</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>classpath:springMVC-servlet.xml</param-value>
		</init-param>
		<!-- 启动顺序，让这个Servlet随Servlet容器一起启动。 -->
		<load-on-startup>1</load-on-startup>
	</servlet>
	<servlet-mapping>
		<servlet-name>springMVC</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>

	<!-- 配置过滤器，同时把所有的请求都转为utf-8编码 -->
	<filter>
		<filter-name>characterEncodingFilter</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
		<init-param>
			<param-name>forceEncoding</param-name>
			<param-value>true</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>characterEncodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	<!-- 连接池 启用Web监控统计功能 start -->
	<filter>
		<filter-name>DruidWebStatFilter</filter-name>
		<filter-class>com.alibaba.druid.support.http.WebStatFilter</filter-class>
		<init-param>
			<param-name>exclusions</param-name>
			<param-value>*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>DruidWebStatFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	<servlet>
		<servlet-name>DruidStatView</servlet-name>
		<servlet-class>com.alibaba.druid.support.http.StatViewServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>DruidStatView</servlet-name>
		<url-pattern>/druid/*</url-pattern>
	</servlet-mapping>
	<!-- 连接池 启用Web监控统计功能 end -->
	<servlet>
		<description></description>
		<display-name>UploadAction</display-name>
		<servlet-name>UploadAction</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.UploadAction</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>UploadAction</servlet-name>
		<url-pattern>/UploadAction</url-pattern>
	</servlet-mapping>
	<!-- 钉钉配置开始 -->
	<servlet>
		<display-name>UserInfoServlet</display-name>
		<servlet-name>UserInfoServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.UserInfoServlet</servlet-class>
	</servlet>
	<servlet>
		<display-name>UserInfoPcServlet</display-name>
		<servlet-name>UserInfoPcServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.UserInfoPcServlet</servlet-class>
	</servlet>
	<servlet>
		<display-name>UserInfoWmServlet</display-name>
		<servlet-name>UserInfoWmServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.UserInfoWmServlet</servlet-class>
	</servlet>
	<servlet>
		<display-name>ContactsServlet</display-name>
		<servlet-name>ContactsServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.ContactsServlet</servlet-class>
	</servlet>
	<servlet>
		<display-name>OAoauth</display-name>
		<servlet-name>OAoauth</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.OAoauth</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>OAoauth</servlet-name>
		<url-pattern>/dingding/OAoauth</url-pattern>
	</servlet-mapping>
	<servlet>
		<display-name>IsvReceiveServlet</display-name>
		<servlet-name>IsvReceiveServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.IsvReceiveServlet</servlet-class>
	</servlet>
	<servlet>
		<display-name>EventChangeReceiveServlet</display-name>
		<servlet-name>EventChangeReceiveServlet</servlet-name>
		<servlet-class>com.alibaba.dingtalk.openapi.servlet.EventChangeReceiveServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>UserInfoServlet</servlet-name>
		<url-pattern>/dingding/userinfo</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>UserInfoWmServlet</servlet-name>
		<url-pattern>/dingding/userinfowm</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>ContactsServlet</servlet-name>
		<url-pattern>/dingding/contactsinfo</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>UserInfoPcServlet</servlet-name>
		<url-pattern>/dingding/userinfoPc</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>IsvReceiveServlet</servlet-name>
		<url-pattern>/dingding/isvreceive</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>EventChangeReceiveServlet</servlet-name>
		<url-pattern>/dingding/eventreceive</url-pattern>
	</servlet-mapping>

	<!-- 钉钉配置结束 -->
	<!-- 配置session超时时间，单位分钟 -->
	<session-config>
		<session-timeout>300</session-timeout>
	</session-config>

	<welcome-file-list>
		<welcome-file>index.jsp</welcome-file>
	</welcome-file-list>
</web-app>
```



###### 2： 在SpringMVC.xml中配置

设置注解驱动：用来替代xml中处理器和适配器的配置

```xml
  <mvc:annotation-driven>	<!-- 设置之前需要先开启注解驱动-->
```

设置静态资源访问路径

1：设置拦截请求，拦截指定后缀(如.du， .action等)。放行所有资源（修改前端控制器拦截url）

```xml
<!-- 这是web.xml中的配置，配置前端控制器DispatcharServlet拦截请求 -->	
<servlet-mapping>
		<servlet-name>springMVC</servlet-name>
		<!-- "/"配置是默认拦截所有的请求，静态资源文件也会被拦截想要访问css/js文件和改为拦截指定后缀，这样其他的就会被放行，，若是用“/*” 则.jsp/.html也会被拦截，属于非法请求 -->
        <url-pattern>/</url-pattern>
	</servlet-mapping>
```

2 ：放行所有静态资源

```xml
	<mvc:annotation-driven/><!-- 注解驱动 -->
<!--或者使用这个<mvc:annotation-driven></mvc:annotation-driven> -->	
<mvc:default-servlet-handler/><!-- 默认所有静态资源全部放行 -->
```



3：配置静态资源路径

```xml
<mvc:default-servlet-handler/><!-- 默认所有静态资源全部放行 -->
	
	<context:component-scan base-package="com.skzc.controller" /><!-- 扫描包 -->
     <!-- 对静态资源文件的访问  restful-->     
	<mvc:resources mapping="/admin/**" location="/,/admin/" />
	<mvc:resources mapping="/static/**" location="/,/static/" />
	<mvc:resources mapping="/plugins/**" location="/,/plugins/" />
	<mvc:resources mapping="/upload/**" location="/,/upload/" />
	<mvc:resources mapping="/uploadFiles/**" location="/,/uploadFiles/" /> 
	<mvc:resources mapping="/lib/**" location="/,/lib/" />
```

##### SpringMVC主要配置： 

​	1：扫描包 ---- 扫描controller下的组件

​	2： 注解驱动

​	3： 放行静态文件

​	4： 视图解析器

 **SpringMVC.xml示例**

```xml
<?xml version="1.0" encoding="UTF-8"?>  
<beans xmlns="http://www.springframework.org/schema/beans"  
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
    xmlns:context="http://www.springframework.org/schema/context"  
    xmlns:aop="http://www.springframework.org/schema/aop" 
    xmlns:tx="http://www.springframework.org/schema/tx"
    xmlns:mvc="http://www.springframework.org/schema/mvc"  
    xsi:schemaLocation="http://www.springframework.org/schema/beans 
                        http://www.springframework.org/schema/beans/spring-beans.xsd  
                        http://www.springframework.org/schema/context 
                        http://www.springframework.org/schema/context/spring-context-4.0.xsd  
                        http://www.springframework.org/schema/mvc 
                        http://www.springframework.org/schema/mvc/spring-mvc-4.0.xsd
                        http://www.springframework.org/schema/aop 
                        http://www.springframework.org/schema/aop/spring-aop-4.0.xsd 
                        http://www.springframework.org/schema/tx 
                        http://www.springframework.org/schema/tx/spring-tx-4.0.xsd">
     <!--自动扫描的包名 -->
	<mvc:annotation-driven/>	
	<mvc:default-servlet-handler/>
	
	<context:component-scan base-package="com.skzc.controller" />
     <!-- 对静态资源文件的访问  restful-->     
	<mvc:resources mapping="/admin/**" location="/,/admin/" />
	<mvc:resources mapping="/static/**" location="/,/static/" />
	<mvc:resources mapping="/plugins/**" location="/,/plugins/" />
	<mvc:resources mapping="/upload/**" location="/,/upload/" />
	<mvc:resources mapping="/uploadFiles/**" location="/,/uploadFiles/" /> 
	<mvc:resources mapping="/lib/**" location="/,/lib/" />

    <!-- 配置SpringMVC的视图解析器 -->
	<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/jsp/"/>
		<property name="suffix" value=".jsp"/>
	</bean>
	<!-- html视图解析器 必须先配置freemarkerConfig,注意html是没有prefix前缀属性的-->
    <bean id="freemarkerConfig" class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">  
        <property name="templateLoaderPath">  
            <value>/WEB-INF/html/</value>  
        </property>  
    </bean>  
     <bean id="htmlviewResolver"  
        class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">  
        <property name="suffix" value=".html" /> 
        <property name="contentType" value="text/html;charset=UTF-8"></property>         
    </bean>  
	<bean id="exceptionResolver" class="com.skzc.resolver.MyExceptionResolver"></bean>
	<!-- 上传拦截，如最大上传值及最小上传值 -->
	  <bean id="multipartResolver"   class="org.springframework.web.multipart.commons.CommonsMultipartResolver" >   
		  <property name="maxUploadSize">    
	          <value>104857600</value>    
	       </property>   
	        <property name="maxInMemorySize">    
	            <value>4096</value>    
	        </property>   
	         <property name="defaultEncoding">    
	            <value>utf-8</value>    
	        </property> 
    </bean>  
    <mvc:annotation-driven>
    <mvc:message-converters>
      <ref bean="jsonConverter"/>
      <ref bean="stringHttpMessageConverter"/>
    </mvc:message-converters>
  </mvc:annotation-driven>
<aop:aspectj-autoproxy proxy-target-class="true"/>
  <mvc:default-servlet-handler/>

  <bean id="stringHttpMessageConverter"
        class="org.springframework.http.converter.StringHttpMessageConverter">
    <property name="supportedMediaTypes">
      <list>
        <value>text/html;charset=UTF-8</value>
        <value>text/plain;charset=UTF-8</value>
      </list>
    </property>
  </bean>

  <bean id="jsonConverter"
        class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
    <property name="supportedMediaTypes" value="application/json"/>
  </bean>
 
</beans>

```



## mybatis

1： 配置文件

​	1：MybaitisConfig.xml  ------ （唯一   核心配置文件）

​		数据源（连接名，密码...），事务，别名

Mapper.xml 映射文件（多个）

​		指定  表与实体 以及  表中字段 以及  实体属性  的映射关系

2：SQlSessionFactory

​	管理SqlSession

3 ：Sqlsession

​	面向程序员的接口，向数据库进行增删改查

4：Executor（执行器）

5：MappedStatement （具体的sql语句）

​		需要设置： 输入参数：HashMap，String ，Integer ，pojo/bean

​							输出参数：HashMap，String ，Integer ，pojo/bean

**在Mapper.XML中 SQL拼接用${value} 占位符#{id/name}替换原始的？占位**

SQL拼接：${value} 简单类型，只能用value，不能写别的，会造成SQL注入，不推荐

占位符   ：#{name}







# 注解

### @RequestMapping

@RequestMapping 是一个用来**处理请求地址映射**的注解，可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径；用于方法上，表示在类的父路径下追加方法上注解中的地址将会访问到该方法，此处需注意@RequestMapping**用在类上可以没用，但是用在方法上必须有**。

### @Responsebody

@Responsebody 注解表示**该方法的返回的结果直接写入 HTTP 响应正文（ResponseBody）中**，一般在异步获取数据时使用，通常是在使用 @RequestMapping 后，返回值通常解析为跳转路径，加上 @Responsebody 后返回结果不会被解析为跳转路径，而是直接写入HTTP 响应正文中。 
作用： 
该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。 
使用时机： 
返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用；

```js
// 当页面发出异步请求：
function login() {
    var datas = '{"username":"' + $('#username').val() + '","userid":"' + $('#userid').val() + '","status":"' + $('#status').val() + '"}';
    $.ajax({
        type : 'POST',
        contentType : 'application/json',
        url : "${pageContext.request.contextPath}/user/login",
        processData : false,
        dataType : 'json',
        data : datas,
        success : function(data) {
            alert("userid: " + data.userid + "username: " + data.username + "status: "+ data.status);
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert("出现异常，异常信息："+textStatus,"error");
        }
    });
};
```

--

```java
@RequestMapping(value = "user/login")
@ResponseBody
// 将ajax（datas）发出的请求写入 User 对象中,返回json对象响应回去
public User login(User user) {   
    User user = new User();
    user .setUserid(1);
    user .setUsername("MrF");
    user .setStatus("1");
    return user ;
}
//异步获取 json 数据，加上 @Responsebody 注解后，就会直接返回 json 数据。
```

### @RequestBody

接收前端请求

 @RequestBody主要用来接收前端传递给后端的json字符串中的数据的(请求体中的数据的)；GET方式无请求体，所以使用@RequestBody接收数据时，前端不能使用GET方式提交数据，而是用POST方式进行提交。在后端的同一个接收方法里，@RequestBody与@RequestParam()可以同时使用，@RequestBody最多只能有一个，而@RequestParam()可以有多个。

注：一个请求，只有一个RequestBody；一个请求，可以有多个RequestParam。

注：当同时使用@RequestParam（）和@RequestBody时，@RequestParam（）指定的参数可以是普通元素、
       数组、集合、对象等等(即:当，@RequestBody 与@RequestParam()可以同时使用时，原SpringMVC接收
       参数的机制不变，只不过RequestBody 接收的是请求体里面的数据；而RequestParam接收的是key-value
       里面的参数，所以它会被切面进行处理从而可以用普通元素、数组、集合、对象等接收)。
       即：如果参数时放在请求体中，传入后台的话，那么后台要用@RequestBody才能接收到；如果不是放在
              请求体中的话，那么后台接收前台传过来的参数时，要用@RequestParam来接收，或则形参前
              什么也不写也能接收。

注：如果参数前写了@RequestParam(xxx)，那么前端必须有对应的xxx名字才行(不管其是否有值，当然可以通
       过设置该注解的required属性来调节是否必须传)，如果没有xxx名的话，那么请求会出错，报400。

注：如果参数前不写@RequestParam(xxx)的话，那么就前端可以有可以没有对应的xxx名字才行，如果有xxx名
       的话，那么就会自动匹配；没有的话，请求也能正确发送。
       追注：这里与feign消费服务时不同；feign消费服务时，如果参数前什么也不写，那么会被默认是
                  @RequestBody的。

如果后端参数是一个对象，且该参数前是以@RequestBody修饰的，那么前端传递json参数时，必须满足以下要求：

后端@RequestBody注解对应的类在将HTTP的输入流(含请求体)装配到目标类(即：@RequestBody后面的类)时，会根据json字符串中的key来匹配对应实体类的属性，如果匹配一致且json中的该key对应的值符合(或可转换为)，这一条我会在下面详细分析，其他的都可简单略过，但是本文末的核心逻辑代码以及几个结论一定要看！ 实体类的对应属性的类型要求时,会调用实体类的setter方法将值赋给该属性。

json字符串中，如果value为""的话，后端对应属性如果是String类型的，那么接受到的就是""，如果是后端属性的类型是Integer、Double等类型，那么接收到的就是null。

json字符串中，如果value为null的话，后端对应收到的就是null。

如果某个参数没有value的话，在传json字符串给后端时，要么干脆就不把该字段写到json字符串中；要么写value时， 必须有值，null  或""都行。千万不能有类似"stature":，这样的写法


### @RequestBody与前端传过来的json数据的匹配规则
声明：根据不同的Content-Type等情况,Spring-MVC会采取不同的HttpMessageConverter实现来进行信息转换解析。
          下面介绍的是最常用的：前端以Content-Type 为application/json,传递json字符串数据;后端以@RequestBody模型接收数据的情况。

解析json数据大体流程概述：
        Http传递请求体信息，最终会被封装进com.fasterxml.jackson.core.json.UTF8StreamJsonParser中(提示：Spring采用CharacterEncodingFilter设置了默认编码为UTF-8)，然后在public class BeanDeserializer extends BeanDeserializerBase implements java.io.Serializable中，通过 public Object deserializeFromObject(JsonParser p, DeserializationContext ctxt) throws IOException方法进行解析。
————————————————
版权声明：本文为CSDN博主「justry_deng」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/justry_deng/article/details/80972817



------

####  小技巧之指定模型中的属性对应什么key
这里简单介绍，更多的可参考：
结论①：@JsonAlias注解，实现:json转模型时，使json中的特定key能转化为特定的模型属性;但是模型转json时，
               对应的转换后的key仍然与属性名一致，见：上图示例中的name字段的请求与响应。
                  此时，json字符串转换为模型时，json中key为Name或为name123或为name的都能识别。

结论②：@JsonProperty注解，实现：json转模型时，使json中的特定key能转化为指定的模型属性；同样的，模
               型转json时，对应的转换后的key为指定的key，见：示例中的motto字段的请求与响应。
               以下图进一步说明：



               此时，json字符串转换为模型时，key为MOTTO的能识别，但key为motto的不能识别。

结论③：@JsonAlias注解需要依赖于setter、getter，而@JsonProperty注解不需要。

结论④：在不考虑上述两个注解的一般情况下，key与属性匹配时,默认大小写敏感。

结论⑤：有多个相同的key的json字符串中，转换为模型时，会以相同的几个key中，排在最后的那个key的值给模
               型属性复制，因为setter会覆盖原来的值。见示例中的gender属性。

结论⑥：后端@RequestBody注解对应的类在将HTTP的输入流(含请求体)装配到目标类(即:@RequestBody后面
               的类)时，会根据json字符串中的key来匹配对应实体类的属性，如果匹配一致且json中的该key对应的值
               符合(或可转换为)实体类的对应属性的类型要求时，会调用实体类的setter方法将值赋给该属性。
————————————————
版权声明：本文为CSDN博主「justry_deng」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/justry_deng/article/details/80972817

##  responsebody示例



> ```
> @RequestMapping(value = "/test")//类级别映射，可以没有，一般用于减少书写量
> public class myController {
>     //方法级别映射，必须有，那么这个方法的访问地址就是/test/aaa，请求到的页面就是test.jsp【当然，这里的.jsp需要在配置文件中配置】
>     @RequestMapping(value = "/aaa")
>     public String getMyName() {
>         return "test";
>     }
> }
> ```
>
> ![复制代码](https://common.cnblogs.com/images/copycode.gif)

那么 @ResponseBody呢？

> @ResponseBody是作用在方法上的，@ResponseBody 表示该方法的返回结果直接写入 HTTP response body 中，一般在异步获取数据时使用【也就是AJAX】，在使用 @RequestMapping后，返回值通常解析为跳转路径，但是加上 @ResponseBody 后返回结果不会被解析为跳转路径，而是直接写入 HTTP response body 中。 比如异步获取 json 数据，加上 @ResponseBody 后，会直接返回 json 数据。@RequestBody 将 HTTP 请求正文插入方法中，使用适合的 HttpMessageConverter 将请求体写入某个对象。

举个例子：

> 前台异步请求：
>
> ![复制代码](https://common.cnblogs.com/images/copycode.gif)
>
> ```json
> function loginAction() {
> 
>     // 获取用户输入的账号和密码
>     var name = $('#count').val();
>     var password = $('#password').val();
> 
>     $.ajax({
>         url : 'account/login.do',
>         type : 'post',
>         // data对象中的属性名要和服务端控制器的参数名一致 login(name, password)
>         data : {
>             'name' : name,
>             'password' : password
>         },
>         dataType : 'json',
>         success : function(result) {
>             if (result.state == 0) {
>                 // 登录成功，设置cookie并跳转edit.html
>                 addCookie('userId', result.data.id);
>                 addCookie('nick', result.data.nick);
>                 location.href = 'edit.html';
>             } else {
>                 // 登录失败
>                 var msg = result.message;
>                 $('#sig_in').next().html(msg);
>                 $('#sig_in').next().css("color", "red");
>             }
>         },
>         error : function(e) {
>             alert("系统异常");
>         }
>     });
>     $('#password').val("");
> }
> ```
>
> ![复制代码](https://common.cnblogs.com/images/copycode.gif)
>
> 后台 Controller类中对应的方法：
>
> ![复制代码](https://common.cnblogs.com/images/copycode.gif)
>
> ```java
>     @RequestMapping("/login.do")
>     @ResponseBody
>     public Object login(String name, String password, HttpSession session) {
>         user = userService.checkLogin(name, password);
>         session.setAttribute("user", user);
>         return new JsonResult(user);
>     }
> ```
>
> ![复制代码](https://common.cnblogs.com/images/copycode.gif)
>
>  

@RequestBody呢？

> ​      @RequestBody是作用在形参列表上，用于将前台发送过来固定格式的数据【xml 格式或者 json等】封装为对应的 JavaBean 对象，封装时使用到的一个对象是系统默认配置的 HttpMessageConverter进行解析，然后封装到形参上。

比如上面的登录后台代码可以改为：

> ![复制代码](https://common.cnblogs.com/images/copycode.gif)
>
> ```java
>     @RequestMapping("/login.do")
>     @ResponseBody
>     public Object login(@RequestBody User loginUuser, HttpSession session) {
>         user = userService.checkLogin(loginUser);
>         session.setAttribute("user", user);
>         return new JsonResult(user);
>     }
> ```

# 反射

间接的操作目标对象的机制，核心是jvm在运行的时候才动态加载类，并且，对于任何一个类，能够知道这个方法的所有属性和方法，不需要提前在编译器知道要运行的对象是谁，

想要获取的时候执行

## 获取对象的三种方法

​	1：class1=  Class.forName（String className）;//常用！！className需要是全路径（带包名字的类路径）

​	2：class2 =  className.getClass();		//对象名.getClass;

​	3：class3=className.class					 //对象名.class;

### 获取类内部的成员方法/变量

#### 构造方法

class1.getConstructors（）；//所有公有构造方法

class1.getDeclaredConstructors (); //获取所有的构造方法，包括私有，受保护，默认的，

class1.getConstructor(null);//获取公有且无参的构造，null可以不写

class1.getDeclaredConstructor(); //方法尾不带s，获取私有的构造方法，并调用，

constructor（构造方法）

#### 成员变量

class1.getFields();// 所有的公有字段

class1.getDeclaredFields(); //all 所有字段，包括私有受保护

class1.getDeclareField(); // 所有的私有字段

获取方法同理  :   getDeclareMethod();



​	

