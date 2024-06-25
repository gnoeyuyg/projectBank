package kr.ac.kopo.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @ResponseBody
    @GetMapping("/checkEmail")
    public String checkEmail(@RequestParam String email) {
        boolean isAvailable = customerService.isEmailAvailable(email);
        return String.valueOf(isAvailable);
    }
}
