package com.jiron.system.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.jiron.system.domain.SysUserOnline;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jiron.common.core.constant.CacheConstants;
import com.jiron.common.core.utils.StringUtils;
import com.jiron.common.core.web.controller.BaseController;
import com.jiron.common.core.web.domain.AjaxResult;
import com.jiron.common.core.web.page.TableDataInfo;
import com.jiron.common.log.annotation.Log;
import com.jiron.common.log.enums.BusinessType;
import com.jiron.common.redis.service.RedisService;
import com.jiron.common.security.annotation.RequiresPermissions;
import com.jiron.system.api.model.LoginUser;
import com.jiron.system.service.ISysUserOnlineService;

/**
 * 在线用户监控
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/online")
public class SysUserOnlineController extends BaseController
{
    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private RedisService redisService;

    @RequiresPermissions("monitor:online:list")
    @GetMapping("/list")
    public TableDataInfo list(String ipaddr, String userName)
    {
        Collection<String> keys = redisService.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<SysUserOnline> userOnlineList = new ArrayList<SysUserOnline>();
        for (String key : keys)
        {
            LoginUser user = redisService.getCacheObject(key);
            if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName))
            {
                userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, user));
            }
            else if (StringUtils.isNotEmpty(ipaddr))
            {
                userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, user));
            }
            else if (StringUtils.isNotEmpty(userName))
            {
                userOnlineList.add(userOnlineService.selectOnlineByUserName(userName, user));
            }
            else
            {
                userOnlineList.add(userOnlineService.loginUserToUserOnline(user));
            }
        }
        Collections.reverse(userOnlineList);
        userOnlineList.removeAll(Collections.singleton(null));
        return getDataTable(userOnlineList);
    }

    /**
     * 强退用户
     */
    @RequiresPermissions("monitor:online:forceLogout")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @DeleteMapping("/{tokenId}")
    public AjaxResult forceLogout(@PathVariable String tokenId)
    {
        redisService.deleteObject(CacheConstants.LOGIN_TOKEN_KEY + tokenId);
        return success();
    }
}
