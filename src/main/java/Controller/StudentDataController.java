package Controller;

import Bean.*;
import Mapper.PermissionMapper;
import Mapper.StudentMapper;
import Services.PermissionService;
import Services.StudentService;
import Services.Student_inoformationServices;
import Services.organizationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class StudentDataController {
    @Autowired
    private Student_inoformationServices student_inoformationServices;
    @Autowired
    private StudentService studentService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private organizationService organizationService;
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private StudentMapper studentMapper;
    //获取打卡信息
    @GetMapping(value = "/student_information")
    public Message getall(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                          @RequestParam(value = "sno") String sno) {
        PageHelper.startPage(pn, 7);
        List<Student_information> l = student_inoformationServices.FindBySno(sno);
        PageInfo<Student_information> info = new PageInfo<>(l, 5);
        return Message.success().add("informations", info);
    }

    //查询
    @GetMapping(value = "/student_information/{date}/{sno}")
    public Message findbyId(@PathVariable("date") String date, @PathVariable("sno") String sno) {
        Student_information student_information = student_inoformationServices.FindByPrimaryKey(sno, date);
        return Message.success().add("information", student_information);
    }

    //打卡
    @PostMapping(value = "/student_information")
    public Message add(Student_information student_information) {
        boolean code = student_inoformationServices.insert(student_information);
        if (code) return Message.falied();
        else return Message.success();
    }

    //更新打卡信息
    @PutMapping(value = "/student_information")
    public Message update(Student_information information) {
        boolean code = student_inoformationServices.update(information);
        if (code) return Message.falied();
       else return Message.success();
    }
    //查看权限
    @RequestMapping(value="/students/{id}")
    public Message findbyID(@PathVariable("id")String id)
    {
       Permission permission= permissionMapper.FindBySno(id);
        if(permission!=null) return Message.success();
        else return Message.falied();
    }
    //查询相同组织的学生
    @GetMapping(value="/student")
    public Message findbyogr(@RequestParam("ogr")String ogr) {
        Student student=new Student();
        student.setOrganization(ogr);
        List<Student>students=studentService.selectbycondition(student);
        return Message.success().add("students", students);
    }
    //查询学生信息
    @GetMapping("/student/{sno}")
    public Message findbyId(@PathVariable("sno")String sno)
    {
        Student student=studentService.login(sno);
        return Message.success().add("student",student);
    }
    //更新个人信息
    @PutMapping("/student")
    public Message updatemyself(@Validated Student student,
                                HttpServletRequest request,
                                BindingResult result)
    {
        Map<String,Object> map=new HashMap<>();
        if(result.hasErrors())
        {
            List<FieldError> error=result.getFieldErrors();
            for(FieldError fe:error)
            {
                map.put(fe.getField(), fe.getDefaultMessage());
            }
            return Message.falied().add("errors", map);
        }
        studentService.update(student);
        request.getSession().removeAttribute("ogr");
        request.getSession().setAttribute("ogr",student.getOrganization());
        return Message.success();
    }
    //查询学生用户名是否存在
    @GetMapping("/student/{sno}/{name}")
    public Message checkname(@PathVariable("name")String name)
    {
       List<Student> l=studentService.FindByName(name);
        if(l==null||l.size()==0) return Message.success();
        else
        {
            if(l.get(0).getSname().equals(name)) return Message.success();
            return Message.falied();
        }
    }
    //查询所有学生
    @GetMapping("/students")
    public Message GetAllStudents()
    {
        List<Student>l=studentService.getall(new Student());
        return Message.success().add("list",l);
    }
    @GetMapping("/permissions")
    public Message getall()
    {
        List<Permission>l=permissionMapper.all();
        return Message.success().add("list",l);
    }
    //查询所有部门
    @GetMapping("/organizations")
    public Message getogr()
    {
        List<Organization>l=organizationService.getall();
        return Message.success().add("ogr",l);
    }
}
