package Mapper;

import Bean.Student;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    public Student FindById(String id);
    public List<Student> selectByCondition(Student student);
    public boolean delete(String id);
    public boolean add(Student student);
 //   public int BantchAdd(Map<String,Object> students);
    public boolean update(Student student);
    public Student login(String admin);
    public List<Student> findbyogr(String ogr);
    public List<Student> findbyname(String name);
}
