package notice.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import notice.dao.NoticeDAO;
import notice.dto.NoticeDTO;
import notice.mybatis.NoticeMapper;

@Controller
public class NoticeController {
	String msg = null, url = null;
	@Autowired
	private NoticeDAO noticeDAO;
	
	class FileUpload 
	{
		public FileUpload(HttpServletRequest req, NoticeDTO dto) throws IOException {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile("notice_file");
			String notice_file = mf.getOriginalFilename();
			int notice_filesize = 0;
			if(notice_file != null && !(notice_file.trim().equals("")))
			{
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/files");
				File file = new File(upPath, notice_file);
				mf.transferTo(file);
				notice_filesize = (int)file.length();
				dto.setNotice_file(notice_file);
				dto.setNotice_filesize(notice_filesize);
			}
		}

	}
	
	@RequestMapping(value ="/notice_list.do")
	public ModelAndView notice(HttpServletRequest req)
	{// ó������ start ���� end���� �� �� ���� �ʳ�(�Ű������� ���� ���)
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		if(session.getAttribute("loginId") == null)
		{
			msg = "�α��� �� �̿��� �����մϴ�.";
			url = "index.jsp";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			mav.setViewName("message");
		}
		else
		{
			String pageNum = req.getParameter("pageNum");
			
	
			if (pageNum == null){
				pageNum = "1";
			}
	     
			//���� ��
			System.out.println("�Ѿ���� ��:"+pageNum);
			
			int pageSize = 5;//�� ��ϴ� �Խù� 
		   	int currentPage = Integer.parseInt(pageNum);//1
			int startRow = currentPage * pageSize - (pageSize - 1);// 5 - (5-1) =1
			int endRow = currentPage * pageSize;// 5
			int count = NoticeMapper.getCountNotice();// �� �Խù� �������� ,
			if (endRow > count) endRow = count; 
			int number = count - (currentPage-1)*pageSize;
			            // �Ѱ���  30 
	                     		            
	        List<NoticeDTO> noticeList = noticeDAO.listNotice(startRow, endRow);
			
			//�����ֱ�(�׽�Ʈ��)
			
			//nullpoingException ����
			/*String loginId = "loginId";
			req.setAttribute("loginId", loginId);*/
			
			req.setAttribute("pageSize", pageSize);
			req.setAttribute("number",number );
			req.setAttribute("count", count);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("mode", "allList");
			mav.addObject("noticeList",noticeList);
			mav.setViewName("notice/list");
		}
		return mav;
	
	}
	
	@RequestMapping(value = "/notice_insert.do", method =RequestMethod.GET )
	public String insertNoticeForm(HttpServletRequest req)
	{  
		
	   HttpSession session = req.getSession();
	   if(session.getAttribute("loginId") == null)
		{
			msg = "�α��� �� �̿��� �����մϴ�.";
			url = "index.jsp";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
	   else if(!(session.getAttribute("loginId").equals("admin")))
       {
       msg = "�����ڸ� �̿��� �����մϴ�.";
       url = "index.jsp";
       req.setAttribute("msg", msg);
       req.setAttribute("url", url);
       return "message";
       }
	   else
	   {
		   return "notice/adminWrite";
	   }
		
	}
	
	@RequestMapping(value = "/notice_insert.do", method=RequestMethod.POST)
	public ModelAndView insertNoticePro(HttpServletRequest req, @ModelAttribute NoticeDTO dto, BindingResult result) throws IllegalStateException, IOException
	//���� ���ε� ���� 
	{
		String url,msg;
		
		if (result.hasErrors()) {
			dto.setNotice_file("");
			dto.setNotice_filesize(0);
		}
		
		FileUpload fileUpload = new FileUpload(req,dto);
	    int res = noticeDAO.insertNotice(dto);
	    if(res >0)
	    {
	    	msg ="�Խù��� ��ϵǾ����ϴ�. ������� �̵��մϴ�.";
	    	url = "notice_list.do";
	    }else {
	    	msg = "�Խù� ��Ͽ� �����Ͽ����ϴ�. �ٽ� ����� �ּ���.";
	        url = "notice_insert.do";
	    }
	    
	    req.setAttribute("msg", msg);
	    req.setAttribute("url", url);
		return new ModelAndView("redirect:notice_list.do");
	}
	
	@RequestMapping(value ="/notice_content.do")
	public String noticeContent(HttpServletRequest req,@RequestParam String notice_no)
	{
        String type = null;
		
		HttpSession session = req.getSession();
		if(session.getAttribute("loginId").equals("admin")) {
			type = "admin";
		}else {	
			type = "content";
		}
		System.out.println("���:"+type);
		System.out.println(notice_no);
		NoticeDTO dto = noticeDAO.getNotice(Integer.parseInt(notice_no), type); 
		req.setAttribute("dto", dto);
		return "notice/content";
	}
	
	@RequestMapping(value="/noticefileDownload.do")
	public String fileDownload(HttpServletRequest req){
		HttpSession session = req.getSession();
		if(session.getAttribute("loginId") == null)
		{
			msg = "�α��� �� �̿��� �����մϴ�.";
			url = "index.jsp";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		else
		{
		String notice_file = req.getParameter("notice_file");
		System.out.println(notice_file);
		req.setAttribute("notice_file", notice_file);
		return "notice/fileDownload";
		}
	}

	//����
	@RequestMapping(value="/notice_delete.do")
	public ModelAndView deleteNotice(HttpServletRequest req, @RequestParam String notice_no) {
		
		  HttpSession session = req.getSession();
		  String loginId = req.getParameter("id");
		  if(session.getAttribute("loginId") == null)
			{
				msg = "�α��� �� �̿��� �����մϴ�.";
				url = "index.jsp";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
			}
		  else if(!(session.getAttribute("loginId").equals("admin")))
	      {
	         msg = "�����ڸ� �̿��� �����մϴ�.";
	         url = "index.jsp";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	      }
		
		  else
		  {
		System.out.println("delete:"+notice_no);
		
		int res = noticeDAO.deleteNotice(notice_no);
		if(res > 0)
		{
			msg = "�� ������ �Ϸ�Ǿ����ϴ�. ������� �̵��մϴ�.";
			url = "notice_list.do";
		}
		else
		{
			msg = "�� ������ �Ϸ���� �ʾҽ��ϴ�. �ٽ� ������ �ּ���.";
			url = "notice_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		  }
		  return new ModelAndView("message");
	}
	
	
	//������
	@RequestMapping(value="/notice_update.do", method=RequestMethod.GET)
	public String updateNotice(HttpServletRequest req, @RequestParam String notice_no) {
		HttpSession session = req.getSession();
		if(session.getAttribute("loginId") == null)
		{
			msg = "�α��� �� �̿��� �����մϴ�.";
			url = "index.jsp";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		else
		{
		System.out.println("update:"+notice_no);
		NoticeDTO dto = noticeDAO.getNotice(Integer.parseInt(notice_no), "update");
		req.setAttribute("dto", dto);
		return "notice/update";
		}
	}
	
	//����
    @RequestMapping(value="/notice_update.do", method=RequestMethod.POST)
	public ModelAndView updateNoticePro
	(HttpServletRequest req, @ModelAttribute NoticeDTO dto, BindingResult result) throws IOException{
		String msg,url;
    	HttpSession session = req.getSession();
        if(!(session.getAttribute("loginId").equals("admin")))
        {
           msg = "�����ڸ� �̿��� �����մϴ�.";
           url = "index.jsp";
           req.setAttribute("msg", msg);
           req.setAttribute("url", url);
           return  new ModelAndView("message");
        }
    	
    	
    	String chk = req.getParameter("fileClear");
		//fileclear�� üũ�ڽ��� ���� (���� ���� �����Ұų� ���Ұų� )
		System.out.println(chk);
		if(chk == null)
		{
			chk = "notChk";
		}
		if (result.hasErrors()) {
			dto.setNotice_file("");
			dto.setNotice_filesize(0);
		}
	
		FileUpload fileUpload = new FileUpload(req, dto);
	
		int res = noticeDAO.updateNotice(dto, chk);
		if(res > 0)
		{
			msg = "�� ������ �Ϸ�Ǿ����ϴ�. ������� �̵��մϴ�.";
			url = "notice_list.do";
		}
		else
		{
			msg = "�� ������ �Ϸ���� �ʾҽ��ϴ�. ������� �̵��մϴ�.";
			url = "notice_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}

	
	
	@RequestMapping(value ="/notice_find.do")
	public ModelAndView noticeFind(HttpServletRequest req) 
	{
		 ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		if(session.getAttribute("loginId") == null)
		{
			msg = "�α��� �� �̿��� �����մϴ�.";
			url = "index.jsp";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			mav.setViewName("message");
		}
		else
		{
	 String type =req.getParameter("type");
	 String word =req.getParameter("word");
	 System.out.println(type);  
	 System.out.println(word);
	
	
	 List<NoticeDTO> findList = noticeDAO.findNotice(word, type);
	 mav.addObject("findList",findList);
	 mav.addObject("mode","find");
	 req.setAttribute("type", type);
	 req.setAttribute("word", word);
	 mav.setViewName("notice/findList");
		}
	 return mav;		 
	
	}
  }	
 
