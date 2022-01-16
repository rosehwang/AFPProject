package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import account.dto.MyAccountDTO;
import account.dao.AccountDAO;
import member.dao.MemberDAO;
import member.dto.MemberDTO;

@Controller
public class MemberAnoController {
	@Autowired	
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender; //이메일보내기
	@Autowired	
	private AccountDAO accountDAO; // myPage에서 내 가입 금융상품 출력용
	
	//약관동의 ------------------------------------------
		@RequestMapping(value="/memberAgree.do")
		public String memberAgree() {
			System.out.println("memberAgree");
			return "member/memberAgree";
		}
		
		
	//가입유무확인 ------------------------------------------
	@RequestMapping(value="/memberCheck.do")
	public String memberCheck() {
		System.out.println("memberCheckForm");
		return "member/memberCheck";
	}

	@RequestMapping(value="/memberCheckPro.do")
	public ModelAndView memberCheckPro(HttpServletRequest req,
			@RequestParam String name, @RequestParam String ssn) throws Exception {	
		System.out.println("입력된  name : " + name);
		System.out.println("입력된 ssn : " + ssn);
		boolean isCheck = false;
		isCheck = memberDAO.checkMember(name, ssn);

		String msg,url = null;

		if (!isCheck) {
			msg = "등록된 아이디가 없습니다. 회원가입 화면으로 이동합니다.";
			url = "memberJoinForm.do";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("등록된 아이디 없을때 isCheck : " + isCheck);
			return mav;

		}else {
			msg = "이미 등록된 회원입니다. 로그인 화면으로 이동합니다.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			return mav;
		}
	}
	//가입유무확인 끝------------------------------------------------


	
	
	
	

	//id중복체크-----------------------------------------------------
	@RequestMapping(value = "idCheck.do", method=RequestMethod.GET)
	public String idCheckForm()
	{
		return "member/idCheck";
	}

	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheckPro(@RequestParam String id) {
		String msg = null;
		boolean res = memberDAO.idCheck(id);
		ModelAndView mav = new ModelAndView();
		if(res)
		{
			msg = "중복된 아이디 입니다.";
			mav.addObject("check", "true");
		}
		else
		{
			msg = " 중복되지 않은 아이디 입니다. 사용하시겠습니까?";

			mav.addObject("check", "false");
		}
		mav.addObject("id", id);
		mav.addObject("msg", msg);
		mav.setViewName("member/idCheck");
		return mav;
	}
	//id중복체크 끝----

	
	
	
	//회원 가입 --------------------------------------------------
	@RequestMapping(value="/memberJoinForm.do")
	public String memberJoinForm() {		
		return "member/memberJoinForm";
	}


	@RequestMapping(value="/memberJoinPro.do", method=RequestMethod.POST)
	public ModelAndView memberJoinPro(HttpServletRequest req, @ModelAttribute MemberDTO dto) throws SQLException {
	/*	String address2 = req.getParameter("address2");
		dto.setAddress(dto.getAddress()+" "+address2);*/
		
		//주소api 부분
		String road=dto.getRoadAddress()+"("+dto.getPostcode()+")";
        String jibun=dto.getJibunAddress()+"("+dto.getPostcode()+")";
        dto.setRoadAddress(road);
        dto.setJibunAddress(jibun);
		
		int res = memberDAO.insertMember(dto);
		System.out.println("join 끝 결과값 : " + res);
		
		if (res > 0) {
			String msg,url = null;
			msg = "회원가입 완료. 로그인 화면으로 이동합니다.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("회원가입완료 res : " + res);
			return mav;
		}
		return new ModelAndView("redirect:loginForm.do");
	}
	
	//회원 가입 끝 ----------------------------------------------------


	//로그인---------------------------------------------------
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, @RequestParam String id, @RequestParam String passwd) {
		System.out.println("id : "+id);
		System.out.println("passwd : "+passwd);
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		try {
			int res = memberDAO.login(id, passwd);
			if(res == 0) {  //로그인 성공
				HttpSession session = req.getSession(); //세션을 가져와서 유지시킨다.(로그인성공하면)
				session.setAttribute("loginId", id);

				msg = "["+id+"]님 반갑습니다.";
				url = "finIndex.do";
			}
			else if(res == 1) {//not id 
				msg = "["+id+"] 아이디는 존재하지 않습니다.";
				url = "index.jsp";
			}
			else if(res == 2) { //not passwd			
				msg = "["+id+"]님의 비밀번호가 틀렸습니다.";
				url = "index.jsp";
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg = "DB 서버 오류 발생! 관리자에게 문의하세요.";
			url = "index.jsp";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	//로그인 끝--------------------------------------------------



	//로그아웃-------------------------------------
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mav, HttpSession session) throws Exception{
		mav = new ModelAndView("message");
		String msg,url = null;

		session.invalidate();
		



		msg = "로그아웃 되었습니다. 메인화면으로 이동합니다.";
		url = "index.jsp";
		mav.addObject("msg", msg);
		mav.addObject("url",url);
		return mav;
	}
	//로그아웃 끝---------------------------------------




	//ID찾기-----------------------------------
	@RequestMapping(value="/find_idpasswd_form.do") //아이디,비밀번호찾기 폼은 같음
	public String findId() throws Exception{
		System.out.println("findidpasswd Form 시작");
		return "member/find_idpasswd_form";
	}

	@RequestMapping(value ="/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletRequest req, @RequestParam String email, @RequestParam String ssn, @RequestParam String name) throws Exception{
		System.out.println(email);
		System.out.println(ssn);
		System.out.println(name);
		String findId = memberDAO.find_id(email, ssn, name);
		req.setAttribute("findId", findId);
		System.out.println("찾은 Id : "+findId);
		return "member/find_id";
	}

	//임시 비밀번호 주기 
		@RequestMapping(value ="/find_passwd.do", method = RequestMethod.POST)
		public String find_passwd(HttpServletRequest req,HttpSession session, @RequestParam String email, @RequestParam String id, @RequestParam String name) throws Exception{
			
			System.out.println("파라미터 값:"+email+","+id+","+name);
			String setfrom="sky23795136@gmail.com";
			
			
			//랜덤값 주기 완료
			String passwd="";
			for(int i=0 ; i<8 ; i++){
			int ran = (int)(Math.random()*3)+1;//랜덤수생성 (0 ~ 2); > 세가지의 수만 생성해서 숫자형으로 할지 알파벳 소문자로할지 대문자로 할지 결정하는 수
			
			int tmp;// > 비밀번호에 들어갈 값
			switch(ran){
			case 1 : // 숫자생성
			   tmp = (int)(Math.random()*9)+0;// > 비밀번호에 들어갈 숫자 범위
			   passwd += String.valueOf(tmp);
	     	   break;
			case 2 : // 알파벳 대문자생성
			   tmp = (int)(Math.random()*25)+65;//랜덤수생성 (65~90); > 아스키코드 대문자 범위 1~25 
			   passwd += (char)tmp;
	           break;
			case 3 : // 알파벳 소문자생성
			   tmp = (int)(Math.random()*25)+97;//랜덤수생성 (97~122); > 아스키코드 소문자 범위
			   passwd += (char)tmp;   
		       break;
			}
			  
			}
			
			//완료 
			System.out.println("controller에서 passwd:"+passwd);
			
			session.setAttribute("passwd",passwd);
			
			int updatePasswd = memberDAO.update_passwd(id,passwd);
			System.out.println(updatePasswd);
			req.setAttribute("updatePasswd", updatePasswd);
		   
		
			
			if(updatePasswd!= 0) {
				
				MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	            messageHelper.setFrom(setfrom,"코코넛은행");  // 보내는사람 생략하거나 하면 정상작동을 안함
	            messageHelper.setTo(email);     // 받는사람 이메일
	            messageHelper.setSubject(name+"님의 비밀번호입니다."); // 메일제목은 생략이 가능하다
	           
	            //messageHelper.setText(,"utf-8","html");
	            //messageHelper.setText(mailbody,true);
	            messageHelper.setText("비밀번호는"+passwd+"입니다.");  // 메일 내용
	            /*String contents = "비밀번호는"+passwd+"입니다." +"<img src=\"cid:pastel.gif\">";
	            messageHelper.setText(contents,true);
	            
	            FileSystemResource file = new FileSystemResource(new File("C:/pastel.gif"));
	            messageHelper.addInline("pastel.gif", file);*/
	            
	            
	            mailSender.send(message);
	         
	            String msg,url = null;
	            msg = "메일전송성공";
				ModelAndView mav = new ModelAndView("message");
				mav.addObject("msg", msg);
	          
			  }
		
			System.out.println("찾은 Passwd : "+passwd);
			return "member/find_passwd";
		}

	
	
	//ID,Passwd찾기 끝-----------------------------------   


	//마이페이지 -------------------------------------	
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage(HttpServletRequest req,HttpSession session) throws Exception{
		System.out.println("memberMypage 시작"); 
		if((String) session.getAttribute("loginId")==null) {
			return "index/finIndex";
		}
		String id = (String) session.getAttribute("loginId");
		MemberDTO dto = memberDAO.getMember(id);
		List<MyAccountDTO> list = accountDAO.myAccountList(id);
		req.setAttribute("myFin", list);
		req.setAttribute("dto1", dto); //앞에 값이 다른메소드에서 setAttribute와 같으면 안된다.		
		return "member/memberMypage";
	}


	//수정-------------------------------------------------------------------------
	@RequestMapping(value="/memberUpdate.do", method=RequestMethod.GET) //로그인에 id,pw 받아야함 .
	public String memberUpdateForm(HttpServletRequest req, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("loginId");
		MemberDTO dto = memberDAO.getMember(id);
		req.setAttribute("dto2", dto); //dto->dto2 (중복불가능) 
		System.out.println("memberUpdate으로 온 "+id);
		System.out.println(dto.getName());
		System.out.println(dto.getSsn());
		System.out.println(dto.getId());
		System.out.println("updatForm 시작");
		return "member/memberUpdate";
	}

	@RequestMapping(value="/memberUpdatePro.do", method=RequestMethod.POST)
	public ModelAndView memberUpdatePro(MemberDTO dto) {
		int res = memberDAO.updateMember(dto); 
		System.out.println("수정완료 res : " + res);


		if (res > 0) {
			String msg,url = null;
			msg = "회원정보 수정 완료. 마이페이지로 이동합니다.";
			url = "memberMypage.do";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("정보수정완료 res : " + res);
			return mav;
		}	
		return new ModelAndView("redirect:memberMypage.do");
	}
	
	//수정---------------------------------------
	//마이페이지  끝-------------------------------------




	
	//회원탈퇴----------------------
	@RequestMapping(value="/memberDelete.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public String memberDeleteForm(HttpServletRequest req, HttpSession session) {		
		return "member/memberDelete";
	}


	@RequestMapping(value="/memberDeletePro.do" ,  method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberDeletePro(HttpServletRequest req, HttpSession session,@RequestParam String id) {
		int res = memberDAO.deleteMember(id);
		
		if (res == 0) {
			String url, msg = null;
			msg = "회원탈퇴에 실패했습니다. 메인화면으로 이동합니다.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message2");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("회원탈퇴완료 res : " + res);
			return mav;
		}else {
			accountDAO.deleteCoconut(id);
			String url, msg = null;
			msg = "회원탈퇴 완료. 메인화면으로 이동합니다.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message2");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("회원탈퇴완료 res : " + res);
			return mav;
		}
	}
	//회원탈퇴 끝-------------------------------------------------------------------
	
	@RequestMapping(value="/memberAll.do")
	public ModelAndView memberAll(HttpServletRequest req)
	{
		ModelAndView mav = new ModelAndView();
		int pageSize =10;//10줄씩 보여지게 할래
		String pageNum = req.getParameter("pageNum");// 이전이나 다음 눌렀을 때 pageNum값 넘어옴.
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);//현재 페이지 int
		int startRow = currentPage * pageSize - (pageSize - 1);//페이지의 시작 줄은 현재페이지 * 5 - (5 - 1);
		int endRow = currentPage * pageSize;
		int count = memberDAO.memberCount();// 글의 갯수 count
		if (endRow > count) endRow = count;//
		int number = count - (currentPage-1)*pageSize;//글 번호 
		
		List<MemberDTO> listMember = memberDAO.listMember(startRow, endRow);
		mav.addObject("listMember", listMember);
		req.setAttribute("number", number);
		req.setAttribute("count", count);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("currentPage", currentPage);
		mav.setViewName("member/memberAll");
		
		return mav;
	}
	
	@RequestMapping(value="/memberFind.do")
	public ModelAndView memberFind(HttpServletRequest req, @RequestParam String searchMode, @RequestParam String word) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberDAO.memberFind(searchMode, word);
		mav.addObject("findList", list);
		req.setAttribute("searchMode", searchMode);
		req.setAttribute("word", word);
		mav.setViewName("member/memberFind");
		return mav;
	}
	
	@RequestMapping(value="/memberProdView.do")
	public ModelAndView memberProdView(HttpServletRequest req)
	{	
		ModelAndView mav = new ModelAndView();
		String id = req.getParameter("id");
		List<MyAccountDTO> myProdList = accountDAO.myAccountList(id);
		
		mav.addObject("myProdList", myProdList);
		mav.addObject("id", id);
		mav.setViewName("member/memberProd");
		return mav;
	}

}





