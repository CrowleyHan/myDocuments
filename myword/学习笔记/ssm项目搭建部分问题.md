# SSM项目搭建遇到的问题



## 1：POM文件的依赖问题：

### 1：tomcat配置后不显示

​	右边的maven-plugins列表里没有出来：



下面是tomcat的插件

~~~xml
  <plugin>
          <groupId>org.apache.tomcat.maven</groupId>
          <artifactId>tomcat7-maven-plugin</artifactId>
          <version>2.2</version>
          <configuration>
            <hostName>localhost</hostName>        <!--   Default: localhost -->
            <port>8080</port>                     <!-- 启动端口 Default:8080 -->
            <path>/</path>   <!-- 访问应用路径  Default: /${project.artifactId}-->
            <uriEncoding>UTF-8</uriEncoding>      <!-- uri编码 Default: ISO-8859-1 -->
          </configuration>
        </plugin>
~~~

#### 解决办法：

见仓库的网页链接

## druid 德鲁伊配置报错

### 1： url配置报错

> com.mysql.cj.core.exceptions.InvalidConnectionAttributeException: The server time zone value '�й���׼

> 解决办法：修改url内容配置：
>
> ```properties
> jdbc_url=jdbc:mysql://127.0.0.1:3306/bookcity?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
> ```

下面的这个报错也在修改url之后消失了

org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: 

Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240

The error may exist in class path resource [mappings/BookUserMapping.xml]

The error may involve com.ssm.dao.UserDao.selectUser

The error occurred while executing a query

Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240

	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)
	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)
	at com.sun.proxy.$Proxy17.selectList(Unknown Source)
	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)
	at org.apache.ibatis.binding.MapperMethod.executeForMany(MapperMethod.java:139)
	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:76)
	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)
	at com.sun.proxy.$Proxy18.selectUser(Unknown Source)
	at demo1.test1.get(test1.java:22)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:50)
	at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)
	at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:47)
	at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:17)
	at org.junit.runners.ParentRunner.runLeaf(ParentRunner.java:325)
	at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:78)
	at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:57)
	at org.junit.runners.ParentRunner$3.run(ParentRunner.java:290)
	at org.junit.runners.ParentRunner$1.schedule(ParentRunner.java:71)
	at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:288)
	at org.junit.runners.ParentRunner.access$000(ParentRunner.java:58)
	at org.junit.runners.ParentRunner$2.evaluate(ParentRunner.java:268)
	at org.junit.runners.ParentRunner.run(ParentRunner.java:363)
	at org.junit.runner.JUnitCore.run(JUnitCore.java:137)
	at com.intellij.junit4.JUnit4IdeaTestRunner.startRunnerWithArgs(JUnit4IdeaTestRunner.java:68)
	at com.intellij.rt.junit.IdeaTestRunner$Repeater.startRunnerWithArgs(IdeaTestRunner.java:33)
	at com.intellij.rt.junit.JUnitStarter.prepareStreamsAndStart(JUnitStarter.java:230)
	at com.intellij.rt.junit.JUnitStarter.main(JUnitStarter.java:58)
Caused by: org.apache.ibatis.exceptions.PersistenceException: 

Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240

The error may exist in class path resource [mappings/BookUserMapping.xml]

The error may involve com.ssm.dao.UserDao.selectUser

The error occurred while executing a query

Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240

	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:150)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)
	... 29 more
Caused by: org.springframework.jdbc.CannotGetJdbcConnectionException: Failed to obtain JDBC Connection; nested exception is com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240
	at org.springframework.jdbc.datasource.DataSourceUtils.getConnection(DataSourceUtils.java:81)
	at org.mybatis.spring.transaction.SpringManagedTransaction.openConnection(SpringManagedTransaction.java:82)
	at org.mybatis.spring.transaction.SpringManagedTransaction.getConnection(SpringManagedTransaction.java:68)
	at org.apache.ibatis.executor.BaseExecutor.getConnection(BaseExecutor.java:338)
	at org.apache.ibatis.executor.SimpleExecutor.prepareStatement(SimpleExecutor.java:84)
	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:62)
	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:326)
	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)
	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)
	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:83)
	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)
	... 35 more
Caused by: com.alibaba.druid.pool.GetConnectionTimeoutException: wait millis 60000, active 0, maxActive 20, creating 0, createErrorCount 240
	at com.alibaba.druid.pool.DruidDataSource.getConnectionInternal(DruidDataSource.java:1617)
	at com.alibaba.druid.pool.DruidDataSource.getConnectionDirect(DruidDataSource.java:1337)
	at com.alibaba.druid.filter.FilterChainImpl.dataSource_connect(FilterChainImpl.java:5007)
	at com.alibaba.druid.filter.stat.StatFilter.dataSource_getConnection(StatFilter.java:680)
	at com.alibaba.druid.filter.FilterChainImpl.dataSource_connect(FilterChainImpl.java:5003)
	at com.alibaba.druid.pool.DruidDataSource.getConnection(DruidDataSource.java:1315)
	at com.alibaba.druid.pool.DruidDataSource.getConnection(DruidDataSource.java:1307)
	at com.alibaba.druid.pool.DruidDataSource.getConnection(DruidDataSource.java:109)
	at org.springframework.jdbc.datasource.DataSourceUtils.fetchConnection(DataSourceUtils.java:157)
	at org.springframework.jdbc.datasource.DataSourceUtils.doGetConnection(DataSourceUtils.java:115)
	at org.springframework.jdbc.datasource.DataSourceUtils.getConnection(DataSourceUtils.java:78)
	... 45 more
Caused by: java.sql.SQLNonTransientConnectionException: Cannot load connection class because of underlying exception: com.mysql.cj.core.exceptions.WrongArgumentException: Malformed database URL, failed to parse the connection string near ';useUnicode=true&amp;characterEncoding=utf-8&useSSL=false&amp;zeroDateTimeBehavior=convertToNull&amp;transformedBitIsBoolean=true'.
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:526)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:513)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:505)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:479)
	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:489)
	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:72)
	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:124)
	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:224)
	at com.alibaba.druid.filter.FilterChainImpl.connection_connect(FilterChainImpl.java:156)
	at com.alibaba.druid.filter.stat.StatFilter.connection_connect(StatFilter.java:218)
	at com.alibaba.druid.filter.FilterChainImpl.connection_connect(FilterChainImpl.java:150)
	at com.alibaba.druid.pool.DruidAbstractDataSource.createPhysicalConnection(DruidAbstractDataSource.java:1598)
	at com.alibaba.druid.pool.DruidAbstractDataSource.createPhysicalConnection(DruidAbstractDataSource.java:1662)
	at com.alibaba.druid.pool.DruidDataSource$CreateConnectionThread.run(DruidDataSource.java:2601)
Caused by: com.mysql.cj.core.exceptions.UnableToConnectException: Cannot load connection class because of underlying exception: com.mysql.cj.core.exceptions.WrongArgumentException: Malformed database URL, failed to parse the connection string near ';useUnicode=true&amp;characterEncoding=utf-8&useSSL=false&amp;zeroDateTimeBehavior=convertToNull&amp;transformedBitIsBoolean=true'.
	at sun.reflect.GeneratedConstructorAccessor3.newInstance(Unknown Source)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.cj.core.exceptions.ExceptionFactory.createException(ExceptionFactory.java:54)
	at com.mysql.cj.core.exceptions.ExceptionFactory.createException(ExceptionFactory.java:93)
	... 7 more
Caused by: com.mysql.cj.core.exceptions.WrongArgumentException: Malformed database URL, failed to parse the connection string near ';useUnicode=true&amp;characterEncoding=utf-8&useSSL=false&amp;zeroDateTimeBehavior=convertToNull&amp;transformedBitIsBoolean=true'.
	at sun.reflect.GeneratedConstructorAccessor2.newInstance(Unknown Source)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.cj.core.exceptions.ExceptionFactory.createException(ExceptionFactory.java:54)
	at com.mysql.cj.core.conf.url.ConnectionUrlParser.processKeyValuePattern(ConnectionUrlParser.java:511)
	at com.mysql.cj.core.conf.url.ConnectionUrlParser.parseQuerySection(ConnectionUrlParser.java:491)
	at com.mysql.cj.core.conf.url.ConnectionUrlParser.getProperties(ConnectionUrlParser.java:616)
	at com.mysql.cj.core.conf.url.ConnectionUrl.collectProperties(ConnectionUrl.java:307)
	at com.mysql.cj.core.conf.url.ConnectionUrl.<init>(ConnectionUrl.java:292)
	at com.mysql.cj.core.conf.url.SingleConnectionUrl.<init>(SingleConnectionUrl.java:38)
	at com.mysql.cj.core.conf.url.ConnectionUrl.getConnectionUrlInstance(ConnectionUrl.java:202)
	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:194)
	... 6 more

## 请求拦截问题

```xml
<servlet-mapping>
    <servlet-name>springMVC</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>
```

如果在SpringMVC中配置了拦截所有请求，则不需要再在tomcat中设置下面这条，两条会冲突

```xml
  <servlet-mapping>-->
       <servlet-name>default</servlet-name>-->
        <url-pattern>/</url-pattern>-->
   </servlet-mapping>-->
```



## 乱码问题：

1：jsp页面乱码

​				在头部添加如下代码

~~~jsp
<%@page contentType="text/html;charset=utf-8" language="java" %>

<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>
~~~

2： 请求乱码-----------在xml文件中配置

​	在SpringMVC配置文件中配置如下代码解决：向浏览器返回String、json的乱码

~~~xml
<!--   返回乱码处理办法：这个bean必须写在 <mvc: annotation-dirven>   之前才能生效    -->
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
~~~

3： 在 web.xml中配置把所有请求转码成utf-8 防止乱码

~~~xml

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

~~~







## SSM基本概览

1：准备

在pom中添加依赖或者jar包（

spring核心包等+

springMVC的包+

springIoc+AOP+Tx+Test

mybatis自身核心包+

mysql驱动包（连接池一般用阿里云的druid）

mybatis-spring的整合包

logback日志框架的包

）

2：配置文件：

1：SpringMVC：一个SpringMVC.xml

2：Spring：applicationContext.xml

3：Mybatis： 1sqlMappingconfig.xml（整合的时候会被整合到applicationContext.xml中）2：各个接口的Mapping.xml

