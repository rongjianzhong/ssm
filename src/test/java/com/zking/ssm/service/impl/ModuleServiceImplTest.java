package com.zking.ssm.service.impl;

import BaseTestCase.test;
import com.zking.ssm.model.Module;
import com.zking.ssm.service.IModuleService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class ModuleServiceImplTest extends test {
    @Autowired
    private IModuleService moduleService;

    @Override
    public void setUp() throws Exception {
        super.setUp();
    }

    @Test
    public void queryModule() {
        Module module = new Module();
        module.setPid(-1);
        List<Module> modules = moduleService.queryModule(module);
        for (Module module1 : modules) {
            System.out.println(module1);
        }
    }
}