package coconut.controller;

import java.util.List;

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
import account.dto.MyAccountDTO;
import product.dao.ProductDAO;
import product.dto.ProductDTO;

@Controller
public class AccountController {
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@RequestMapping(value="/account_list.do")
	public ModelAndView accountList() {
		List<ProductDTO> prodList = productDAO.listProduct();
		return new ModelAndView("account/accountList", "prodList", prodList);
	}
	
	@RequestMapping(value="/map_location.do")
	public ModelAndView location(@RequestParam int num) {
		ProductDTO dto = productDAO.getProduct(num);
		return new ModelAndView("account/location", "location", dto.getLocation());
	}
	
	@RequestMapping(value="/new_account.do")
	public ModelAndView newAccount(HttpServletRequest req, @ModelAttribute AccountDTO dto, @RequestParam String id, @RequestParam int num) {
		// 이미 가입한 상품 check
		int check = accountDAO.isMyAccount(dto);
		String msg = null, url = null;
		ModelAndView mav = new ModelAndView();
		
		if(check > 0) {
			msg = "이미 가입한 금융상품 입니다.";
			url = "account_list.do";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}
		
		// 코코넛 존재하는지 확인
		HttpSession session = req.getSession();
		session.setAttribute("num", num);
		CoconutDTO res = accountDAO.getId(id);
		if(res != null) {	
			msg = "인증 페이지로 이동합니다.";
			url = "new_accountForm.do";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}else {
			msg = "코코넛을 먼저 생성해주세요! 코코넛 생성 페이지로 이동합니다.";
			url = "coconut_make.do?id="+id;
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}
	}
	
	@RequestMapping(value="/new_accountForm.do")
	public ModelAndView newAccountPage() {
		return new ModelAndView("myaccount/new_Pass1");
	}
	
	@RequestMapping(value="/new_pass1.do", method=RequestMethod.POST)
	public ModelAndView new_pass1(@ModelAttribute AccountDTO dto) {
		String msg = null;
		AccountDTO res = accountDAO.getPass1(dto);
		if(res == null) {
			msg = "로그인 비밀번호가 틀렸습니다.";
			return new ModelAndView("myaccount/new_Pass1", "msg", msg);
		}else {
			return new ModelAndView("myaccount/new_Pass2");
		}
	}
	
	@RequestMapping(value = "/new_pass2.do", method=RequestMethod.POST)
	public ModelAndView new_pass2(HttpServletRequest arg0, @ModelAttribute AccountDTO dto) {		
		HttpSession session = arg0.getSession();
		String msg = null;
		AccountDTO res = accountDAO.getPass2(dto);
		if(res == null) {
			msg = "코코넛 비밀번호가 틀렸습니다.";
			return new ModelAndView("myaccount/new_Pass2", "msg", msg);
		}else {
			ProductDTO dto1 = productDAO.getProduct((int)session.getAttribute("num"));
			return new ModelAndView("myaccount/new_account", "dto1", dto1);
		}
	}
	
	@RequestMapping(value="/insert_NewAccount.do", method=RequestMethod.POST)
	public ModelAndView insertNewAccount(@ModelAttribute MyAccountDTO dto2, @RequestParam String bank) {
		// 계좌번호 중복시 반복 start
		String accNum = null;
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		do {
			accNum = createAccountNum();
			System.out.println(accNum);
		}while(accountDAO.checkAccountNum(accNum) > 0);
		// 계좌번호 중복시 반복 end
		
		dto2.setAccountNum(accNum); // dto에 계좌번호 넣기
		int res = accountDAO.insertNewAccount(dto2);
		
		if(res > 0) {
			msg = "가입 성공";
		}else {
			msg = "가입 실패";
		}
		url = "account_list.do";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value="/myAccount.do")
	public ModelAndView getMyAccount(@RequestParam String id) {
		List<MyAccountDTO> list = accountDAO.myAccountList(id);
		return new ModelAndView("myaccount/listMyAccount","accountList",list);
	}
	
	@RequestMapping(value="/myAccountContent.do")
	public ModelAndView myAccountContent(@ModelAttribute MyAccountDTO dto) {
		MyAccountDTO content = accountDAO.myAccountContent(dto);
		return new ModelAndView("myaccount/myAccountContent", "content", content);
	}
	
	protected String createAccountNum() {
		// 랜덥값 범위 (int)(Math.random()*(최대값-최소값+1))+최소값;
		int accNum1 = (int)(Math.random()*(999-100+1))+100;
		int accNum2 = (int)(Math.random()*(999));
		int accNum3 = (int)(Math.random()*(999999));
		String accNum = accNum1 + "-" + accNum2 + "-" + accNum3;
		return accNum;
	}
}




























