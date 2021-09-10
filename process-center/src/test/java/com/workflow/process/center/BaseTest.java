package com.workflow.process.center;

import org.junit.jupiter.api.BeforeEach;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

/**
 * 单元测试继承该类即可
 */
@RunWith(SpringJUnit4ClassRunner.class)    // SpringJUnit支持，由此引入Spring-Test框架支持！
@SpringBootTest(classes = ProcessCenterApplication.class)    // 指定我们SpringBoot工程的Application启动类
@WebAppConfiguration  //由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration。
@Transactional
@Rollback
public abstract class BaseTest {
    @Autowired
    private WebApplicationContext context;
    protected MockMvc mvc;

    @BeforeEach
    public void setUp() throws Exception {
        //       mvc = MockMvcBuilders.standaloneSetup(new TestController()).build();
        mvc = MockMvcBuilders.webAppContextSetup(context).build();//建议使用这种
    }
}
