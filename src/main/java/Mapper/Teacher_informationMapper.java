package Mapper;

import Bean.Teacher;
import Bean.Teacher_information;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface Teacher_informationMapper {
    public List<Teacher_information> all();
    public List<Teacher_information> findbyTno(String tno);
    public Teacher_information FindBySnoDate(@Param("date") String date, @Param("tno") String tno);
    public void delete(@Param("date") Date date, @Param("tno") String tno);
    public void add(Teacher_information teacher_information);
    public void update(Teacher_information teacher_information);
    List<Teacher_information> findbytoday(String date);
}
