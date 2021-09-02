package Bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Riskarea {
    private String areaname;  //风险区
    private String num;      //感染人数
}
