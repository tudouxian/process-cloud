package com.workflow.process.bussiness;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubbo
@MapperScan("com.workflow.process.bussiness.mapper")
public class BussinessApplication {

    public static void main(String[] args) {

        SpringApplication.run(BussinessApplication.class, args);
    }
}
