package Bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.swing.*;
import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student_information implements Serializable {
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private Date date;
    private String sno;
    private String nationality;        //国籍
    private String location;           //户籍所在身份
    private String vacationschool;     //假期是否留校
    private String dayschool;          //本日是否留校
    private String nowcountry;         //当前所在国家
    private String nowarea;            //当前所在地
    private String fever;              //是否发热
    private String health;             //个人健康情况
    private String train;              //是否正在参加培训
    private String abroad;             //近14日是否曾逗留境外
    private String situationone;       //14日内有疫情中风险地旅居史
    private String situationtwo;       //14日内接触过疫情中风险地返粤人员
    private String situationthree;     //14日内有疫情高风险地旅居史
    private String situationfour;      //14日内接触过疫情高风险地返粤人员
    private String submit;             //是否已经提交

    public static String DATETYPe="yyyy-MM-dd";
    private SimpleDateFormat simpleDateFormat=new SimpleDateFormat(DATETYPe);
    private String date;


    public String getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = simpleDateFormat.format(date);
    }
    public void setDate(String date) {
        this.date = date;
    }
}
