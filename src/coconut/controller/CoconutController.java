package coconut.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import account.dao.AccountDAO;
import account.dto.AccountDTO;
import account.dto.CoconutDTO;
import account.dto.ThirdDTO;

@Controller
public class CoconutController {
	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value = "/coconut_make.do")
	public ModelAndView coconutMake(HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		String res = null, msg = null, url = null;
		ModelAndView mav = new ModelAndView();
		if(accountDAO.getId(id) != null) {
			res = accountDAO.getId(id).getId();
		}
		if (res != null) { // coconut이 없을시
			msg = "Coconut이 이미 존재합니다.";
			url = "finIndex.do";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		} else {
			mav.setViewName("coconut/cocoMake");
			return mav;
		}
	}

	@RequestMapping(value = "/first_pass.do", method=RequestMethod.POST)
	public ModelAndView passCheck1(@ModelAttribute AccountDTO dto) {
		String msg = null;
		AccountDTO res = accountDAO.getPass1(dto);
		if(res == null) {
			msg = "로그인 비밀번호가 틀렸습니다.";
			return new ModelAndView("coconut/cocoMake", "msg", msg);
		}else {
			return new ModelAndView("coconut/passCheck");
		}
	}
	
	@RequestMapping(value = "/second_pass.do", method=RequestMethod.POST)
	public ModelAndView passCheck2(@ModelAttribute AccountDTO dto) {		
		String msg = null;
		AccountDTO res = accountDAO.getPass2(dto);
		if(res == null) {
			msg = "코코넛 비밀번호가 틀렸습니다.";
			return new ModelAndView("coconut/passCheck", "msg", msg);
		}else {
			return new ModelAndView("coconut/passCheck2");
		}
	}
	
	@RequestMapping(value = "/third_pass.do", method=RequestMethod.POST)
	public ModelAndView passCheck3(HttpServletRequest req, @ModelAttribute ThirdDTO dto, @RequestParam String id) {
		String msg = null, url = null;
		ThirdDTO check = accountDAO.getPass3(dto);
		if(check == null) { // 틀린 답 입력시
			msg = "잘못된 답을 입력하셨습니다.";
			return new ModelAndView("coconut/passCheck2", "msg", msg);
		}else { // 맞는 답 입력시
			int res = accountDAO.insertCoco(id);
			if(res > 0) { // 생성 성공
				msg = "코코넛 생성 성공";
				url = "finIndex.do";
			} else { // 생성 실패
				msg = "코코넛 생성 실패";
				url = "finIndex.do";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}
	
	@RequestMapping(value="/coconut_list.do")
	public ModelAndView cocoList(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		CoconutDTO dto = accountDAO.getId(loginId);
		return new ModelAndView("coconut/cocoList", "dto", dto);
	}
	
	@RequestMapping(value="/coconut_delete.do")
	public ModelAndView cocoDelete() {
		return new ModelAndView("coconut/cocoDelete1");
	}
	
	@RequestMapping(value="/coconut_delete1.do", method=RequestMethod.POST)
	public ModelAndView cocoDelete1(@ModelAttribute AccountDTO dto) {
		AccountDTO res = accountDAO.getPass1(dto);
		String msg = null;
		if(res == null) {
			msg = "로그인 비밀번호가 틀렸습니다.";
			return new ModelAndView("coconut/cocoDelete1", "msg", msg);
		}else {
			return new ModelAndView("coconut/cocoDelete2");
		}
	}
	
	@RequestMapping(value = "/coconut_delete2.do", method=RequestMethod.POST)
	public ModelAndView cocoDelete2(@ModelAttribute AccountDTO dto) {		
		AccountDTO res = accountDAO.getPass2(dto);
		String msg = null;
		int check = 0;
		if(res == null) {
			msg = "코코넛 비밀번호가 틀렸습니다.";
			return new ModelAndView("coconut/cocoDelete2", "msg", msg);
		}else {
			check = accountDAO.deleteCoconut(dto.getId());
			return new ModelAndView("coconut/cocoDelete3","check", check);
		}
	}
	
	@RequestMapping(value = "coconuts_list.do")
	public ModelAndView cocoLists(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		if(loginId.equals("admin")) {
			return new ModelAndView("coconut/cocoLists", "cocoList", accountDAO.coconutList());			
		}else {
			return new ModelAndView("coconut/cocoLists");	
		}
	}
}