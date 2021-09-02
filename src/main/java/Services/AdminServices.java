package Services;

import Bean.Admin;
import Bean.Teacher;
import Mapper.AdminMapper;
import Mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServices {
    @Autowired
    private AdminMapper adminMapper;
    public Admin login(String admin)
    {
        return adminMapper.login(admin);
    }

    public void update(Admin admin) {
        adminMapper.update(admin);
    }
}
