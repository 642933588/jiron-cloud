package com.jiron.system.facada;

import com.jiron.common.core.domain.R;
import com.jiron.common.security.annotation.InnerAuth;
import com.jiron.system.api.domain.SysUser;
import com.jiron.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SysUserFacade {
    @Autowired
    private ISysUserService userService;

    /**
     * 获取当前用户信息
     */
    @InnerAuth
    @GetMapping("/user/infoById/{userId}")
    public R<SysUser> info(@PathVariable("userId") Long userId) {
        SysUser sysUser = userService.selectUserById(userId);
        return R.ok(sysUser);
    }

    /**
     * 获取所有用户
     */
    @InnerAuth
    @GetMapping("/user/selectList")
    public R<List<SysUser>> selectList() {
        List<SysUser> sysUsers = userService.selectUserList(new SysUser());
        return R.ok(sysUsers);
    }
}
