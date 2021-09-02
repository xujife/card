package Mapper;

import Bean.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface AdminMapper {
    public Admin login(String id);
    public Map<String,Object> selectByCondition(Admin admin);
    public boolean delete(String id);
    public boolean add(Admin admin);
    //   public int BantchAdd(Map<String,Object> students);
    public boolean update(Admin admin);
}
