package Bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher_information {
    private String date;
    private String tno;
    private String identity;            //教职工身份
    private String vacationschool;      //假期是否留校
    private String atschool;            //是否已经返校
    private String nowcountry;          //当前所在国家
    private String nowarea;             //当前所在地
    private String fever;               //是否发热
    private String health;              //个人健康状况
    private String abroad;              //近14日是否曾逗留境外
    private String situationone;        //14日内有疫情中风险地旅居史
    private String situationtwo;        //14日内接触过疫情中风险地返粤人员
    private String situationthree;      //14日内有疫情高风险地旅居史
    private String situationfour;       //14日内接触过疫情高风险地返粤人员
    public static String DATETYPe="yyyy-MM-dd";
    private SimpleDateFormat simpleDateFormat=new SimpleDateFormat(DATETYPe);

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public void setDate(Date date) {
        this.date = simpleDateFormat.format(date);
    }
}
