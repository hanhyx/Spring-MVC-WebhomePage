package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import service.MemberService;
import vo.BoardVO;
import vo.MemberVO;
import vo.ReplyVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private MemberService memService;

	@RequestMapping("/board.do")
	public ModelAndView board(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String)session.getAttribute("loginId");
		
		MemberVO member = memService.getMemberInfo(loginId);
		mv.addObject("memberInfo", member);
		mv.addObject("boardPage", service.makeBoardPage(page));
		mv.setViewName("board_list");// board_list.jsp
		return mv;
	}
	
	@RequestMapping(value= "/boardListSearch.do", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam(defaultValue = "1") int page, int boardCategory, String keyword) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPageSearched", service.makeSearchedPage(page, boardCategory, keyword));
		mv.setViewName("board_list");// board_list.jsp
		return mv;
	}
	
	@RequestMapping(value= "/categorySearch.do")
	public ModelAndView categorySearch(@RequestParam(defaultValue = "1") int page, int boardCategory) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("categoryPage", service.makeCategoryPage(page, boardCategory));
		mv.setViewName("board_list");// board_list.jsp
		return mv;
	}

	@RequestMapping("/writeForm.do")
	public ModelAndView writeForm(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && loginId.length() > 0) {
			MemberVO member = 
					memService.getMemberInfo(loginId);
	        mv.addObject("memberInfo", member);
	        mv.setViewName("write_form");
			return mv;
		} else {
			// 로그인정보가 없는 사용자에게 보여줄 뷰
			mv.setViewName("no_login");
			return mv;
		}
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView write(BoardVO board, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.write(board, loginId, req);
			// mv.addObject("fileCount", board.getUpPic().size());
			mv.setViewName("write_result");
			return mv;
		} else {
			mv.setViewName("no_login");
			return mv;
		}
	}

	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	@ResponseBody
	public void reply(ReplyVO reply, HttpSession session) {
		// ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.reply(reply, loginId);
			// mv.addObject("reBoardNum", reply.getBoardNum());
//			System.out.println("controller" + reply.toString());
			// mv.setViewName("read");
			// return mv;
			// } else {
			// mv.setViewName("no_login");
			// return mv;
		}
		// return "aaa";
	}
	
	@RequestMapping(value = "/replyUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public void replyUpdate(ReplyVO reply, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.replyUpdate(reply, loginId);
		}
	}
	
	@RequestMapping(value = "/replyComment.do", method = RequestMethod.POST)
	@ResponseBody
	public void replyComment(ReplyVO reply, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.replyComment(reply, loginId);
		}
	}

	@RequestMapping("/read.do")
	public ModelAndView read(int boardNum, HttpSession session, @RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		BoardVO board = service.read(boardNum, loginId);
		MemberVO member = 
				memService.getMemberInfo(loginId);
        mv.addObject("memberInfo", member);

		mv.addObject("replyPage", service.makeReplyPage(boardNum, page));
		mv.addObject("board", board);
		mv.addObject("memberVO", memService.getMemberInfo(loginId));
		mv.setViewName("read");
		return mv;
	}

	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(int boardNum, HttpSession session) {
		// 조회수증가없이 원본 조회
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		BoardVO board = service.readNoCount(boardNum);
		
		MemberVO member = 
				memService.getMemberInfo(loginId);
        mv.addObject("memberInfo", member);

		mv.addObject("original", board);
		mv.setViewName("update_form");
		return mv;
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView update(BoardVO board, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.update(board, loginId);
		ModelAndView mv = new ModelAndView();

		if (result) {
			mv.addObject("boardNum", board.getBoardNum());
			mv.setViewName("update_success");
		} else {
			mv.setViewName("update_fail");
		}
		return mv;
	}

	@RequestMapping("/delete.do")
	public ModelAndView delete(int boardNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.delete(boardNum, loginId);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("delete_result");
		return mv;
	}

	@RequestMapping("/replyDelete.do")
	public ModelAndView replyDelete(int replyNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		
		int boardNum = service.selectBoardNum(replyNum);
		mv.addObject("boardNum", boardNum);
		
		boolean replyResult = service.replyDelete(replyNum, loginId);
		
		mv.addObject("replyResult", replyResult);
		mv.setViewName("reply_delete");
		return mv;
	}
	
	@RequestMapping("/about.do")
	public String about() {
		return "about_form";
	}

}