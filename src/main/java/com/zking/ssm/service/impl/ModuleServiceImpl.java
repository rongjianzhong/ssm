package com.zking.ssm.service.impl;

import com.zking.ssm.mapper.ModuleMapper;
import com.zking.ssm.model.Module;
import com.zking.ssm.service.IModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class ModuleServiceImpl implements IModuleService {
    @Autowired
    private ModuleMapper moduleMapper;

    @Transactional(readOnly = true)
    @Override
    public List<Module> queryModule(Module module) {
        return moduleMapper.queryModule(module);
    }

    @Override
    public List<Module> queryUserModule(String uuid) {
        return moduleMapper.queryUserModule(uuid);
    }
}
