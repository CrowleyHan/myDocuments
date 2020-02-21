# SSM项目搭建

## 1：POM文件的依赖

下面这个是pom配置的基本内容

~~~xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>org.example</groupId>
  <artifactId>SSMDemo</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>war</packaging>

  <name>SSMDemo Maven Webapp</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
    <spring.version>5.1.5.RELEASE</spring.version>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.apache.tomcat/tomcat-catalina -->
    <!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>4.0.1</version>
      <scope>provided</scope>
    </dependency>

    <!-- Spring套餐-->
    <!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-beans</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-core</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-aop</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>${spring.version}</version>
  </dependency>
<!--    SpringMVC依赖-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-web</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-webmvc</artifactId>
      <version>${spring.version}</version>
    </dependency>
<!--    数据库连接工具-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-aspects</artifactId>
      <version>${spring.version}</version>

    </dependency>

    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jms</artifactId>
      <version>${spring.version}</version>

    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context-support</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.freemarker</groupId>
      <artifactId>freemarker</artifactId>
      <version>2.3.23</version>
    </dependency>
    <!--必备工具类commons-lang3-->
    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-lang3</artifactId>
      <version>3.7</version>
    </dependency>
  <!--  fastjson,json序列化，json工具包  -->
    <!-- https://mvnrepository.com/artifact/com.alibaba/fastjson -->
    <dependency>
      <groupId>com.alibaba</groupId>
      <artifactId>fastjson</artifactId>
      <version>1.2.62</version>
    </dependency>
    <!-- https://mvnrepository.com/artifact/junit/junit -->
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.12</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>commons-io</groupId>
      <artifactId>commons-io</artifactId>
      <version>2.6</version>
    </dependency>
<!--    mybatis -->
    <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.4.6</version>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis-spring</artifactId>
      <version>1.3.2</version>
    </dependency>
<!--   连接池   -->
    <!-- https://mvnrepository.com/artifact/com.alibaba/druid -->
    <dependency>
      <groupId>com.alibaba</groupId>
      <artifactId>druid</artifactId>
      <version>1.1.16</version>
    </dependency>
    <!--logback好的日志-->
    <dependency>
      <groupId>ch.qos.logback</groupId>
      <artifactId>logback-classic</artifactId>
      <version>1.2.3</version>
    </dependency>
    <dependency>
      <groupId>org.logback-extensions</groupId>
      <artifactId>logback-ext-spring</artifactId>
      <version>0.1.4</version>
    </dependency>
    <dependency>
      <groupId>org.slf4j</groupId>
      <artifactId>jcl-over-slf4j</artifactId>
      <version>1.7.25</version>
    </dependency>
    <!-- 上传组件 -->
    <dependency>
      <groupId>commons-fileupload</groupId>
      <artifactId>commons-fileupload</artifactId>
      <version>1.3.3</version>
    </dependency>
    <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>6.0.6</version>
    </dependency>

    <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpcore</artifactId>
      <version>4.4.5</version>
    </dependency>

    <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpclient</artifactId>
      <version>4.5.2</version>
    </dependency>
  </dependencies>

  <build>
<!--    <finalName>SSMDemo</finalName>-->
    <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
      <plugins>
        <plugin>
          <groupId>org.apache.tomcat.maven</groupId>
          <artifactId>tomcat7-maven-plugin</artifactId>
          <version>2.2</version>
          <configuration>
            <hostName>localhost</hostName>        <!--   Default: localhost -->
            <port>8088</port>                     <!-- 启动端口 Default:8080 -->
            <path>/</path>   <!-- 访问应用路径  Default: /${project.artifactId}-->
            <uriEncoding>UTF-8</uriEncoding>      <!-- uri编码 Default: ISO-8859-1 -->
          </configuration>
        </plugin>
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
        <!-- see http://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_war_packaging -->
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.8.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.22.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-war-plugin</artifactId>
          <version>3.2.2</version>
        </plugin>
<!--        <plugin>-->
<!--          <groupId>org.apache.tomcat.maven</groupId>-->
<!--          <artifactId>tomcat7-maven-plugin</artifactId>-->
<!--          <version>2.2</version>-->
<!--        </plugin>-->
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>

        </plugin>
      </plugins>
    </pluginManagement>
  </build>
</project>

~~~

## 2：mapping.xml文件

#### 配置mapping.xml要注意的地方：

1：resultmao的类型的映射：

>  1：jdbcType对应的只识别大写：int型要写成INTEGER 
>
> 2：jdbcType 的时间类型：TIMESTAMP

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.ssm.dao.UserDao" >
    <resultMap id="userResultMap" type="com.ssm.beans.BookUser" >
            <id column="id" property="id" jdbcType="VARCHAR"/>
        <result column="id" property="id" jdbcType="VARCHAR"/>
        <result column="username" property="username" jdbcType="VARCHAR"/>
        <result column="password" property="password" jdbcType="VARCHAR"/>
        <result column="gender" property="gender" jdbcType="INTEGER"/>
        <result column="userlevel" property="userlevel" jdbcType="INTEGER"/>
        <result column="exp_text" property="exp_text" jdbcType="VARCHAR"/>
        <result column="usertype" property="usertype" jdbcType="INTEGER"/>
        <result column="creat_time" property="create_time" jdbcType="TIMESTAMP"/>
    </resultMap>

    <select id="selectAllUser" resultMap="userResultMap" >
        select * from tb_user
    </select>

    <select id="selectUser" resultType="com.ssm.beans.BookUser" parameterType="com.ssm.beans.BookUser">
        select * from tb_user where username=${username}and password=${password}
    </select>
    <insert id="adduser" parameterType="com.ssm.beans.BookUser">
        insert  into  tb_user (id,username,password,gender,userlevel,exp_text,usertype,creat_time)
        value (#{id},#{username},#{password},#{gender},#{userlevel},#{exp_text},#{usertype},#{create_time})
    </insert>

    <delete id="removeuser" parameterType="com.ssm.beans.BookUser">
        delete from tb_user where username=#{username}

    </delete>

        <update id="updateuser" parameterType="com.ssm.beans.BookUser">
            update tb_user set username=#{username} where id=#{id}
        </update>


</mapper>

```



## 3：web.xml配置

这个文件主要配置的是springMVC的相关属性：

> 1：加载springMVC.xml的配置文件
>
> 2：拦截器，设置拦截所有请求或者指定请求
>
> 3：配置请求的编码，防止乱码
>
> 4：监听器：ContextLoaderListener监听器的作用就是启动Web容器时，自动装配ApplicationContext的配置信息。因为它实现了ServletContextListener这个接口，在web.xml配置这个监听器，启动容器时，就会默认执行它实现的方法

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
         version="2.5">
  <display-name>Archetype Created Web Application</display-name>
<!-- 读取 spring 核心配置文件   -->
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:applicationContext.xml</param-value>
</context-param>
<!-- j监听器-->
    <listener>

        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
<!--  防止内存溢出监听器-->
    <listener>
        <listener-class>org.springframework.web.util.IntrospectorCleanupListener</listener-class>
    </listener>
<!--    SpringMVC核心配置-->
    <!-- 配置spring mvc的相关内容，此处的servlet-name任意，但必须有<your servlet-name>-servlet.xml与之对应 -->
<!--    <servlet-mapping>-->
<!--        <servlet-name>default</servlet-name>-->
<!--        <url-pattern>*.html</url-pattern>-->
<!--    </servlet-mapping>-->
<!--    <servlet-mapping>-->
<!--        <servlet-name>default</servlet-name>-->
<!--        <url-pattern>*.jpg</url-pattern>-->
<!--    </servlet-mapping>-->
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
    <servlet-name>springMVC</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:springMVC-servlet.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>

</servlet>

<!--  .do 拦截do  结尾的请求    / 拦截所有请求jsp除外    /* 拦截所有请求  -->
    <servlet-mapping>
    <servlet-name>springMVC</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>




<!--   字符编码：   -->
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

</web-app>

~~~

## 4：springmvc.xml配置

1：配置请求乱码

2：配置mvc的资源放行：

> ```xml
> <!-- 请求乱码的配置必须要写在下面这两行配置之前-->
> <!--自动扫描的包名 -->
> <mvc:annotation-driven/><!--放行所有资源-->
> <mvc:default-servlet-handler/>
> <!-- 放行指定的静态资源-->
>  <mvc:resources location="WEB-INF/jsp/" mapping="WEB-INF/jsp/**"/>
> ```
> 

3：配置视图解析器：格式固定，直接拷贝



~~~xml
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




<!--&lt;!&ndash;   返回乱码处理办法：这个bean必须写在 <mvc: annotation-dirven>   之前才能生效    &ndash;&gt;-->
    <bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter">
        <property name="messageConverters">
            <list>
                <bean class="org.springframework.http.converter.StringHttpMessageConverter">
                    <property name="supportedMediaTypes">
                        <list>
                            <value>text/plain;charset=UTF-8</value>
                            <value>text/html;charset=UTF-8</value>
                            <value>applicaiton/javascript;charset=UTF-8</value>
                        </list>
                    </property>
                </bean>
            </list>
        </property>
    </bean>
    <!--自动扫描的包名 -->
    <mvc:annotation-driven/>
    <mvc:default-servlet-handler/>
<!--    <mvc:resources mapping="/*" location="/**"/>-->
    <mvc:resources location="WEB-INF/jsp/" mapping="WEB-INF/jsp/**"/>
    <mvc:resources location="/static/" mapping="static/**"/>
    <context:component-scan base-package="com.ssm.controller" />
    <aop:aspectj-autoproxy proxy-target-class="true"/>
<!--    <mvc:annotation-driven>-->
<!--        <mvc:message-converters>-->
<!--&lt;!&ndash;            <ref bean="jsonConverter"/>&ndash;&gt;-->
<!--            <ref bean="stringHttpMessageConverter"/>-->
<!--        </mvc:message-converters>-->
<!--    </mvc:annotation-driven>-->
    <bean id="stringHttpMessageConverter"
          class="org.springframework.http.converter.StringHttpMessageConverter">
        <property name="supportedMediaTypes">
            <list>
                <value>text/html;charset=UTF-8</value>
                <value>text/plain;charset=UTF-8</value>
            </list>
        </property>
    </bean>

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

    <!--    <bean id="exceptionResolver" class="com.skzc.resolver.MyExceptionResolver"></bean>-->
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
    <!--    <bean id="jsonConverter"-->
<!--          class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">-->
<!--        <property name="supportedMediaTypes" value="application/json"/>-->
<!--    </bean>-->





</beans>
~~~

## 5：applicationContext.xml配置

1： 配置注解驱动，<context:component-scan base-package="com.ssm"/>

> 扫描指定目录下所有注解

2： 加载所有的properties配置文件：

>  如：数据库配置datesource

3：配置sqlSessionFactory

4：装配所有的mapping接口也称为Dao接口（解控内需要注入sqlSessionFactory）

5：配置-注解切面事务：使用@Transactional注解注解

> Spring的AOP即声明式事务管理默认是针对unchecked exception回滚。Spring的事务边界是在调用业务方法之前开始的，业务方法执行完毕之后来执行commit or rollback(Spring默认取决于是否抛出runtimeException)。
>
> 如果你在方法中有try{}catch(Exception e){}处理，那么try里面的代码块就脱离了事务的管理，若要事务生效需要在catch中throw new RuntimeException ("xxxxxx");
> ————————————————
> 版权声明：本文为CSDN博主「范学博」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
> 原文链接：https://blog.csdn.net/fanxb92/article/details/81296005

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.alibaba.com/schema/stat"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
        http://www.alibaba.com/schema/stat
        http://www.alibaba.com/schema/stat.xsd
  http://www.springframework.org/schema/aop
			http://www.springframework.org/schema/aop/spring-aop.xsd
			http://www.springframework.org/schema/tx
			http://www.springframework.org/schema/tx/spring-tx.xsd
">

<!--   注解驱动    -->
    <context:component-scan base-package="com.ssm"/>

<!-- 将配置文件读取到容器中，交给spring管理   -->
<!--   暂时不会这个方法，先注释掉  -->
        <bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
    <property name="locations">
        <list>
            <value>classpath:configs/jdbc.properties</value>
            <value>classpath:configs/redis.properties</value>
            <value>classpath:configs/wx.properties</value>
        </list>
    </property>
    </bean>
<!--  加载这个jdbc.properties，  -->
<!--<context:property-placeholder  location="classpath:configs/jdbc.properties"/>-->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource" init-method="init" destroy-method="close">
        <property name="url" value="${jdbc_url}" />
        <property name="username" value="${jdbc_username}" />
        <property name="password" value="${jdbc_password}" />

        <property name="filters" value="stat" />

        <property name="maxActive" value="20" />
        <property name="initialSize" value="1" />
        <property name="maxWait" value="60000" />
        <property name="minIdle" value="1" />

        <property name="timeBetweenEvictionRunsMillis" value="60000" />
        <property name="minEvictableIdleTimeMillis" value="300000" />

        <property name="testWhileIdle" value="true" />
        <property name="testOnBorrow" value="false" />
        <property name="testOnReturn" value="false" />

        <property name="poolPreparedStatements" value="true" />
        <property name="maxOpenPreparedStatements" value="20" />

        <property name="asyncInit" value="true" />
    </bean>

<!--  配置Sessionfactory   -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource"/>
<!--     自动扫描mapping.xml文件   -->
        <property name="mapperLocations" value="classpath:mappings/*.xml"/>

    </bean>
<!--   自动装配Dao接口-->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com.ssm"/><!-- DAO接口所在包名，Spring会自动查找其下的类 -->
        <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>

    </bean>
<!--<bean class="org.mybatis.spring.mapper.MapperFactoryBean">-->
<!--    <property name="mapperInterface" value="com.ssm.dao.UserDao"/>-->
<!--</bean>-->

<!--     声明事务管理   -->
<!--    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">-->
<!--        <property name="dataSource" ref="datasource"/>-->

<!--    </bean>-->
<!--     注解切面事务   -->
    <context:component-scan base-package="com.ssm"/>
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>
<!--    <tx:annotation-driven  transcation-manager="transactionManager" />-->
</beans>
~~~



## 6 logback.xml 日志框架配置

**配置的详细说明见gitee的Wordlist**

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">

    <!--定义日志文件的存储地址 勿在 LogBack 的配置中使用相对路径-->
    <property name="LOG_HOME" value="/home" />

    <!--控制台日志， 控制台输出 -->
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度,%msg：日志消息，%n是换行符-->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
        </encoder>
    </appender>

    <!--文件日志， 按照每天生成日志文件 -->
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名-->
            <FileNamePattern>${LOG_HOME}/TestWeb.log.%d{yyyy-MM-dd}.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
        </encoder>
        <!--日志文件最大的大小-->
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <MaxFileSize>10MB</MaxFileSize>
        </triggeringPolicy>
    </appender>

    <!-- show parameters for hibernate sql 专为 Hibernate 定制 -->
    <logger name="org.hibernate.type.descriptor.sql.BasicBinder" level="TRACE" />
    <logger name="org.hibernate.type.descriptor.sql.BasicExtractor" level="DEBUG" />
    <logger name="org.hibernate.SQL" level="DEBUG" />
    <logger name="org.hibernate.engine.QueryParameters" level="DEBUG" />
    <logger name="org.hibernate.engine.query.HQLQueryPlan" level="DEBUG" />

    <!--myibatis log configure-->
    <logger name="com.apache.ibatis" level="TRACE"/>
    <logger name="java.sql.Connection" level="DEBUG"/>
    <logger name="java.sql.Statement" level="DEBUG"/>
    <logger name="java.sql.PreparedStatement" level="DEBUG"/>

    <!-- 日志输出级别 -->
    <root level="DEBUG">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="FILE"/>
    </root>
</configuration>
~~~

### logback的其他的详细配置方式

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
    scan: 当此属性设置为true时，配置文件如果发生改变，将会被重新加载，默认值为true。
    scanPeriod: 设置监测配置文件是否有修改的时间间隔，如果没有给出时间单位，默认单位是毫秒。
                当scan为true时，此属性生效。默认的时间间隔为1分钟。
    debug: 当此属性设置为true时，将打印出logback内部日志信息，实时查看logback运行状态。默认值为false。
 -->
<configuration scan="true" scanPeriod="60 seconds" debug="false">
    <!--加载外部配置文件，如果配置文件出现同名变量则会自动选择最后一个，如果找不到加载的文件则会报错，
    resource默认指向classpath:，classpath:可以省略不写，如下第一种加载方法；第二种加载方法可以通过相
    对路径找到其它目录下的配置文件；第三种加载方法可以直接加载工程外部的配置文件，但是需要写绝对路径。-->
    <property resource="application.properties"/>
    <!--<property resource="./static/message.properties"/>-->
    <!--<property file="E:/message.properties"/>-->

    <!--日志根目录名称-->
    <property name="LOG_CONTEXT_NAME" value="springboot"/>

    <!--定义日志文件的存储地址 勿在 LogBack 的配置中使用相对路径-->
    <property name="LOG_HOME" value="logs/${LOG_CONTEXT_NAME}" />

    <!-- 定义日志上下文的名称 -->
    <contextName>${LOG_CONTEXT_NAME}</contextName>

    <!-- 控制台输出 -->
    <appender name="console" class="ch.qos.logback.core.ConsoleAppender">
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
    </appender>

    <!-- 按照每天生成日志文件 -->
    <appender name="file.all" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <!-- 追加日志到原文件结尾 -->
        <Prudent>true</Prudent>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名 每小时生成日志文件-->
            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/console.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始， -->
                <maxFileSize>10MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->
            <pattern> %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
    </appender>

    <!--info日志统一输出到这里-->
    <appender name="file.info" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <Prudent>true</Prudent>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名 每小时生成日志文件 -->
            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/info/console-info.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始， -->
                <maxFileSize>10MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->
            <pattern> %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
        <!-- 此日志文件只记录info级别的 -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>INFO</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
    </appender>

    <!--错误日志统一输出到这里-->
    <appender name="file.error" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <Prudent>true</Prudent>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名-->
            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/error/console-error.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始， -->
                <maxFileSize>10MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->
            <pattern> %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
        <!-- 此日志文件只记录error级别的 -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>ERROR</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
    </appender>

    <!--warn日志统一输出到这里-->
    <appender name="file.warn" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <Prudent>true</Prudent>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名 按小时生成日志-->
            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/warn/console-warn.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- 除按日志记录之外，还配置了日志文件不能超过10M(默认)，若超过10M，日志文件会以索引0开始， -->
                <maxFileSize>10MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->
            <pattern> %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
        <!-- 此日志文件只记录warn级别的 -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>WARN</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
    </appender>

    <!--debug级别日志统一输出到这里-->
    <appender name="file.debug" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <Prudent>true</Prudent>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名 按小时生成日志-->
            <FileNamePattern>${LOG_HOME}/%d{yyyy-MM-dd}/debug/console-debug.%d{yyyy-MM-dd-HH}.%i.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
            <!-- 除按日志记录之外，还配置了日志文件不能超过5M，若超过5M，日志文件会以索引0开始，命名日志文件，例如console-debug.2018-08-24-09.1.log -->
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <maxFileSize>10MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度 %method 方法名  %L 行数 %msg：日志消息，%n是换行符-->
            <pattern> %d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{56}.%method:%L - %msg%n</pattern>
            <charset>utf-8</charset>
        </encoder>
        <!-- 此日志文件只记录debug级别的 -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>DEBUG</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY </onMismatch>
        </filter>
    </appender>

    <!-- 不丢失日志.默认的,如果队列的80%已满,则会丢弃TRACT、DEBUG、INFO级别的日志 -->
    <appender name="file.async" class="ch.qos.logback.classic.AsyncAppender">
        <discardingThreshold>0</discardingThreshold>
        <queueSize>256</queueSize>
        <includeCallerData>true</includeCallerData>
        <appender-ref ref="file.all" />
    </appender>

    <!--  日志输出级别 -->
    <!-- TRACE\DEBUG\INFO\WARN\ERROR\FATAL\OFF -->
    <root level="INFO">
        <appender-ref ref="file.async"/>
        <appender-ref ref="console" />
        <appender-ref ref="file.error" />
        <appender-ref ref="file.info" />
        <appender-ref ref="file.debug" />
        <appender-ref ref="file.warn" />
    </root>

</configuration>
<!--
————————————————
版权声明：本文为CSDN博主「韭菜馅糖包」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_25113569/article/details/88895273-->
```

## **上面这些配置完成后基本就可以进行ssm的开发了**

下面的是配置过程中反铐的文献，没删除，应该没什么用了


原文：https://blog.csdn.net/yijiemamin/article/details/51156189#

这几天一直在整合SSM框架,虽然网上有很多已经整合好的,但是对于里面的配置文件并没有进行过多的说明,很多人知其然不知其所以然,经过几天的搜索和整理,今天总算对其中的XML配置文件有了一定的了解,所以拿出来一起分享一下,希望有不足的地方大家批评指正~~~

首先   这篇文章暂时只对框架中所要用到的配置文件进行解释说明,而且是针对注解形式的,框架运转的具体流程过两天再进行总结.

spring+springmvc+mybatis框架中用到了三个XML配置文件:web.xml,spring-mvc.xml,**spring-mybatis.xml（也常常叫做applicationContext.xml），**第一个不用说,每个web项目都会有的也是关联整个项目的配置.第二个文件spring-mvc.xml是springmvc的一些相关配置,第三个是mybatis的相关配置.

项目中还会用到两个资源属性文件jdbc.properties和log4j.properties.一个是关于jdbc的配置,提取出来方便以后的修改.另一个是日志文件的配置.

以上是我这篇文章中所要讲的内容,比较简单,也很容易懂.希望大牛不要鄙视~~接下来进入正题:

### 一  web.xml

关于这个配置文件我以前一直都是朦朦胧胧的状态,刚好借着这次整合框架的机会将它了解清楚.在下面的代码中我对每一个标签都进行了详细的注释,大家一看就懂,主要理解<servlet>中的配置,因为其中配置了前端控制器,在SSM框架中,前端控制器起着最主要的作用.下面贴上代码

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://java.sun.com/xml/ns/javaee"
  xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
  version="3.0">
    
    <context-param> <!--全局范围内环境参数初始化-->
        <param-name>contextConfigLocation</param-name>          <!--参数名称-->
        <param-value>classpath:spring-mybatis.xml</param-value>        <!--参数取值-->
    </context-param>
    
         <!--以下配置的加载顺序:先 ServletContext >> context-param >> listener >> filter >> servlet >>  spring-->
                                
    <!---------------------------------------------------过滤器配置------------------------------------------------------>
    <!--例:编码过滤器-->
    <filter>        <!-- 用来声明filter的相关设定,过滤器可以截取和修改一个Servlet或JSP页面的请求或从一个Servlet或JSP页面发出的响应-->
        <filter-name>encodingFilter</filter-name>     <!--指定filter的名字-->
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>    <!--定义filter的类的名称-->
        <async-supported>true</async-supported>        <!--设置是否启用异步支持-->
        <init-param><!--用来定义参数,若在Servlet可以使用下列方法来获得:String param_name=getServletContext().getInitParamter("param-name里面的值");-->
            <param-name>encoding</param-name>   <!--参数名称-->
            <param-value>UTF-8</param-value> <!--参数值-->
        </init-param>
    </filter>
    <filter-mapping><!--用来定义filter所对应的URL-->
        <filter-name>encodingFilter</filter-name>     <!--指定对应filter的名字-->
        <url-pattern>/*</url-pattern>        <!--指定filter所对应的URL-->
    </filter-mapping>
    
    <!---------------------------------------------------监听器配置------------------------------------------------------>
    <!--例:spring监听器-->
    <listener>        <!--用来设定Listener接口-->
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class><!--定义Listener的类名称-->
    </listener>
    <!-- 防止Spring内存溢出监听器  -->
      <listener>
        <listener-class>org.springframework.web.util.IntrospectorCleanupListener</listener-class>
     </listener>
    
    <!---------------------------------------------------servlet配置------------------------------------------------------>
    <servlet>        <!--用来声明一个servlet的数据 -->  
        <servlet-name>SpringMVC</servlet-name>    <!--指定servlet的名称-->
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class> <!--指定servlet的类名称,这里配置了前端控制器-->
        <init-param><!--用来定义参数,可有多个init-param。在servlet类中通过getInitParamenter(String name)方法访问初始化参数    -->
            <param-name>contextConfigLocation</param-name>    <!--参数名称-->
            <param-value>classpath:spring-mvc.xml</param-value>    <!--参数值-->
        </init-param>
        <load-on-startup>1</load-on-startup><!--当值为正数或零时：Servlet容器先加载数值小的servlet，再依次加载其他数值大的servlet.-->
        <async-supported>true</async-supported><!--设置是否启用异步支持-->
    </servlet>
    <servlet-mapping><!--用来定义servlet所对应的URL-->
        <servlet-name>SpringMVC</servlet-name>    <!--指定servlet的名称-->
        <url-pattern>/</url-pattern>        <!--指定servlet所对应的URL-->
    </servlet-mapping>
    
    <!-----------------------------------------------会话超时配置（单位为分钟）------------------------------------------------->
    <session-config><!--如果某个会话在一定时间未被访问，则服务器可以扔掉以节约内存-->
        <session-timeout>120</session-timeout>
    </session-config>
    <!---------------------------------------------------MIME类型配置   ------------------------------------------------------>
    <mime-mapping><!--设定某种扩展名的文件用一种应用程序来打开的方式类型，当该扩展名文件被访问的时候，浏览器会自动使用指定应用程序来打开-->
        <extension>*.ppt</extension>            <!--扩展名名称-->
        <mime-type>application/mspowerpoint</mime-type>            <!--MIME格式-->
    </mime-mapping>
    <!---------------------------------------------------欢迎页面配置  ------------------------------------------------------>
    <welcome-file-list><!--定义首页列单.-->
        <welcome-file>/index.jsp</welcome-file>    <!--用来指定首页文件名称.我们可以用<welcome-file>指定几个首页,而服务器会依照设定的顺序来找首页.-->
        <welcome-file>/index.html</welcome-file>
    </welcome-file-list>
    <!---------------------------------------------------配置错误页面------------------------------------------------------>
    <error-page>    <!--将错误代码(Error Code)或异常(Exception)的种类对应到web应用资源路径.-->
        <error-code>404</error-code>        <!--HTTP Error code,例如: 404、403-->
        <location>error.html</location>            <!--用来设置发生错误或异常时要显示的页面-->
    </error-page>
    <error-page>
        <exception-type>java.lang.Exception</exception-type><!--设置可能会发生的java异常类型,例如:java.lang.Exception-->
        <location>ExceptionError.html</location>            <!--用来设置发生错误或异常时要显示的页面-->
    </error-page>
</web-app>
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

### 二  spring-mvc.xml

需要实现基本功能的配置 
1 配置 <mvc:annotation-driven/>
2 配置 <context:component-scan base-package="com.springmvc.controller"/> //配置controller的注入
3 配置视图解析器

<mvc:annotation-driven/>   相当于注册了DefaultAnnotationHandlerMapping(映射器)和AnnotationMethodHandlerAdapter(适配器)两个bean.即解决了@Controller注解的使用前提配置。 

context:component-scan  对指定的包进行扫描，实现注释驱动Bean定义，同时将bean自动注入容器中使用。即解决了@Controller标识的类的bean的注入和使用。

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:aop="http://www.springframework.org/schema/aop"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:tx="http://www.springframework.org/schema/tx"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-4.1.xsd
        http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx-4.1.xsd
        http://www.springframework.org/schema/aop
        http://www.springframework.org/schema/aop/spring-aop-4.1.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-4.1.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd">
   
   <!-- 1、配置映射器与适配器 -->
   <mvc:annotation-driven></mvc:annotation-driven>
   
   <!-- 2、视图解析器 -->
   <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
   <span style="white-space:pre">    </span><!-- 前缀和后缀 -->
     <property name="prefix" value="/"/>
     <property name="suffix" value=".jsp"/>
   </bean>
   
   <!-- 3、自动扫描该包，使SpringMVC认为包下用了@controller注解的类是控制器  -->
   <context:component-scan base-package="com.rhzh.controller"/>
</beans>
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

### 三  spring-mybatis.xml**（也常常叫做applicationContext.xml）**

需要实现基本功能的配置 
1 配置 <context:component-scan base-package="com.rhzh"/> //自动扫描,将标注Spring注解的类自动转化Bean，同时完成Bean的注入
2 加载数据资源属性文件
3 配置数据源  三种数据源的配置方式 http://blog.csdn.net/yangyz_love/article/details/8199207
4 配置sessionfactory
5 装配Dao接口
6 声明式事务管理 
7 注解事务切面 

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:aop="http://www.springframework.org/schema/aop"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:tx="http://www.springframework.org/schema/tx"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-4.1.xsd
        http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx-4.1.xsd
        http://www.springframework.org/schema/aop
        http://www.springframework.org/schema/aop/spring-aop-4.1.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-4.1.xsd">
  <!--1 自动扫描 将标注Spring注解的类自动转化Bean-->
  <context:component-scan base-package="com.rhzh" />
  <!--2 加载数据资源属性文件 -->
  <bean id="propertyConfigurer"
    class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
    <property name="location" value="classpath:jdbc.properties" />
  </bean>
  <span style="white-space:pre"><!-- 3 配置数据源 --></span>
  <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
    destroy-method="close">
    <property name="driverClassName" value="${driver}" />
    <property name="url" value="${url}" />
    <property name="username" value="${username}" />
    <property name="password" value="${password}" />
    <!-- 初始化连接大小 -->
    <property name="initialSize" value="${initialSize}"></property>
    <!-- 连接池最大数量 -->
    <property name="maxActive" value="${maxActive}"></property>
    <!-- 连接池最大空闲 -->
    <property name="maxIdle" value="${maxIdle}"></property>
    <!-- 连接池最小空闲 -->
    <property name="minIdle" value="${minIdle}"></property>
    <!-- 获取连接最大等待时间 -->
    <property name="maxWait" value="${maxWait}"></property>
  </bean>
  <!-- 4   配置sessionfactory -->
  <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource" />
    <!-- 自动扫描mapping.xml文件 -->
    <property name="mapperLocations" value="classpath:com/rhzh/mapping/*.xml"></property>
  </bean>
  <!-- 5  装配dao接口 -->
  <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="com.rhzh.dao" /> <!-- DAO接口所在包名，Spring会自动查找其下的类 -->
    <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"></property>
  </bean>
  <!-- 6、声明式事务管理 -->
  <bean id="transactionManager"
    class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="dataSource" />
  </bean>
  <!-- 7、注解事务切面 --><span style="font-family: Arial, Helvetica, sans-serif;"></span><pre name="code" class="html">   <tx:annotation-driven transaction-manager="transactionManager"/>
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

下面是需要引入的两个资源属性文件:

 

jdbc.properties

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:3306/ecdatabase?characterEncoding=utf-8
username=root
password=admin
#定义初始连接数
initialSize=0
#定义最大连接数
maxActive=20
#定义最大空闲
maxIdle=20
#定义最小空闲
minIdle=1
#定义最长等待时间
maxWait=60000
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

log4j.properties

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```properties
#定义LOG输出级别
log4j.rootLogger=INFO,Console,File
#定义日志输出目的地为控制台
log4j.appender.Console=org.apache.log4j.ConsoleAppender
log4j.appender.Console.Target=System.out
#可以灵活地指定日志输出格式，下面一行是指定具体的格式
log4j.appender.Console.layout = org.apache.log4j.PatternLayout
log4j.appender.Console.layout.ConversionPattern=[%c] - %m%n
 
#文件大小到达指定尺寸的时候产生一个新的文件
log4j.appender.File = org.apache.log4j.RollingFileAppender
#指定输出目录
log4j.appender.File.File = logs/ssm.log
#定义文件最大大小
log4j.appender.File.MaxFileSize = 10MB
# 输出所以日志，如果换成DEBUG表示输出DEBUG以上级别日志
log4j.appender.File.Threshold = ALL
log4j.appender.File.layout = org.apache.log4j.PatternLayout
log4j.appender.File.layout.ConversionPattern =[%p] [%d{yyyy-MM-dd HH\:mm\:ss}][%c]%m%n
```