package com.jiron.common.translation.core.impl;

import com.jiron.common.core.constant.SecurityConstants;
import com.jiron.common.core.domain.R;
import com.jiron.common.core.exception.ServiceException;
import com.jiron.common.core.utils.StringUtils;
import com.jiron.common.translation.annotation.TranslationType;
import com.jiron.common.translation.constant.TransConstant;
import com.jiron.system.api.domain.SysUser;
import lombok.AllArgsConstructor;
import com.jiron.common.translation.core.TranslationInterface;
import com.jiron.system.api.RemoteUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 用户名翻译实现
 *
 * @author Lion Li
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NAME)
@Slf4j
public class UserNameTranslationImpl implements TranslationInterface<String> {

    @Autowired
    private RemoteUserService remoteUserService;

    @Override
    public String translation(Object key, String other) {
        Long userId;
        if (key instanceof Integer) {
            userId = ((Integer) key).longValue();
        } else {
            userId = (Long) key;
        }
        R<SysUser> userResult = remoteUserService.getUserInfoById(userId, SecurityConstants.INNER);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData())) {
            log.warn("translation用户：" + key + " 不存在");
        }

        if (R.FAIL == userResult.getCode()) {
            log.error(userResult.getMsg(), new ServiceException(userResult.getMsg()));
        }
        SysUser userInfo = userResult.getData();

        return userInfo == null ? "" : userInfo.getUserName();
    }
}
