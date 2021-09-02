package Services;

import Bean.Student;
import Mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentMapper studentMapper;
    public Student login(String id)
    {
        return studentMapper.login(id);
    }

    public List<Student> findbyogr(String ogr) {
        return studentMapper.findbyogr(ogr);
    }

    public List<Student> getall(Student s) {
        return studentMapper.selectByCondition(s);
    }

    public boolean update(Student student) {
        return studentMapper.update(student);
    }

    public List<Student> selectbycondition(Student student) {
       // System.out.println("---------");
        //System.out.println(student);
        return studentMapper.selectByCondition(student);
    }

    public List<Student> FindByName(String name) {
       return studentMapper.findbyname(name);
    }
}
