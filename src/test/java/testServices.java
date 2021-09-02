import Bean.Student;
import Mapper.AdminMapper;
import Mapper.StudentMapper;
import Mapper.Student_information;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:springmvc.xml", "classpath:spring.xml"})
public class testServices {
    @Autowired
    AdminMapper adminMapper;
    @Autowired
    Student_information student_information;
    @Autowired
    StudentMapper studentMapper;

    @Test
    public void testStudent() {
        Student student = new Student();
        student.setOrganization("软件工程2班");
        System.out.println(studentMapper.findbyogr(student.getOrganization()));
       /* System.out.println(student);
       System.out.println(studentMapper.selectByCondition(student));*/
        /*studentMapper.selectByCondition(null).forEach(
                student -> System.out.println(student)
        );
        System.out.println("====");
        studentMapper.findbyogr("软件工程2班").forEach(
                student -> System.out.println(student)
        );*/
//        System.out.println(students);
    }
    @Test
    public void testinformation()
    {
        System.out.println(student_information.FindById("201824113328","2021-05-28"));
    }
    @Test
    public void test() {
        Bean.Student_information student = new Bean.Student_information();
        java.util.Date date = new java.util.Date();
        //date.toString();
//        System.out.println(student_information.FindById("132",Date.valueOf("2021-04-29")));
        /*try {
            student = student_information.FindById("132", Date1.valueOf(date));
            System.out.println(student);
        }catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("===");
        }*/
    }

}
