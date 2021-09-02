import Bean.Student;
import Controller.PageController;
import Mapper.StudentMapper;
import Mapper.Student_information;
import Services.AdminServices;
import Services.StudentService;
import Services.Student_inoformationServices;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:springmvc.xml","classpath:spring.xml"})
@WebAppConfiguration
public class MyTest1 {
    @Autowired
    Student_inoformationServices student_inoformationServices;
    @Autowired
    Student_information student_information;
    @Autowired
   WebApplicationContext context;
    MockMvc mockMvc;
    @Before
    public void unit(){
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }
@Test
   public void test(){
     Bean.Student_information student_information1= student_information.FindById("132","2021-04-28");
    System.out.println(student_information1);
   }
}
