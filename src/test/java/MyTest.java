import Bean.Student;
import Controller.PageController;
import Mapper.StudentMapper;
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
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Collection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:springmvc.xml", "classpath:spring.xml"})
@WebAppConfiguration
public class MyTest {
    @Autowired
    Student_inoformationServices student_inoformationServices;

    @Test
    public void test02() {
        student_inoformationServices.getall();
    }

    @Autowired
    AdminServices adminServices;

    @Test
    public void testservices() {
        adminServices.login("1");
    }

    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void unit() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void test01() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders
                .get("/login").param("admin", "2018241133")
                .param("password", "123456")
        ).andReturn();
        MockHttpServletRequest httpServletRequest = result.getRequest();
        String s = (String) httpServletRequest.getSession().getAttribute("msg");
        String d = (String) httpServletRequest.getSession().getAttribute("admin");
        System.out.println(s);
        System.out.println(d);
    }

    @Autowired
    StudentMapper studentMapper;
    @Autowired
    StudentService studentService;
    @Autowired
    PageController pageController;

    @Test
    public void testp() {
        if (pageController == null)
            System.out.println("===");
    }

    @Test
    public void test1() {
        Student student = studentService.login("2018241133");
        System.out.println(student);
    }

    @Test
    public void test() {
        Student student = studentMapper.login("2018241133");
        System.out.println(student);
    }
    @Test
    public void test131()
    {
        System.out.println(studentMapper.findbyogr("软件工程2班"));
    }
}
