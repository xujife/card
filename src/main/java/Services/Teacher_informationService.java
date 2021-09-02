package Services;

import Bean.Teacher_information;
import Mapper.TeacherMapper;
import Mapper.Teacher_informationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Teacher_informationService {
    @Autowired
    private Teacher_informationMapper teacher_informationMapper;
    public List<Teacher_information> getall(String tno)
    {
        return teacher_informationMapper.findbyTno(tno);
    }

    public Teacher_information FindbyPrimarykey(String date, String tno) {
        return teacher_informationMapper.FindBySnoDate(date,tno);
    }

    public void add(Teacher_information teacher_information) {
        teacher_informationMapper.add(teacher_information);
    }

    public List<Teacher_information> today(String date) {
        return teacher_informationMapper.findbytoday(date);
    }
}
