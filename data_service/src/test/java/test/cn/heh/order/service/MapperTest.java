package test.cn.heh.order.service;

import cn.heh.order.entity.test01.AppUserEntity;
import cn.heh.order.mapper.test01.AppUserEntityMapper;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;

/**
 * Created by yangjunming on 2017/1/19.
 */
public class MapperTest extends AbstractUnitTest {

    @Test
    public void testSelectAppOrder() {
        AppUserEntityMapper mapper = context.getBean(AppUserEntityMapper.class);
        AppUserEntity entity = mapper.selectByPrimaryKey(1);


        String a = "aaaaaaa";
        a.intern();
        System.out.println(JSON.toJSONString(entity));
    }
}
