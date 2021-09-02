package Mapper;

import Bean.Organization;

import java.util.List;
public interface OrganizationMapper {
    public void add(Organization organization);
    public void delete(String code);
    public List<Organization> all();
    public void update(Organization organization);
}
