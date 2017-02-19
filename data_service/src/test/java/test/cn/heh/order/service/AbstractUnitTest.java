package test.cn.heh.order.service;

import org.junit.After;
import org.junit.Before;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * Created by yangjunming on 2016/12/29.
 */
public class AbstractUnitTest {

    protected ConfigurableApplicationContext context = null;

    @Before
    public void init() {
        context = ApplicationContextUtil.getInstance("resources/spring-context.xml").getContext();
    }

    @After
    public void close() {
        if (context != null) {
            context.close();
        }
    }
}
