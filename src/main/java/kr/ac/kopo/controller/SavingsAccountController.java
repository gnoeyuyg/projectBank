package kr.ac.kopo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.savings.service.SavingsAccountService;
import kr.ac.kopo.savings.vo.SavingsAccountVO;

@Controller
public class SavingsAccountController {

    @Autowired
    private SavingsAccountService savingsAccountService;

    @PostMapping("/savingsAccountRegister")
    public String savingsAccountRegister(@ModelAttribute SavingsAccountVO savingsAccount, Model model) {
        try {
            SavingsAccountVO savingsAccountRegisterVO = savingsAccountService.savingsAccountRegister(savingsAccount);
            if (savingsAccountRegisterVO != null) {
                model.addAttribute("registerSuccess", true);
            } else {
                model.addAttribute("registerFailure", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("registerFailure", true);
        }
        return "savings/savingsAccountRegister";
    }

    @PostMapping("/savingsDeposit")
    public String savingsDeposit(@RequestParam("savingAccountNum") String savingAccountNum, @RequestParam("amount") int amount, Model model) {
        try {
            boolean success = savingsAccountService.savingsDeposit(savingAccountNum, amount);
            if (success) {
                model.addAttribute("depositSuccess", true);
            } else {
                model.addAttribute("depositFailure", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("depositFailure", true);
        }
        return "savings/savingsDeposit";
    }
    @GetMapping("/savingsAccountRegister")
    public String savingsAccountRegisterForm() {
        return "savings/savingsAccountRegister";
    }
}
