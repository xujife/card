package Mapper;

import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.sql.Date;
import java.util.List;

public interface Student_information {
    public List<Bean.Student_information> getAll();
    public boolean update(Bean.Student_information student_information);
    public boolean add(Bean.Student_information student_information);

    /***
     *
     * @param sno
     * @param date
     * @return
     */
    public Bean.Student_information FindById(@Param("sno") String sno,@Param("date") String date);
    public List<Bean.Student_information> SelectByCondition(Bean.Student_information student_information);
    public List<Bean.Student_information> FindBySno(@Param("sno")String sno);
    public List<Bean.Student_information> FindByDate(@Param("date")String date);
    void submit(String date);
}
