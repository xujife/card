package Bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    @NotNull
    @Pattern(regexp = "(^[0-9]{8,12})",message = "学号由8-12位数字组成")
    private String sno;             //学号
    @NotNull
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "姓名必须是6-16位英文或2-5位中文")
    private String sname;           //姓名
    private String sid;             //身份证
    @NotNull
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,12})",message = "密码由6-12位数字和字符组成")
    private String spw;             //密码
    private String organization;    //组织
    @NotNull
    @Pattern(regexp = "(^1\\d{10}$)",message = "手机号码由11位数字组成,且第一位为1开头")
    private String phone;           //电话
}
