package Controller;

import Bean.Admin;
import Bean.Message;
import Bean.Student_information;
import Bean.Teacher_information;
import Services.AdminServices;
import Services.Student_inoformationServices;
import Services.Teacher_informationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class AdminDataController {
    @Autowired
    Student_inoformationServices student_inoformationServices;
    @Autowired
    AdminServices adminServices;
    @Autowired
    Teacher_informationService teacher_informationService;
    //获得所有学生的打卡信息
    @GetMapping("/student_informations/{date}")
    public Message getToday(@PathVariable("date")String date,
                            @RequestParam(value = "pn",defaultValue = "1")Integer pn)
    {
        PageHelper.startPage(pn,7);
        List<Student_information> l=student_inoformationServices.byDate(date);
        PageInfo<Student_information> info=new PageInfo<>(l,5);
        return Message.success().add("information",info);
    }
    //条件查询符合的打卡信息
    @GetMapping("/student_information/{date}")
    public Message getBycondition(Student_information information,@PathVariable("date")String date,
                                  @RequestParam(defaultValue = "1",value = "pn")Integer pn)
    {
        information.setDate(date);
        PageHelper.startPage(pn,7);
        List<Student_information> l=student_inoformationServices.select(information);
        PageInfo<Student_information> info=new PageInfo<>(l,5);
        return Message.success().add("information",info);
    }
    //修改密码
    @PutMapping("/admin")
    public Message changepd(@Validated Admin admin, BindingResult result)
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
        adminServices.update(admin);
        return Message.success();
    }
    //提交打卡
    @PutMapping("/students_informations/{date}")
    public Message submit(@PathVariable("date")String date)
    {
        student_inoformationServices.submit(date);
        return Message.success();
    }
    //查询教师当天打卡信息
    @GetMapping("/teacher_informations/{date}")
    public Message Today(@PathVariable("date")String date,@RequestParam(value="pn",defaultValue = "1")Integer pn)
    {
        PageHelper.startPage(pn,7);
       List<Teacher_information>l= teacher_informationService.today(date);
       PageInfo<Teacher_information>info=new PageInfo<>(l,7);
       return Message.success().add("information",info);
    }
}
