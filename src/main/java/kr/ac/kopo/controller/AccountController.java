package kr.ac.kopo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.transactiondetail.vo.TransactionDetailVO;

@SessionAttributes({"userVO"})
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
    
    @GetMapping("/listAccounts")
    public String listAccounts(HttpSession session, Model model) throws Exception {
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        // 고객 ID를 이용해 계좌 목록을 가져옵니다.
        String customerId = user.getCustomer_id();
        model.addAttribute("accounts", accountService.getAccountsByCustomerId(customerId));
        
        return "account/listAccounts";
    }

    /*@GetMapping("/account/{accountId}")
    public String viewAccountDetails(@PathVariable("accountId") String accountId, HttpSession session, Model model) {
    	// 세션에서 로그인한 사용자 정보를 가져옵니다.
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        // 고객 ID를 이용해 계좌를 조회합니다.
        String customerId = user.getCustomer_id();
        AccountVO account = accountService.getAccountByIdAndCustomerId(accountId, customerId);
        if (account == null) {
            // 계좌가 없는 경우 에러 페이지로 리다이렉트
            model.addAttribute("errorMessage", "해당 계좌를 찾을 수 없습니다.");
            return "error/404";
        }

        // 모델에 계좌와 거래내역을 추가합니다.
        model.addAttribute("account", accountService.getAccountById(accountId));
        model.addAttribute("transactions", accountService.getTransactionsByAccountId(accountId));
        return "account/accountDetails";
    }*/
    @GetMapping("/account/{accountId}")
    public String viewAccountDetails(@PathVariable("accountId") String accountId, Model model) {
       List<TransactionDetailVO> transactions = accountService.getTransactionsByAccountId(accountId);
        transactions.forEach(transaction -> System.out.println(transaction.getTransactionId() + " " + transaction.getTransactionDate()));
        model.addAttribute("account", accountService.getAccountById(accountId));
        model.addAttribute("transactions", accountService.getTransactionsByAccountId(accountId));
        return "account/accountDetails";
    }

    
    
}
