package Mapper;

import Bean.Permission;

import java.util.List;

public interface PermissionMapper {
    public void add(Permission permission);
    public void delete(String id);
    public List<Permission> all();
    public void update(Permission permission);
    public Permission FindBySno(String sno);  //通过学号去找，如果找的到，证明这个学生有特权
}
