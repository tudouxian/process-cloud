package com.workflow.process.bussiness.config.process;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@EqualsAndHashCode(callSuper = true)
@Component
@ConfigurationProperties(prefix = "process.leave")
@Data
public class ProcessLeaveProperties extends ProcessBaseProperties {
}
