package com.workflow.form.center;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.workflow.form.center.mapper")
public class FormCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(FormCenterApplication.class, args);
    }

}
