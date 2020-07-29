package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MessageService;
import vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;
	
	@RequestMapping("/message.do")
	public ModelAndView board(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		mv.addObject("receiveMessage", service.makeMessageReceiverPage(page, loginId));
		mv.addObject("sendMessage", service.makeMessageSenderPage(page, loginId));
		mv.setViewName("message_list");// Message_list.jsp
		return mv;
	}
	
	@RequestMapping("/messageForm.do")
	public ModelAndView writeForm(String receiver, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && loginId.length() > 0) {
			mv.addObject("receiver", receiver);
			mv.setViewName("message_form");
			return mv;
		} else {
			mv.setViewName("no_login");
			return mv;
		}
	}

	@RequestMapping(value = "/messageWrite.do", method = RequestMethod.POST)
	public ModelAndView write(MessageVO message, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.write(message, loginId);
			mv.setViewName("message_result");
			return mv;
		} else {
			mv.setViewName("no_login");
			return mv;
		}
	}
	
	@RequestMapping("/messageReceiveRead.do")
	public ModelAndView readReceive(int message_num, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		MessageVO message = service.readReceiver(message_num, loginId);

		mv.addObject("message", message);
		mv.setViewName("message_read");
		return mv;
	}
	
	@RequestMapping("/messageSendRead.do")
	public ModelAndView readSend(int message_num) {
		ModelAndView mv = new ModelAndView();

		MessageVO message = service.readSender(message_num);

		mv.addObject("message", message);
		mv.setViewName("message_read");
		return mv;
	}
	
	@RequestMapping("/messageREDelete.do")
	public ModelAndView deleteReceive(int message_num, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.deleteReceiver(message_num, loginId);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("message_delete_result");
		return mv;
	}
	
	@RequestMapping("/messageSEDelete.do")
	public ModelAndView deleteSend(int message_num, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.deleteSender(message_num, loginId);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("message_delete_result");
		return mv;
	}

}
