package com.workflow.process.center.flowable.idm;

import org.flowable.idm.api.IdmIdentityService;
import org.flowable.idm.api.IdmManagementService;
import org.flowable.idm.engine.IdmEngine;
import org.flowable.idm.engine.IdmEngineConfiguration;
import org.flowable.idm.engine.impl.persistence.entity.GroupEntityImpl;
import org.flowable.idm.engine.impl.persistence.entity.UserEntityImpl;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;

public class IdmTest {

    IdmEngineConfiguration idmEngineConfiguration;
    IdmEngine idmEngine;
    IdmIdentityService idmIdentityService;
    IdmManagementService idmManagementService;

    @Before
    public void init() {
        InputStream resourceAsStream = IdmTest.class.getClassLoader().getResourceAsStream("flowable.idm.cfg.xml");
        idmEngine = IdmEngineConfiguration.createIdmEngineConfigurationFromInputStream(resourceAsStream).buildIdmEngine();
        idmIdentityService = idmEngine.getIdmIdentityService();
        idmEngineConfiguration = idmEngine.getIdmEngineConfiguration();
        idmManagementService = idmEngine.getIdmManagementService();
        String engineName = idmEngine.getName();
        System.out.println("引擎的名称" + engineName);
    }



    @Test
    public void addUser() {
        UserEntityImpl user = new UserEntityImpl();
        user.setEmail("test@qq.com");
        user.setId("test");
        user.setPassword("test");
        //0代表新增 默认为1 会报空指针异常
        user.setRevision(0);
        idmIdentityService.saveUser(user);
    }

    @Test
    public void addGroup() {
        GroupEntityImpl group = new GroupEntityImpl();
        group.setId("dep_yanfa");
        group.setName("开发部");
        //0代表新增 默认为1 会报空指针异常
        group.setRevision(0);
        idmIdentityService.saveGroup(group);
    }

    @Test
    public void createMembership() {
        String userId = "test";
        String groupId = "dep_yanfa";
        idmIdentityService.createMembership(userId, groupId);
    }


    @Test
    public void createUserQuery() {
        idmIdentityService.createUserQuery().list().forEach(u -> {
            System.out.println(u.getId() + " " + u.getPassword());
        });
    }


    @Test
    public void createGroupQuery() {
        idmIdentityService.createGroupQuery().list().forEach(u -> {
            System.out.println(u.getId() + " " + u.getName());
        });
    }

    @Test
    public void createPrivilegeQuery() {
        idmIdentityService.createPrivilegeQuery().list().forEach(p -> System.out.println(p.getId() + " " + p.getName()));
    }

    @Test
    public void addUserPrivilegeMapping() {
        idmIdentityService.addUserPrivilegeMapping("e3ac7826-c730-11ea-89f5-005056c00008", "test");
    }

    @Test
    public void addGroupPrivilegeMapping() {
        idmIdentityService.addGroupPrivilegeMapping("e3ac7826-c730-11ea-89f5-005056c00008", "dep_yanfa");
    }

    @Test
    public void getTableCount() {
        idmManagementService.getTableCount().forEach((s, aLong) -> System.out.println(s + " " + aLong));
    }

}
