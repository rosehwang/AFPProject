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
	private JavaMailSender mailSender; //�̸��Ϻ�����
	@Autowired	
	private AccountDAO accountDAO; // myPage���� �� ���� ������ǰ ��¿�
	
	//������� ------------------------------------------
		@RequestMapping(value="/memberAgree.do")
		public String memberAgree() {
			System.out.println("memberAgree");
			return "member/memberAgree";
		}
		
		
	//��������Ȯ�� ------------------------------------------
	@RequestMapping(value="/memberCheck.do")
	public String memberCheck() {
		System.out.println("memberCheckForm");
		return "member/memberCheck";
	}

	@RequestMapping(value="/memberCheckPro.do")
	public ModelAndView memberCheckPro(HttpServletRequest req,
			@RequestParam String name, @RequestParam String ssn) throws Exception {	
		System.out.println("�Էµ�  name : " + name);
		System.out.println("�Էµ� ssn : " + ssn);
		boolean isCheck = false;
		isCheck = memberDAO.checkMember(name, ssn);

		String msg,url = null;

		if (!isCheck) {
			msg = "��ϵ� ���̵� �����ϴ�. ȸ������ ȭ������ �̵��մϴ�.";
			url = "memberJoinForm.do";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("��ϵ� ���̵� ������ isCheck : " + isCheck);
			return mav;

		}else {
			msg = "�̹� ��ϵ� ȸ���Դϴ�. �α��� ȭ������ �̵��մϴ�.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			return mav;
		}
	}
	//��������Ȯ�� ��------------------------------------------------


	
	
	
	

	//id�ߺ�üũ-----------------------------------------------------
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
			msg = "�ߺ��� ���̵� �Դϴ�.";
			mav.addObject("check", "true");
		}
		else
		{
			msg = " �ߺ����� ���� ���̵� �Դϴ�. ����Ͻðڽ��ϱ�?";

			mav.addObject("check", "false");
		}
		mav.addObject("id", id);
		mav.addObject("msg", msg);
		mav.setViewName("member/idCheck");
		return mav;
	}
	//id�ߺ�üũ ��----

	
	
	
	//ȸ�� ���� --------------------------------------------------
	@RequestMapping(value="/memberJoinForm.do")
	public String memberJoinForm() {		
		return "member/memberJoinForm";
	}


	@RequestMapping(value="/memberJoinPro.do", method=RequestMethod.POST)
	public ModelAndView memberJoinPro(HttpServletRequest req, @ModelAttribute MemberDTO dto) throws SQLException {
	/*	String address2 = req.getParameter("address2");
		dto.setAddress(dto.getAddress()+" "+address2);*/
		
		//�ּ�api �κ�
		String road=dto.getRoadAddress()+"("+dto.getPostcode()+")";
        String jibun=dto.getJibunAddress()+"("+dto.getPostcode()+")";
        dto.setRoadAddress(road);
        dto.setJibunAddress(jibun);
		
		int res = memberDAO.insertMember(dto);
		System.out.println("join �� ����� : " + res);
		
		if (res > 0) {
			String msg,url = null;
			msg = "ȸ������ �Ϸ�. �α��� ȭ������ �̵��մϴ�.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("ȸ�����ԿϷ� res : " + res);
			return mav;
		}
		return new ModelAndView("redirect:loginForm.do");
	}
	
	//ȸ�� ���� �� ----------------------------------------------------


	//�α���---------------------------------------------------
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, @RequestParam String id, @RequestParam String passwd) {
		System.out.println("id : "+id);
		System.out.println("passwd : "+passwd);
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		try {
			int res = memberDAO.login(id, passwd);
			if(res == 0) {  //�α��� ����
				HttpSession session = req.getSession(); //������ �����ͼ� ������Ų��.(�α��μ����ϸ�)
				session.setAttribute("loginId", id);

				msg = "["+id+"]�� �ݰ����ϴ�.";
				url = "finIndex.do";
			}
			else if(res == 1) {//not id 
				msg = "["+id+"] ���̵�� �������� �ʽ��ϴ�.";
				url = "index.jsp";
			}
			else if(res == 2) { //not passwd			
				msg = "["+id+"]���� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				url = "index.jsp";
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg = "DB ���� ���� �߻�! �����ڿ��� �����ϼ���.";
			url = "index.jsp";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	//�α��� ��--------------------------------------------------



	//�α׾ƿ�-------------------------------------
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mav, HttpSession session) throws Exception{
		mav = new ModelAndView("message");
		String msg,url = null;

		session.invalidate();
		



		msg = "�α׾ƿ� �Ǿ����ϴ�. ����ȭ������ �̵��մϴ�.";
		url = "index.jsp";
		mav.addObject("msg", msg);
		mav.addObject("url",url);
		return mav;
	}
	//�α׾ƿ� ��---------------------------------------




	//IDã��-----------------------------------
	@RequestMapping(value="/find_idpasswd_form.do") //���̵�,��й�ȣã�� ���� ����
	public String findId() throws Exception{
		System.out.println("findidpasswd Form ����");
		return "member/find_idpasswd_form";
	}

	@RequestMapping(value ="/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletRequest req, @RequestParam String email, @RequestParam String ssn, @RequestParam String name) throws Exception{
		System.out.println(email);
		System.out.println(ssn);
		System.out.println(name);
		String findId = memberDAO.find_id(email, ssn, name);
		req.setAttribute("findId", findId);
		System.out.println("ã�� Id : "+findId);
		return "member/find_id";
	}

	//�ӽ� ��й�ȣ �ֱ� 
		@RequestMapping(value ="/find_passwd.do", method = RequestMethod.POST)
		public String find_passwd(HttpServletRequest req,HttpSession session, @RequestParam String email, @RequestParam String id, @RequestParam String name) throws Exception{
			
			System.out.println("�Ķ���� ��:"+email+","+id+","+name);
			String setfrom="sky23795136@gmail.com";
			
			
			//������ �ֱ� �Ϸ�
			String passwd="";
			for(int i=0 ; i<8 ; i++){
			int ran = (int)(Math.random()*3)+1;//���������� (0 ~ 2); > �������� ���� �����ؼ� ���������� ���� ���ĺ� �ҹ��ڷ����� �빮�ڷ� ���� �����ϴ� ��
			
			int tmp;// > ��й�ȣ�� �� ��
			switch(ran){
			case 1 : // ���ڻ���
			   tmp = (int)(Math.random()*9)+0;// > ��й�ȣ�� �� ���� ����
			   passwd += String.valueOf(tmp);
	     	   break;
			case 2 : // ���ĺ� �빮�ڻ���
			   tmp = (int)(Math.random()*25)+65;//���������� (65~90); > �ƽ�Ű�ڵ� �빮�� ���� 1~25 
			   passwd += (char)tmp;
	           break;
			case 3 : // ���ĺ� �ҹ��ڻ���
			   tmp = (int)(Math.random()*25)+97;//���������� (97~122); > �ƽ�Ű�ڵ� �ҹ��� ����
			   passwd += (char)tmp;   
		       break;
			}
			  
			}
			
			//�Ϸ� 
			System.out.println("controller���� passwd:"+passwd);
			
			session.setAttribute("passwd",passwd);
			
			int updatePasswd = memberDAO.update_passwd(id,passwd);
			System.out.println(updatePasswd);
			req.setAttribute("updatePasswd", updatePasswd);
		   
		
			
			if(updatePasswd!= 0) {
				
				MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	            messageHelper.setFrom(setfrom,"���ڳ�����");  // �����»�� �����ϰų� �ϸ� �����۵��� ����
	            messageHelper.setTo(email);     // �޴»�� �̸���
	            messageHelper.setSubject(name+"���� ��й�ȣ�Դϴ�."); // ���������� ������ �����ϴ�
	           
	            //messageHelper.setText(,"utf-8","html");
	            //messageHelper.setText(mailbody,true);
	            messageHelper.setText("��й�ȣ��"+passwd+"�Դϴ�.");  // ���� ����
	            /*String contents = "��й�ȣ��"+passwd+"�Դϴ�." +"<img src=\"cid:pastel.gif\">";
	            messageHelper.setText(contents,true);
	            
	            FileSystemResource file = new FileSystemResource(new File("C:/pastel.gif"));
	            messageHelper.addInline("pastel.gif", file);*/
	            
	            
	            mailSender.send(message);
	         
	            String msg,url = null;
	            msg = "�������ۼ���";
				ModelAndView mav = new ModelAndView("message");
				mav.addObject("msg", msg);
	          
			  }
		
			System.out.println("ã�� Passwd : "+passwd);
			return "member/find_passwd";
		}

	
	
	//ID,Passwdã�� ��-----------------------------------   


	//���������� -------------------------------------	
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage(HttpServletRequest req,HttpSession session) throws Exception{
		System.out.println("memberMypage ����"); 
		if((String) session.getAttribute("loginId")==null) {
			return "index/finIndex";
		}
		String id = (String) session.getAttribute("loginId");
		MemberDTO dto = memberDAO.getMember(id);
		List<MyAccountDTO> list = accountDAO.myAccountList(id);
		req.setAttribute("myFin", list);
		req.setAttribute("dto1", dto); //�տ� ���� �ٸ��޼ҵ忡�� setAttribute�� ������ �ȵȴ�.		
		return "member/memberMypage";
	}


	//����-------------------------------------------------------------------------
	@RequestMapping(value="/memberUpdate.do", method=RequestMethod.GET) //�α��ο� id,pw �޾ƾ��� .
	public String memberUpdateForm(HttpServletRequest req, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("loginId");
		MemberDTO dto = memberDAO.getMember(id);
		req.setAttribute("dto2", dto); //dto->dto2 (�ߺ��Ұ���) 
		System.out.println("memberUpdate���� �� "+id);
		System.out.println(dto.getName());
		System.out.println(dto.getSsn());
		System.out.println(dto.getId());
		System.out.println("updatForm ����");
		return "member/memberUpdate";
	}

	@RequestMapping(value="/memberUpdatePro.do", method=RequestMethod.POST)
	public ModelAndView memberUpdatePro(MemberDTO dto) {
		int res = memberDAO.updateMember(dto); 
		System.out.println("�����Ϸ� res : " + res);


		if (res > 0) {
			String msg,url = null;
			msg = "ȸ������ ���� �Ϸ�. ������������ �̵��մϴ�.";
			url = "memberMypage.do";
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("���������Ϸ� res : " + res);
			return mav;
		}	
		return new ModelAndView("redirect:memberMypage.do");
	}
	
	//����---------------------------------------
	//����������  ��-------------------------------------




	
	//ȸ��Ż��----------------------
	@RequestMapping(value="/memberDelete.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public String memberDeleteForm(HttpServletRequest req, HttpSession session) {		
		return "member/memberDelete";
	}


	@RequestMapping(value="/memberDeletePro.do" ,  method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberDeletePro(HttpServletRequest req, HttpSession session,@RequestParam String id) {
		int res = memberDAO.deleteMember(id);
		
		if (res == 0) {
			String url, msg = null;
			msg = "ȸ��Ż�� �����߽��ϴ�. ����ȭ������ �̵��մϴ�.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message2");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("ȸ��Ż��Ϸ� res : " + res);
			return mav;
		}else {
			accountDAO.deleteCoconut(id);
			String url, msg = null;
			msg = "ȸ��Ż�� �Ϸ�. ����ȭ������ �̵��մϴ�.";
			url = "index.jsp";
			ModelAndView mav = new ModelAndView("message2");
			mav.addObject("msg", msg);
			mav.addObject("url",url);
			System.out.println("ȸ��Ż��Ϸ� res : " + res);
			return mav;
		}
	}
	//ȸ��Ż�� ��-------------------------------------------------------------------
	
	@RequestMapping(value="/memberAll.do")
	public ModelAndView memberAll(HttpServletRequest req)
	{
		ModelAndView mav = new ModelAndView();
		int pageSize =10;//10�پ� �������� �ҷ�
		String pageNum = req.getParameter("pageNum");// �����̳� ���� ������ �� pageNum�� �Ѿ��.
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);//���� ������ int
		int startRow = currentPage * pageSize - (pageSize - 1);//�������� ���� ���� ���������� * 5 - (5 - 1);
		int endRow = currentPage * pageSize;
		int count = memberDAO.memberCount();// ���� ���� count
		if (endRow > count) endRow = count;//
		int number = count - (currentPage-1)*pageSize;//�� ��ȣ 
		
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





