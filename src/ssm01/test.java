package ssm01;

public class test {
	/**   
	 *  -------------------------SSH----------------Struts----Spring-----hibernate---------------------------
	 *  Struts     ��������            ���������ǵ�Controler��
	 *  Spring     ��������ע��ʵ����bean���ᴩ�������Ŀ��Controller��Servive��dao     
	 *  hibernate  ���ݿ�����   �������ݿ⣨��ɾ�ò�ķ�װ��  
	 *    
	 *  0. ������ص�jar��
     *  1. ������web.xml  >>>  spring��������app.xml��   ��   Struts2����������
     *  2. ������Ӧ�İ�  controller service  dao model �ڽ�����Ӧ��utils���߰�
     *  3. ������Ӧ��hibernate.cfg.xml�ļ�
     *  4. ����hibernate��������javabean��ӳ���ļ���.xml��    
     *  5. ����app.xml�ļ�  ��Ϊ��
     *         5.1  ɨ���������ע��Springע�����           
     *         5.2  ʵ����c3p0  
     *         5.3  ����SessionFactory����  ������ �����Ѿ�ʵ�����˵�C3p0
     *         5.4  ��������    ����
     *             5.5.1  ע������
     *             5.5.2  ������Ҫִ������ķ���
     *             5.5.3  ������Ҫ��һ��ִ������   service   ����  һ��Ҫ�����������Щ�����������񣨼���5.5.2��
     *  6.����struts.xml
     *         ��дdtd ��д<struts>��ǩ ��д�����ռ�  <package>  ��д<action>��������ʱ���õ��������Ӧ�ķ�������ǩ 
     *  
     *  
     *  ------------------------SSM----------------Springmvc----Spring-----Mybatis------------------------
     * 	Springmvc  ��������   (�����  Struts  �����ܣ� )
     * 	Spring     ��������ע��ʵ����bean���ᴩ�������Ŀ��Controller��Servive��dao   
     *  Mybatis    ���ݿ�����   �������ݿ⣨��ɾ�Ĳ��װ��    �������hibernate��
     *  
     *  ��Ҫ���õ��ļ�   ��
     *       0.������ص�jar 
     *       1.����һ������Springmvc��һ��xml����        ������ǰ�η��͹���������    ��������Controller�㣬view�㣩  
     *              1.1��һ����Ҫ��xml�ļ�����ʵ����Controller  
     *              1.1����̨�����߼�����֮��  ��Ӧ��Ӧ��view  
     *       2.����һ��applicationContext.xml�ļ�     ���������ݿ⣨ c3p0�� �������ݿ⣨ Sessionfactory��  ��
     *              2.1��ɨ�����ǵ�Service ��(dao ��  ֱ��ӳ���Xml�ļ���)    ��ʵ�������� 
     *              2.2������c3p0����Դ  �����ö�Ӧ�����ԣ�driverClass��jdbcUrl��user��password��
     *              2.3�����ò������ݿ�SessionFactory  �����ö�Ӧ�����ԣ�dataSource��
     *       3.����web.xml�ļ�
     *     		    3.1���������ǵ�applicationContext.xml   (����Spring��һ��������)
     *              3.2���������ǵ�Springmvc.xml     (������ʱ��ҪSpringmvc.xml�ļ�ȥ����������󣨷���Controller��) 
     *                      
     *     
	 */
}
