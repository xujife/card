package Services;

import Bean.Teacher;
import Mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServices {
    @Autowired
    TeacherMapper teacherMapper;
    public Teacher login(String id)
    {
        return teacherMapper.login(id);
    }


    public boolean update(Teacher teacher) {
        return teacherMapper.update(teacher);
    }

    public List<Teacher> checkname(String tname) {
        return teacherMapper.findByTname(tname);
    }
}
