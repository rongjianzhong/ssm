package com.zking.ssm.service;

import com.zking.ssm.model.Module;

import java.util.List;
public interface IModuleService {
    List<Module> queryModule(Module module);

    List<Module> queryUserModule(String uuid);
}