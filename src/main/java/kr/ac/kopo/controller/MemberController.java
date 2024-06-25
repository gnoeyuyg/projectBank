package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({"userVO"})
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    
    @GetMapping("/login")
    public String loginForm(Model model) {
        MemberVO member = new MemberVO();
        model.addAttribute("M", member);
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("M") MemberVO member, Model model) throws Exception {
        System.out.println(member);
        MemberVO loginVO = memberService.login(member);
        if(loginVO == null) {
            return "member/login";
        } else {
            model.addAttribute("userVO", loginVO);
            return "redirect:/"; 
        }
    }

    @GetMapping("/logout")
    public String logout(SessionStatus status) {
        status.setComplete();
        return "redirect:/";
    }

    @GetMapping("/signup")
    public String signUpForm() {
        return "member/signup";
    }

    @PostMapping("/signup")
    public String signUp(MemberVO member, Model model) throws Exception {
        System.out.println(member);
        memberService.signUp(member);
        return "redirect:/login";
    }

    @GetMapping("/member/mypage")
    public String viewMyPage(HttpSession session, Model model) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }
        MemberVO member = memberService.getMemberById(user.getCustomer_id());
        model.addAttribute("member", member);
        return "banksystem/mypage";
    }

    @GetMapping("/member/update")
    public String update(HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }
        return "member/update";  
    }

    @PostMapping("/member/update")
    public String updateMyPage(@ModelAttribute("member") MemberVO member, HttpSession session, Model model) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }
        memberService.updateMember(member);
        session.setAttribute("userVO", memberService.getMemberById(member.getCustomer_id()));
        return "redirect:/member/mypage";
    }

    @GetMapping("/deleteAccount")
    public String deleteAccountForm(HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }
        return "member/deleteAccount";
    }

    @PostMapping("/deleteAccount")
    public String deleteAccount(@RequestParam("userId") String userId, 
                                @RequestParam("password") String password, 
                                HttpSession session, 
                                Model model) {
        MemberVO user = (MemberVO) session.getAttribute("userVO");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            boolean success = memberService.deleteAccount(userId, password);
            if (success) {
                session.invalidate();
                model.addAttribute("successMessage", "회원탈퇴가 정상적으로 완료되었습니다.");
                return "redirect:/login";
            } else {
                model.addAttribute("errorMessage", "사용자 ID 또는 암호가 잘못되었습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Error processing account deletion.");
        }
        return "member/deleteAccount";
    }
}
