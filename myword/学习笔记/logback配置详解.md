# logbackrizhi 日志框架使用说明

## 1：依赖包

pom.xml中添加如下依赖

~~~xml
<!--logback依赖-->
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
~~~

## 2：配置文件

常见的：

1：logback.xml

2：logback-spring.xml

3：config.properties（几乎不用）

4：springboot：applocation.yml（简单配置）

--------------------------

日志级别排序：

~~~java
//日志级别
ERROR（40,"REEOR"）;
WARN(30,"WARN");
INFO(20,"INFO");
DEBUG(10,"DEBUG");
TRACE(0,"TRACE");
//过滤判断：枚举值
DENY		禁止
NEUTRAL		中立（）
ACCEPT		接受（）
~~~

-----------------

applocation.yml（简单配置）

~~~yml
#yml对空格缩进比较严格，格式要对其
logging:
	pattern:
		console: "%d - %msg%n "    #注释： %d是日期，%msg是信息，%n换行 双引号""内的信息可以自定义
	path: /var/log/shall     #注释：配置日志保存的路径，该设置生成一个有默认名字的日志(spring.log) 
	file: /var/log/tomcat/xxx.log #注释：指定名字和路径
	level: debug   			# 设置日志的默认级别
		com.dao.loggerTest:debug  # 设置具体某个类的日志级别
~~~

--------------

logback.xml配置说明：

~~~xml
<!--根节点： configurarion-->
<configurarion>
<!--所有的配置都要写在这个节点内-->
<!-- -->
</configurarion> 
~~~

### 控制台输出内容的配置

> 下面两个是新旧两个示例，建议用新的<encoder>标签设置

~~~xml
<!--配置项：一个要被调用的组件 -->
<!--name="name1appender" 名字是这个配置项的名字，自定义的-->
<!-- class="ch.qos.logback.core.ConsoleAppender"这个类是用于设置打印在控制台的内容的-->
<!--class="ch.qos.logback.classic.encoder.PatternLayoutEncoder"是设置在控制台的布局样式： -->
<!-- 0.9.19版本之后，极力推荐使用encoder。官方推荐 -->
<appender name="name1appender" class="ch.qos.logback.core.ConsoleAppender">
    <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
         <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
    </encoder>
</appender>
~~~

~~~xml
<!--配置项：一个要被调用的组件 -->
<!--name="name1appender" 名字是这个配置项的名字，自定义的-->
<!-- class="ch.qos.logback.core.ConsoleAppender"这个类是用于设置打印在控制台的内容的-->
<!-- class="ch.qos.logback.classic.PatternLayout"设置在控制台打印的布局样式，是老版的设置 -->
<!-- 0.9.19版本之后，极力推荐使用encoder。官方推荐 -->
<appender name="name1appender" class="ch.qos.logback.core.ConsoleAppender">
   <layout class="ch.qos.logback.classic.PatternLayout">
       <pattern>
           %d{yyyy-MMd-dd HH:mm:ss.SSS} %msg%n
       </pattern>
    </layout>
</appender>
~~~

### 日志文件设置

> 分等级设置，这里例出典型的info和error两种讲解

~~~xml
<!--info级别日志 -->
<appender name="infolog" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <!--使用这个设置进行过滤，使其过滤掉ERROR级别的日志,若不配置，则打印所有级别的的日志-->
    <filter class="ch.qos.logback.classic.filter.LevelFilter">
        <level>ERROR</level>
        <onMatch>DENY</onMatch>
        <onMismatch>ACCEPT</onMismatch>
    </filter>
    <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
               <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符(这是日志内的内容格式)-->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
    </encoder>
    
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
    	    <!--日志文件输出的文件名-->
            <FileNamePattern>${LOG_HOME}/info.log.%d{yyyy-MM-dd}.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
    </rollingPolicy>
</appender>
~~~

> error设置

~~~xml
<!--error级别日志 -->
<!--需要添加过滤-->
<appender name="errorlog" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <!--使用这个设置进行过滤，使其指打印error级别的日志,若不对此配置，则打印所有级别的的日志-->
    <filter class="ch.qos.logback.classic.filter.ThersholdFilter">
		<level>ERROR</level>    
    </filter>
    
    <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
               <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符(这是日志内的内容格式)-->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
    </encoder>
    
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
    	    <!--日志文件输出的文件名-->
            <FileNamePattern>${LOG_HOME}/debug.log.%d{yyyy-MM-dd}.log</FileNamePattern>
            <!--日志文件保留天数-->
            <MaxHistory>30</MaxHistory>
    </rollingPolicy>
</appender>
~~~

### info和error的配置区别

> 打印的内容设置是一样的，**区别在于不同级别的过滤**
>
> 前面有列出：ERROR的级别最高，所以设置过滤error和其他的分开打印是有区别的

**如：在ERROR中设置只打印ERROR类型的日志需要在error的<appender>节点添加如下设置即可**

~~~xml
   <!--使用这个设置进行过滤，使其指打印error级别的日志,若不对此配置，则打印所有级别的的日志-->
    <filter class="ch.qos.logback.classic.filter.ThersholdFilter">
		<level>ERROR</level>    
    </filter>
~~~

**这种设置只输出<level>中的标注的级别及其以上的，因为ERROR级别最高，所以只会输出ERROR类型的内容**

而如果在info的日志中添加上面这个设置则会打印包括info及其以上的所有类型信息：info、warn、error

所以，在非ERROR级别的日志输出中，可以改成如下配置

~~~xml
   <filter class="ch.qos.logback.classic.filter.LevelFilter">
        <level>ERROR</level> <!-- 设置要过滤的条件：ERROR-->
        <onMatch>DENY</onMatch> <!-- 如果满足条件：禁止打印-->
        <onMismatch>ACCEPT</onMismatch><!-- 如果不满足条件，则打印-->
    </filter>
~~~









~~~xml
<!--root是指应用范围 -->
<!-- <appenfer-ref ref="name1appender"/>是将上面设置好的配置项注入进来，按照这个标准生效-->
<!-- 将需要的appender组件添加到Root就会生效-->
<root level="debug" >
    <appenfer-ref ref="name1appender"/>
</root>
~~~





logback.xml  /  logback-spring.xml配置示例

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<!--根节点： configurarion-->
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
<!--    <logger name="org.hibernate.type.descriptor.sql.BasicBinder" level="TRACE" />-->
<!--    <logger name="org.hibernate.type.descriptor.sql.BasicExtractor" level="DEBUG" />-->
<!--    <logger name="org.hibernate.SQL" level="DEBUG" />-->
<!--    <logger name="org.hibernate.engine.QueryParameters" level="DEBUG" />-->
<!--    <logger name="org.hibernate.engine.query.HQLQueryPlan" level="DEBUG" />-->

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

java类中输出模式示例

~~~java
public void logTestmethod(){
    String name="aname";
    String password="password";
    log.debug("debug...");
    //下面两行输出结果一样
    log.info("name:"+name+", password:"+password);
    log.info("name:{},password:{}",name,password);
    log.warn("warn...警告");
    log.error("error...异常");    
    
}
~~~





