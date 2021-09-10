package com.workflow.process.center.utils.dubbo;

import org.apache.dubbo.config.ApplicationConfig;
import org.apache.dubbo.config.ConsumerConfig;
import org.apache.dubbo.config.ReferenceConfig;
import org.apache.dubbo.config.RegistryConfig;
import org.apache.dubbo.config.utils.ReferenceConfigCache;
import org.apache.dubbo.rpc.service.GenericService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
*   @Author: 土豆仙
*   @Date: 2021/8/25 21:15
*   @Description: Dubbo的Consumer端需要在运行时才知道调用具体的Dubbo服务，而这个<dubbo:reference/>并没有在spring的bean中配置
*/
@Component
public class MyReferenceUtils {

    /**
     * 注册中心地址
     */
    @Value("${dubbo.registry.address}")
    private String registryAddress;

    /**
     * 应用名
     */
    private String appllicationName;

    /**
     * 协议
     */
    private String protocol;
    /**
     * 检测
     */
    private  Boolean check = false;

    /**
     * 调用超时时间 毫秒
     */
    private  Integer timeout;




    /**
     * 获取缓存的MyReferenceConfig
     *
     * @param insterfaceName 接口全名
     * @param version        版本号
     * @return
     */
    public GenericService getCacheGenericServiceByKey(String insterfaceName, String version) {
        ReferenceConfigCache cache = ReferenceConfigCache.getCache();
        ReferenceConfig<GenericService> referenceConfig = this.createReferenceConfig(appllicationName, registryAddress, protocol, check, timeout);
        referenceConfig.setId(insterfaceName);
        // 弱类型接口名
        referenceConfig.setInterface(insterfaceName);
        // 设置版本
        referenceConfig.setVersion(version);
        // 声明为泛化接口
        referenceConfig.setGeneric(true);
        return cache.get(referenceConfig);
    }


    /**
     * 创建ReferenceConfig 对象
     *
     * @param applicationName 应用名
     * @param address         地址
     * @param protocol        协议
     * @param check           是否检测提供者
     * @param timeout         超时时间
     * @return
     */
    private ReferenceConfig<GenericService> createReferenceConfig(String applicationName, String address, String protocol, Boolean check, Integer timeout) {
        ReferenceConfig<GenericService> referenceConfig = new ReferenceConfig<GenericService>();
        ApplicationConfig application = new ApplicationConfig();
        application.setName(applicationName);
        referenceConfig.setApplication(application);
        RegistryConfig registryConfig = new RegistryConfig(address);
        registryConfig.setProtocol(protocol);
        ConsumerConfig consumerConfig = new ConsumerConfig();
        consumerConfig.setCheck(check);
        consumerConfig.setTimeout(timeout);
        referenceConfig.setRegistry(registryConfig);
        referenceConfig.setConsumer(consumerConfig);
        return referenceConfig;
    }
}
