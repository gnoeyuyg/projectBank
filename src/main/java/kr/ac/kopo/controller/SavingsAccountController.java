package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.savings.service.SavingsAccountService;
import kr.ac.kopo.savings.vo.SavingsAccountVO;

@Controller
public class SavingsAccountController {

    @Autowired
    private SavingsAccountService savingsAccountService;

    @GetMapping("/savingsAccountRegister")
    public String savingsAccountRegisterForm(HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        model.addAttribute("userVO", user); // 사용자 정보를 모델에 추가

        try {
            List<String> depositTypes = savingsAccountService.getAllDepositTypes();
            model.addAttribute("depositTypes", depositTypes);
            model.addAttribute("savingsAccount", new SavingsAccountVO());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while fetching deposit types.");
        }
        return "savings/savingsAccountRegister";
    }

    @PostMapping("/savingsAccountRegister")
    public String savingsAccountRegister(@ModelAttribute SavingsAccountVO savingsAccount, 
                                         @RequestParam("depositType") String depositType, 
                                         HttpSession session, 
                                         Model model) {
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        try {
            if (depositType == null || depositType.isEmpty()) {
                throw new IllegalArgumentException("Deposit type is null or empty");
            }
            int productNumber = savingsAccountService.getProductNumber(depositType);
            String accountNum = savingsAccountService.generateUniqueSavingsAccountNumber(productNumber);
            savingsAccount.setSavings_account_num(accountNum);
            savingsAccount.setProduct_number(productNumber);
            savingsAccount.setDeposit_type(depositType);
            SavingsAccountVO savingsAccountRegisterVO = savingsAccountService.savingsAccountRegister(savingsAccount);
            if (savingsAccountRegisterVO != null) {
                model.addAttribute("accountNumber", accountNum);
                model.addAttribute("amount", savingsAccount.getAmount());
                model.addAttribute("expiration_date", savingsAccount.getExpiration_date());
                model.addAttribute("interestRate", savingsAccount.getInterest_rate());
                return "savings/successSavingsAccount";
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

    @GetMapping("/generateAccountNumber")
    @ResponseBody
    public String generateAccountNumber(@RequestParam("productNumber") int productNumber) throws Exception {
        return savingsAccountService.generateUniqueSavingsAccountNumber(productNumber);
    }

    @GetMapping("/manager/updateFI")
    public String updateFI() {
        return "manager/updateFI";
    }

    @GetMapping("/savingsCRUD/add")
    public String addSavingsAccountForm(Model model) {
        model.addAttribute("savingsAccount", new SavingsAccountVO());
        return "savingsCRUD/add";
    }

    @PostMapping("/savingsCRUD/add")
    public String addSavingsAccount(@ModelAttribute("savingsAccount") SavingsAccountVO savingsAccount, BindingResult result , Model model) {
        if(result.hasErrors()) {
            System.out.println("ERROR");
        }

        try {
            savingsAccountService.createSavings(savingsAccount);
            model.addAttribute("addSuccess", true);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("addFailure", true);
        }
        return "savingsCRUD/add";
    }

    @GetMapping("/savingsCRUD/edit")
    public String editSavingsAccountForm(Model model) {
        model.addAttribute("savingsAccount", new SavingsAccountVO());
        return "savingsCRUD/edit";
    }

    @PostMapping("/savingsCRUD/edit")
    public String editSavingsAccount(@ModelAttribute("savingsAccount") SavingsAccountVO savingsAccount, Model model) {
        try {
            savingsAccountService.updateSavingsAccount(savingsAccount);
            model.addAttribute("editSuccess", true);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("editFailure", true);
        }
        return "savingsCRUD/edit";
    }

    @GetMapping("/savingsCRUD/delete")
    public String deleteSavingsAccountForm(Model model) {
        return "savingsCRUD/delete";
    }

    @PostMapping("/savingsCRUD/delete")
    public String deleteSavingsAccount(@RequestParam("depositType") String depositType, Model model) {
        try {
            savingsAccountService.deleteSavingsAccountByType(depositType);
            model.addAttribute("deleteSuccess", true);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("deleteFailure", true);
        }
        return "savingsCRUD/delete";
    }
}
