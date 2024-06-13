package kr.ac.kopo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @GetMapping("/accountRegister")
    public String accountRegisterForm() {
        return "account/accountRegister";
    }

    @PostMapping("/accountRegister")
    public String accountRegister(@ModelAttribute AccountVO account, Model model) {
        try {
            AccountVO accountRegisterVO = accountService.accountRegister(account);
            System.out.println(account);
            String customerId = account.getCustomer_id();
            System.out.println(customerId);
            if (accountRegisterVO != null) {
                model.addAttribute("registerSuccess", true);
            } else {
                model.addAttribute("registerFailure", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("registerFailure", true);
        }
        return "redirect:/";
    }
    
    @GetMapping("/deposit")
    public String depositForm() {
        return "account/deposit";
    }

    @PostMapping("/deposit")
    public String deposit(@RequestParam("account_num") String accountNum, @RequestParam("amount") int amount, Model model) {
        try {
            boolean success = accountService.deposit(accountNum, amount);
            if (success) {
                model.addAttribute("depositSuccess", true);
            } else {
                model.addAttribute("depositFailure", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("depositFailure", true);
        }
        return "account/deposit";
    }
    
    @GetMapping("/withdrawal")
    public String withdrawalForm() {
        return "account/withdrawal";
    }

    @PostMapping("/withdrawal")
    public String withdraw(@RequestParam("accountId") String accountId, 
                           @RequestParam("password") String password, 
                           @RequestParam("amount") int amount, 
                           Model model) {
        try {
            boolean success = accountService.withdraw(accountId, password, amount);
            if (success) {
                model.addAttribute("successMessage", "출금 성공!!");
            } else {
                model.addAttribute("errorMessage", "계좌번호 또는 계좌 비밀번호가 잘못되었습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error processing withdrawal.");
        }
        return "account/withdrawal";
    }
    
    @GetMapping("/accounts")
    public String listAccounts(Model model) {
        model.addAttribute("accounts", accountService.getAllAccounts());
        return "account/listAccounts";
    }

    @GetMapping("/account/{accountId}")
    public String viewAccountDetails(@PathVariable("accountId") String accountId, Model model) {
    	List<TransactionDetailVO> transactions = accountService.getTransactionsByAccountId(accountId);
        transactions.forEach(transaction -> System.out.println(transaction.getTransactionId() + " " + transaction.getTransactionDate()));
        model.addAttribute("account", accountService.getAccountById(accountId));
        model.addAttribute("transactions", accountService.getTransactionsByAccountId(accountId));
        return "account/accountDetails";
    }
    
    
    
}
