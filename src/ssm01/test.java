package ssm01;

public class test {
	/**   
	 *  -------------------------SSH----------------Struts----Spring-----hibernate---------------------------
	 *  Struts     处理请求            （控制我们的Controler）
	 *  Spring     利用依赖注入实例化bean，贯穿了真个项目的Controller，Servive，dao     
	 *  hibernate  数据库连接   操作数据库（增删该查的封装）  
	 *    
	 *  0. 导入相关的jar包
     *  1. 先配置web.xml  >>>  spring监听器（app.xml）   和   Struts2核心拦截器
     *  2. 建立相应的包  controller service  dao model 在建立相应的utils工具包
     *  3. 建立相应的hibernate.cfg.xml文件
     *  4. 利用hibernate反向生成javabean和映射文件（.xml）    
     *  5. 配置app.xml文件  分为：
     *         5.1  扫描所有相关注解Spring注解的类           
     *         5.2  实例化c3p0  
     *         5.3  创建SessionFactory工厂  》》》 引用已经实例化了的C3p0
     *         5.4  创建事务    》》
     *             5.5.1  注册事务
     *             5.5.2  配置需要执行事务的方法
     *             5.5.3  配置需要那一层执行事务   service   》》  一定要将这个事务哪些方法运用事务（即：5.5.2）
     *  6.配置struts.xml
     *         先写dtd 在写<struts>标签 在写命名空间  <package>  在写<action>（请求发来时调用的类里面对应的方法）标签 
     *  
     *  
     *  ------------------------SSM----------------Springmvc----Spring-----Mybatis------------------------
     * 	Springmvc  处理请求   (相对于  Struts  （功能） )
     * 	Spring     利用依赖注入实例化bean，贯穿了真个项目的Controller，Servive，dao   
     *  Mybatis    数据库连接   操作数据库（增删改查封装）    （相对于hibernate）
     *  
     *  需要配置的文件   ：
     *       0.导入相关的jar 
     *       1.创建一个关于Springmvc的一个xml配置        （配置前段发送过来的请求    控制我们Controller层，view层）  
     *              1.1：一定需要在xml文件里面实例化Controller  
     *              1.1：后台做完逻辑处理之后  响应对应的view  
     *       2.创建一个applicationContext.xml文件     （连接数据库（ c3p0） 操作数据库（ Sessionfactory）  ）
     *              2.1：扫描我们的Service ，(dao 层  直接映射层Xml文件了)    （实例化对象） 
     *              2.2：配置c3p0数据源  （配置对应的属性：driverClass，jdbcUrl，user，password）
     *              2.3：配置操作数据库SessionFactory  （配置对应的属性：dataSource）
     *       3.创建web.xml文件
     *     		    3.1：解析我们的applicationContext.xml   (配置Spring的一个监听器)
     *              3.2：解析我们的Springmvc.xml     (请求到来时需要Springmvc.xml文件去处理这个请求（分配Controller）) 
     *                      
     *     
	 */
}
