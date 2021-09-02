package Mapper;

import Bean.Riskarea;

import java.util.List;

public interface RiskareaMapper {
    //还差查看中高风险地区这一功能没实现
    //具体应该是根据每个地区的感染人数来定义中高低
    public void add(Riskarea riskarea);
    public boolean delete(String name);
    public boolean update(Riskarea riskarea);
    public List<Riskarea> all();
    public Riskarea FindByName(String name); //通过名字去查

}
