package com.workflow.process.center.service.impl;

import com.workflow.process.center.BaseTest;
import com.workflow.process.center.service.CommonMongoService;
import io.minio.MinioClient;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
class CommonMongoServiceImplTest extends BaseTest {

    @Autowired
    private CommonMongoService commonMongoService;

    /*@Autowired
    private MongoTemplate mongoTemplate;*/

    @Autowired
    private MinioClient client;

    @Test
    void createCollection() {

        // commonMongoService.createCollection("test");
    }

    @Test
    void createIndex() {
    }

    @Test
    void getAllIndexes() {
    }

    @Test
    void insert() {
    }

    @Test
    void insertMulti() {
    }

    @Test
    void updateById() {
    }

    @Test
    void deleteById() {
    }

    @Test
    void selectById() {
    }

    @Test
    void selectList() {
    }

    @Test
    void testSelectList() {
        //设置分页参数
       /* Query query = new Query();
        List<Document> work_flow_data = mongoTemplate.find(query, Document.class, "leave");
        System.out.println(work_flow_data);*/
    }

    @Test
    void selectByCondition() {
    }
}