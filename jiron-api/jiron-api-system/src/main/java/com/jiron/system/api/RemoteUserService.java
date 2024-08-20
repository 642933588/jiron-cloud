package com.jiron.system.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import com.jiron.common.core.constant.SecurityConstants;
import com.jiron.common.core.constant.ServiceNameConstants;
import com.jiron.common.core.domain.R;
import com.jiron.system.api.domain.SysUser;
import com.jiron.system.api.factory.RemoteUserFallbackFactory;
import com.jiron.system.api.model.LoginUser;

import java.util.List;

/**
 * 用户服务
 *
 * @author ruoyi
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService
{
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @param source 请求来源
     * @return 结果
     */
    @GetMapping("/user/info/{username}")
    public R<LoginUser> getUserInfo(@PathVariable("username") String username, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);


    /**
     * 注册用户信息
     *
     * @param sysUser 用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 通过用户id查询用户信息
     * @param userId
     * @param source
     * @return
     */
    @GetMapping("/user/infoById/{userId}")
    public R<SysUser> getUserInfoById(@PathVariable("userId") Long userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 获取所有用户信息
     * @param source
     * @return
     */
    @GetMapping("/user/selectList")
    public R<List<SysUser>> selectList(@RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
