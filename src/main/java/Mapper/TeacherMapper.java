package Mapper;

import Bean.Student;
import Bean.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherMapper {
    Teacher login(String id);
    Map<String,Object> selectByCondition(Teacher teacher);
    boolean delete(String id);
    boolean add(Teacher teacher);
    boolean update(Teacher teacher);
    List<Teacher> findByTname(String tname);
}
