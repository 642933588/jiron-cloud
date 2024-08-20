package com.jiron.gateway.config.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 内部服务配置
 *
 * @author ruoyi
 */
@Configuration
@RefreshScope
@ConfigurationProperties(prefix = "security.source")
public class InnerSourceProperties
{
    /**
     * 放行白名单配置，网关不校验此处的白名单
     */
    private List<String> inners = new ArrayList<>();

    public List<String> getInners()
    {
        return inners;
    }

    public void setInners(List<String> inners)
    {
        this.inners = inners;
    }
}
