package ru.otus.highload.socialbackend.config.data.replication;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "spring.datasource-slave")
@Getter
@Setter
public class SlaveDataSourceProp {

    private String driverClassName;
    private String jdbcUrl;
    private String username;
    private String password;
    private String platform;
    private int idleTimeout;
    private int maximumPoolSize;
    private int minimumIdle;
    private String poolName;
}
