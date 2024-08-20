package com.jiron.dolphinscheduler.api;

import com.jiron.dolphinscheduler.api.factory.RemoteProjectFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;
import com.jiron.common.core.constant.SecurityConstants;
import com.jiron.common.core.constant.ServiceNameConstants;
import com.jiron.common.core.domain.R;

/**
 * 用户服务
 *
 * @author ruoyi
 */
@FeignClient(contextId = "remoteProjectService", value = ServiceNameConstants.DOLPHINSCHEDULER_SERVICE, fallbackFactory = RemoteProjectFallbackFactory.class)
public interface RemoteProjectService {

    @GetMapping("/facade/projects")
    public R projects(String searchVal, Integer pageSize,
                      Integer pageNo, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

}
