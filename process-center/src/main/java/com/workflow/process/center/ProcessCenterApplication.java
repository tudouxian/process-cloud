package com.workflow.process.center;

import com.workflow.process.center.utils.SnowIdUtils;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.flowable.engine.impl.persistence.entity.ExecutionEntityManagerImpl;
import org.flowable.task.service.impl.persistence.entity.TaskEntityImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableFeignClients
@EnableDubbo
@MapperScan("com.workflow.process.center.mapper")
public class ProcessCenterApplication {

    public static void main(String[] args) {

        SpringApplication.run(ProcessCenterApplication.class, args);
    }

    @Bean
    public SnowIdUtils snowIdUtils() {
        return new SnowIdUtils(1, 1);
    }
}
