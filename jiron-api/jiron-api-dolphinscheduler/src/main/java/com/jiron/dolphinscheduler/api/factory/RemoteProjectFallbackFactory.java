package com.jiron.dolphinscheduler.api.factory;

import com.jiron.dolphinscheduler.api.RemoteProjectService;
import com.jiron.common.core.domain.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

@Component
public class RemoteProjectFallbackFactory implements FallbackFactory<RemoteProjectService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteProjectFallbackFactory.class);

    @Override
    public RemoteProjectService create(Throwable throwable) {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteProjectService() {
            @Override
            public R projects(String searchVal, Integer pageSize,
                              Integer pageNo, String source) {
                return R.fail("获取用户失败:" + throwable.getMessage());
            }

        };
    }
}
