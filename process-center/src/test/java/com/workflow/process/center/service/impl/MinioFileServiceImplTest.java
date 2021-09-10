package com.workflow.process.center.service.impl;

import com.workflow.process.center.BaseTest;
import io.minio.MinioClient;
import io.minio.SetBucketPolicyArgs;
import io.minio.errors.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
class MinioFileServiceImplTest extends BaseTest {

    @Autowired
    private MinioClient client;

    //设置桶匿名访问策略
    @Test
    void setMinioBucketPolicy() {

        String config = "{\n" +
                "    \"Version\": \"2012-10-17\",\n" +
                "    \"Statement\": [\n" +
                "        {\n" +
                "            \"Effect\": \"Allow\",\n" +
                "                \"Principal\": \"*\",\n" +
                "            \"Action\": [\n" +
                "                \"s3:GetBucketLocation\",\n" +
                "                \"s3:GetObject\"\n" +
                "            ],\n" +
                "            \"Resource\": [\n" +
                "                \"arn:aws:s3:::*\"\n" +
                "            ]\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        try {
            client.setBucketPolicy(SetBucketPolicyArgs.builder().bucket("process").config(config).build());

        } catch (ErrorResponseException | InsufficientDataException
                | InternalException | InvalidKeyException
                | InvalidResponseException | IOException
                | NoSuchAlgorithmException | ServerException
                | XmlParserException e) {
            log.error("[seed] [minio] 设置桶:{}策略失败", "process", e);
        }
    }
}