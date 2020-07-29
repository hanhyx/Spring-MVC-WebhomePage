package controller;
 
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import service.MemberService;
import vo.BoardVO;
import vo.MemberVO;
 
@Controller
public class MemberController {
    @Autowired
    private MemberService service;
    
    @Autowired
    private BoardService boardService;
    
    @RequestMapping("/main.do")
    public ModelAndView mainFunc(HttpSession session) {
    	ModelAndView mv = new ModelAndView();
        String loginId = (String)session.getAttribute("loginId");
        MemberVO member = 
                service.getMemberInfo(loginId);
        mv.addObject("memberInfo", member);
    	mv.addObject("bestPicList", boardService.bestPicList());
        mv.setViewName("main");
    	return mv; 
    }
    
    @RequestMapping("joinForm.do")
    public String joinForm() {
        return "join_form";
    }
     
    @RequestMapping(value="/join.do", method = RequestMethod.POST)
    public String join(MemberVO member, HttpServletRequest req) {
        if(service.join(member, req)) {
            return "join_success";
        }else {
            return "join_fail";
        }
    }
    
	@RequestMapping(value="/chkOldId.do", method = RequestMethod.POST)
	public void checkOldId(String id, HttpServletResponse resp) {
		
		resp.setContentType("text/json;charset=utf-8");
		if (service.chkDupId(id) != 0) {
			try {
				MemberVO member = 
	                    service.getMemberInfo(id);
				String que = member.getQuestion();
				resp.getWriter().print(que);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	@RequestMapping(value="/chkOldQue.do", method = RequestMethod.POST)
	public void checkOldQue(String id, String answer, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		MemberVO member = service.getMemberInfo(id);
		String ans = member.getAnswer();
		
		if (ans.equals(answer)) {
			try {
				resp.getWriter().print("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	@RequestMapping(value = "/changePassword.do", method = RequestMethod.POST)
	public String updatePw(MemberVO member) {

		if(service.updatePw(member) == 1) {
            return "password_update_success";
        }else {
            return "password_update_fail";
        }
	}
     
    @RequestMapping("/loginForm.do")
    public String loginForm() {
        return "login_form";
    }
     
    @RequestMapping(value="/login.do", method=RequestMethod.POST)
    public String login
        (String id, @RequestParam("password")String pw, HttpSession session){
    	ModelAndView mv = new ModelAndView();
    	if(service.login(id, pw)) {
            // 로그인 성공 시 세션에 기록해두기.
            session.setAttribute("loginId", id);
            return "login_success";
        }else {
            return "login_fail";
        }       
    }
    
    @RequestMapping("/searchPwForm.do")
    public String searchPwForm() {    	
        return "searchPw_form";
    }
    
    @RequestMapping(value="/chkDupId.do", method = RequestMethod.POST)
	public void checkId(String id, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		if (service.chkDupId(id) == 0) {
			try {
				resp.getWriter().print("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
     
    @RequestMapping("/myPage.do")
    public ModelAndView myPage(String messager, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String loginId = (String)session.getAttribute("loginId");
        if(loginId!=null && loginId.length()>0) {
            // 로그인 정보 있음
            MemberVO member = 
                    service.getMemberInfo(messager);
            mv.addObject("memberInfo", member);
            mv.addObject("loginId", loginId);
            mv.setViewName("my_page");
        }else {
            // 로그인 정보 없음.
            mv.setViewName("no_login");
        }
        return mv;
    }
    
    @RequestMapping("/changeProfileForm.do")
    public ModelAndView changeProfileForm(String id) {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("idChecking", id);
    	mv.setViewName("changeProfile_form");
        return mv;
    }
    
    @RequestMapping(value="/chkOldPw.do", method = RequestMethod.POST)
	public void checkPw(String password, HttpServletResponse resp, HttpSession session) {
		resp.setContentType("text/json;charset=utf-8");
		String loginId = (String)session.getAttribute("loginId");
		if (service.chkOldPw(loginId, password) == 1) {
			try {
				resp.getWriter().print("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
    
    @RequestMapping(value = "/changeProfile.do", method = RequestMethod.POST)
	public String update(MemberVO member, HttpSession session, HttpServletRequest req) {
		String loginId = (String) session.getAttribute("loginId");

		if(service.update(member, loginId, req)) {
            return "profile_update_success";
        }else {
            return "profile_update_fail";
        }
	}
    	
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "logout";
    }
    
}