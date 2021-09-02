package Controller;

import Bean.Admin;
import Bean.Student;
import Bean.Student_information;
import Bean.Teacher;
import Services.AdminServices;
import Services.StudentService;
import Services.TeacherServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@Controller
public class PageController {
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherServices teacherServices;
    @Autowired
    AdminServices adminServices;
    @RequestMapping("/login")
    public String Login(@RequestParam("admin")String admin,
                        @RequestParam("password")String password,
                        @RequestParam(value = "type",required = false) String type,
                        HttpServletRequest request) throws IOException {
        if(type.equals("student")) {
           Student student = studentService.login(admin);
            //System.out.println(student);
            if(student==null||!student.getSpw().equals(password))
            {
                request.getSession().setAttribute("msg","账号或密码错误！");
                return "login";
            }
            request.getSession().setAttribute("ogr",student.getOrganization());
        }else if (type.equals("teacher")) {
            Teacher teacher=teacherServices.login(admin);
            if (teacher==null||!teacher.getTpw().equals(password))
            {
                request.getSession().setAttribute("msg","账号或密码错误！");
                return "login";
            }
            request.getSession().setAttribute("ogr",teacher.getOrganization());
        }
        else {
            Admin admins=adminServices.login(admin);
            System.out.println(admins);
            if (admins==null||!admins.getPassword().equals(password))
            {
                request.getSession().setAttribute("msg","账号或密码错误！");
                return "login";
            }
        }
        request.getSession().setAttribute("user",admin);
        request.getSession().setAttribute("admin","true");
        return "redirect:"+type+"_Function";
    }
   @RequestMapping("/{page}")
    public String middle(HttpServletRequest request, @PathVariable("page")String motivation)
    {
        if(request.getSession().getAttribute("admin")==null||
                !request.getSession().getAttribute("admin").equals("true"))
        {
            request.getSession().setAttribute("msg","请先登录!");
            return "login";
        }
        else return motivation;
    }
    @RequestMapping("/Replace")
    public String page()
    {
        return "stu_Replace";
    }
    @RequestMapping("/tea_replace")
    public String replace()
    {
        return "tea_replace";
    }
    @RequestMapping("/index")
    public String index(HttpServletRequest request)
    {
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("ogr");
        request.getSession().removeAttribute("admin");
        return "login";
    }
    @RequestMapping("/print")
    public String print(@RequestParam("list")List<Student_information> l, Model m )
    {
        m.addAttribute("list",l);
        return "print";
    }
}
