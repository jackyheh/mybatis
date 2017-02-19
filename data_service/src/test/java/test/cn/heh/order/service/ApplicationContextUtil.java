package test.cn.heh.order.service;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import javax.sql.DataSource;
import java.io.File;
import java.sql.SQLException;

import static java.lang.System.exit;

/**
 * {type your description }
 *
 * @since: 15/11/16.
 * @author: yangjunming
 */
public class ApplicationContextUtil {

    private static ConfigurableApplicationContext context = null;
    private static ApplicationContextUtil instance = null;

    private static String springConfigEntryFile = "resources/spring-context.xml";
    private static String log4j2ConfigEntryFile = "resources/log4j2.xml";
    private static String defaultDataSrouce = "dsMain";

    public static ApplicationContextUtil getInstance() {
        if (instance == null) {
            synchronized (ApplicationContextUtil.class) {
                if (instance == null) {
                    instance = new ApplicationContextUtil();
                    init();
                }
            }
        }
        return instance;
    }

    public static ApplicationContextUtil getInstance(String springEntryFile) {
        if (instance == null) {
            synchronized (ApplicationContextUtil.class) {
                if (instance == null) {
                    instance = new ApplicationContextUtil(springEntryFile);
                    init();
                }
            }
        }
        return instance;
    }

    public static ApplicationContextUtil getInstance(String springEntryFile, String dsName) {
        if (instance == null) {
            synchronized (ApplicationContextUtil.class) {
                if (instance == null) {
                    instance = new ApplicationContextUtil(springEntryFile, dsName);
                    init();
                }
            }
        }
        return instance;
    }

    public ConfigurableApplicationContext getContext() {
        return context;
    }

    public void close() {
        context.close();
    }

    private ApplicationContextUtil() {
    }

    private ApplicationContextUtil(String springConfigFile) {
        springConfigEntryFile = springConfigFile;
    }

    private ApplicationContextUtil(String springConfigFile, String dsName) {
        springConfigEntryFile = springConfigFile;
        defaultDataSrouce = dsName;
    }

    private static void init() {
        //加载log4j2.xml
        File configFile = new File(log4j2ConfigEntryFile);
        if (!configFile.exists()) {
            System.err.println("log4j2 config file:" + configFile.getAbsolutePath() + " not exist");
            exit(0);
        }
        System.out.println("log4j2 config file:" + configFile.getAbsolutePath());
        try {
            //注:这一句必须放在整个应用第一次LoggerFactory.getLogger(XXX.class)前执行
            System.setProperty("log4j.configurationFile", configFile.getAbsolutePath());
        } catch (Exception e) {
            System.err.println("log4j2 initialize error:" + e.getLocalizedMessage());
            exit(0);
        }
        //加载spring配置文件
        configFile = new File(springConfigEntryFile);
        if (!configFile.exists()) {
            System.err.println("spring config file:" + configFile.getAbsolutePath() + " not exist");
            exit(0);
        }

        System.out.println("spring config file:" + configFile.getAbsolutePath());

        if (context == null) {
            DBContext.setDBKey(defaultDataSrouce);
            context = new FileSystemXmlApplicationContext(springConfigEntryFile);
            //做HA时，很多场景会启动一个standby实例(做为冗余)，仅当master宕机时，standby实例才会激活
            //在启动时，先关闭所有conn，释放这些不必要的连接资源
            String[] dsList = context.getBeanNamesForType(DataSource.class);
            for (String ds : dsList) {
                DataSource dataSource = context.getBean(ds, DataSource.class);
                if (dataSource != null) {
                    java.sql.Connection connection;
                    try {
                        connection = dataSource.getConnection();
                        connection.close();
                    } catch (SQLException e) {
                        System.err.println("spring initialize error:" + e.getLocalizedMessage());
                        exit(0);
                    }
                }
            }
        }
    }
}
