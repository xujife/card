package Services;

import Mapper.Student_information;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Student_inoformationServices {
    @Autowired
    private Student_information student_information;
    public List<Bean.Student_information> getall()
    {
        return student_information.getAll();
    }
    public Bean.Student_information FindByPrimaryKey(String sno, String date)
    {
        return student_information.FindById(sno, date);
    }
    public List<Bean.Student_information> FindBySno(String sno) {
        return student_information.FindBySno(sno);
    }

    public boolean update(Bean.Student_information information) {
        return student_information.update(information);
    }

    public boolean insert(Bean.Student_information information) {
        return student_information.add(information);
    }

    public List<Bean.Student_information> byDate(String date) {
        return student_information.FindByDate(date);
    }

    public List<Bean.Student_information> select(Bean.Student_information information) {
            return  student_information.SelectByCondition(information);
    }

    public void submit(String date) {
        student_information.submit(date);
    }
}
