package Services;

import Bean.Permission;
import Mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    public List<Permission> getall()
    {
        return permissionMapper.all();
    }
}
