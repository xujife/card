package Controller;

import Bean.Message;
import Bean.Permission;
import Bean.Teacher;
import Bean.Teacher_information;
import Mapper.PermissionMapper;
import Services.TeacherServices;
import Services.Teacher_informationService;
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
public class TeacherDataController {
    @Autowired
    private Teacher_informationService teacher_informationService;
    @Autowired
    private TeacherServices teacherServices;
    @Autowired
    private PermissionMapper permissionMapper;
    @GetMapping(value="/teacher_information")
    public Message getteacher_information(@RequestParam("tno")String tno,
                                          @RequestParam(value = "pn",defaultValue = "1")Integer pn)
    {
        PageHelper.startPage(pn, 7);
        List<Teacher_information> l = teacher_informationService.getall(tno);
        PageInfo<Teacher_information> info = new PageInfo<>(l);
        info.calcByNavigatePages(5);
        return Message.success().add("informations", info);
    }
    //查询详细打卡信息
    @GetMapping("/teacher_information/{tno}/{date}")
    public Message getdetail(@PathVariable("date")String date,@PathVariable("tno")
                             String tno)
    {
        Teacher_information teacher_information=teacher_informationService.FindbyPrimarykey(date,tno);
        return Message.success().add("information",teacher_information);
    }
    //打卡
    @PostMapping("/teacher_information")
    public Message checkin(Teacher_information teacher_information)
    {
        teacher_informationService.add(teacher_information);
        return Message.success();
    }
    //查询个人信息
    @GetMapping("/teacher/{tno}")
    public Message getmyself(@PathVariable("tno")String tno)
    {
       Teacher teacher=teacherServices.login(tno);
       return Message.success().add("teacher",teacher);
    }
    //确认更新
    @PutMapping("/teacher")
    public Message update(@Validated Teacher teacher, HttpServletRequest request,
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
        boolean code=teacherServices.update(teacher);
        request.getSession().removeAttribute("ogr");
        request.getSession().setAttribute("ogr",teacher.getOrganization());
        return Message.success();
    }
    //判断姓名是否可存在
    @GetMapping("/teacher/{tno}/{tname}")
    public Message checktea_name(@PathVariable("tno")String tno,@PathVariable("tname")String tname)
    {
        List<Teacher>l=teacherServices.checkname(tname);
        if(l==null||l.size()==0) return Message.success();
        else
        {
            /*System.out.println("==");*/
            if(l.get(0).getTname().equals(tname)) return Message.success();
            return Message.falied();
        }
    }
    //查询是否具有权限
    @GetMapping("/permission/{sno}")
    public Message check(@PathVariable("sno")String sno)
    {
        Permission permission=permissionMapper.FindBySno(sno);
        if(permission==null) return Message.falied();
        else return Message.success();
    }
    //赋予权限
    @PostMapping("/permission/{id}/{sno}")
    public Message grant(@PathVariable("id")String id,@PathVariable("sno")String sno)
    {
        Permission permission=new Permission(id,sno);
        permissionMapper.add(permission);
        return Message.success();
    }
}
