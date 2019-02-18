package com.zking.ssm.mapper;

import com.zking.ssm.model.Module;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface ModuleMapper {
    List<Module> queryModule(Module module);
    List<Module> queryUserModule(String uuid);
}