package Services;

import Bean.Organization;
import Mapper.OrganizationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class organizationService {
    @Autowired
    OrganizationMapper organizationMapper;
    public List<Organization> getall()
    {
        return organizationMapper.all();
    }

}
