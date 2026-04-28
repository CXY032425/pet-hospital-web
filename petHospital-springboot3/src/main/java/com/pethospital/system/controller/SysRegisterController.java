package com.pethospital.system.controller;

import com.pethospital.system.general.core.controller.BaseController;
import com.pethospital.system.general.core.domain.AjaxResult;
import com.pethospital.system.general.core.domain.model.RegisterBody;
import com.pethospital.system.general.utils.StringUtils;
import com.pethospital.system.configure.web.service.SysRegisterService;
import com.pethospital.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册验证
 *

 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
