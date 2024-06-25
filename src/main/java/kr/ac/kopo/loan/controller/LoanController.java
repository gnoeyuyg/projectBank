package kr.ac.kopo.loan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.kopo.loan.service.LoanService;
import kr.ac.kopo.loan.vo.LoanVO;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({"userVO"})
@Controller
public class LoanController {

    @Autowired
    private LoanService loanService;

    @GetMapping("/loan/apply")
    public String applyLoanForm(HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }
        return "loan/applyLoan";
    }

    @PostMapping("/loan/apply")
    public String applyLoan(@ModelAttribute LoanVO loan, HttpSession session, Model model) {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            loanService.applyLoan(loan);
            model.addAttribute("applySuccess", true);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("applyFailure", true);
        }
        return "loan/loanResult";
    }

    @GetMapping("/loan/view")
    public String viewLoan(HttpSession session, Model model) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }

        LoanVO loan = loanService.getLoanById(user.getCustomer_id());
        model.addAttribute("loan", loan);
        return "loan/viewLoan";
    }
}
