package cn.heh;

import cn.heh.order.entity.test01.AppUserEntity;
import cn.heh.order.mapper.test01.AppUserEntityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by heh on 2017/2/12.
 */
@RestController
@RequestMapping("/demo/")
public class DemoRestController {

    @Autowired
    AppUserEntityMapper appUserEntityMapper;

    @RequestMapping("test")
    @ResponseBody
    public AppUserEntity test() {
        AppUserEntity entity = appUserEntityMapper.selectByPrimaryKey(1);
        return entity;
    }

//    @RequestMapping("test")
//    @ResponseBody
//    public String test() {
//        String aa = "aaaaa";
//        return aa;
//    }
}