package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class test {
    @RequestMapping("/das")
    public void das(@RequestParam("dasfd")String da)
    {
        System.out.println(da);
    }
}
