package news.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import news.dao.NewsDAO;
import news.dto.NewsDTO;


@Controller
public class NewsController {
	String msg = null, url = null;
	
	@Autowired
	private NewsDAO newsDAO;
	
	class FileUpload 
	{
		public FileUpload(HttpServletRequest req, NewsDTO dto) throws IOException {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile("news_file");
			String news_file = mf.getOriginalFilename();
			int news_filesize = 0;
			if(news_file != null && !(news_file.trim().equals("")))
			{
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/files");
				File file = new File(upPath, news_file);
				mf.transferTo(file);
				news_filesize = (int)file.length();
				dto.setNews_file(news_file);
				dto.setNews_filesize(news_filesize);
			}
		}

	}
	@RequestMapping(value = "/news_list.do")
	public ModelAndView newsList(HttpServletRequest req)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
	
		int pageSize = 5;//5줄씩 보여지게 할래
		String pageNum = req.getParameter("pageNum");// 이전이나 다음 눌렀을 때 pageNum값 넘어옴.
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);//현재 페이지 int
		int startRow = currentPage * pageSize - (pageSize - 1);//페이지의 시작 줄은 현재페이지 * 5 - (5 - 1);
		int endRow = currentPage * pageSize;
		int count = newsDAO.getCount();// 글의 갯수 count
		if (endRow > count) endRow = count;//
		int number = count - (currentPage-1)*pageSize;//글 번호 
		
		List<NewsDTO> newsList = newsDAO.newsList(startRow, endRow);
		mav.addObject("newsList", newsList);
		req.setAttribute("number", number);
		req.setAttribute("count", count);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("mode", "allList");
		mav.setViewName("news/list");
		return mav;
	}
	
	@RequestMapping(value = "/news_insert.do", method=RequestMethod.GET)
	public String insertNewsForm(HttpServletRequest req)
	{
		return "news/write";
	}
	
	@RequestMapping(value = "/news_insert.do", method=RequestMethod.POST)
	public ModelAndView insertNewsPro(HttpServletRequest req, @ModelAttribute NewsDTO dto, BindingResult result) throws IOException
	{
		if (result.hasErrors()) {
			dto.setNews_file("");
			dto.setNews_filesize(0);
		}
		
		FileUpload fileUpload = new FileUpload(req, dto);
		
		int res = newsDAO.insertNews(dto);
		if(res > 0)
		{
			msg = "새 소식이 등록되었습니다. 목록으로 이동합니다.";
			url = "news_list.do";
		}
		else
		{
			msg = "새 소식 등록이 실패하였습니다. 다시 등록해 주세요.";
			url = "news_insert.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}
	
	@RequestMapping(value="/news_content.do")
	public String newsContent(HttpServletRequest req, HttpServletResponse resp, @RequestParam String news_no) {
		
		int num = Integer.parseInt(news_no); 
		
		String mode = "content";
		Cookie cks[] = req.getCookies();
		if (cks != null && cks.length != 0) {
			for(int i=0; i<cks.length; ++i) {
				String cnum = cks[i].getName();
				if (StringUtils.isNumeric(cnum)) {
					if (num == Integer.parseInt(cnum)) {
						mode = "check";
						break;
					}
				}
			}
		}
		
		NewsDTO dto = newsDAO.getNews(news_no, mode);
		Cookie ck = new Cookie(news_no, "check");
		ck.setMaxAge(-1);  //브라우저가 닫히면 쿠키삭제
		resp.addCookie(ck);
		req.setAttribute("dto", dto);
		return "news/content";
	}
	
	@RequestMapping(value="/fileDownload.do")
	public String fileDownload(HttpServletRequest req) {
		
		String news_file = req.getParameter("news_file");
		System.out.println(news_file);
		req.setAttribute("news_file", news_file);
		return "news/fileDownload";
	}
	
	@RequestMapping(value="/news_delete.do")
	public ModelAndView deleteNews(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
			String news_no = req.getParameter("news_no");
			int res = newsDAO.deleteNews(news_no);
			if(res > 0)
			{
				msg = "글 삭제가 완료되었습니다. 목록으로 이동합니다.";
				url = "news_list.do";
			}
			else
			{
				msg = "글 삭제가 완료되지 않았습니다. 다시 삭제해 주세요.";
				url = "news_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value="/news_update.do", method=RequestMethod.GET)
	public String updateNews(HttpServletRequest req, @RequestParam String news_no) {
		
			NewsDTO dto = newsDAO.getNews(news_no, "update");
			req.setAttribute("dto", dto);
			return "news/update";
		
	}
	
	@RequestMapping(value="/news_update.do", method=RequestMethod.POST)
	public ModelAndView updateNewsPro
	(HttpServletRequest req, @ModelAttribute NewsDTO dto, BindingResult result) throws IOException{
		String chk = req.getParameter("fileClear");
		if(chk == null)
		{
			chk = "notChk";
		}
		if (result.hasErrors()) {
			dto.setNews_file("");
			dto.setNews_filesize(0);
		}
	
		FileUpload fileUpload = new FileUpload(req, dto);
		String msg, url;
		int res = newsDAO.updateNews(dto, chk);
		if(res > 0)
		{
			msg = "글 수정이 완료되었습니다. 목록으로 이동합니다.";
			url = "news_list.do";
		}
		else
		{
			msg = "글 수정이 완료되지 않았습니다. 목록으로 이동합니다.";
			url = "news_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}
		
	@RequestMapping(value="/news_find.do", method=RequestMethod.POST)
	public ModelAndView findNewsPro(HttpServletRequest req, @RequestParam String searchMode, @RequestParam String word) throws IOException{
		System.out.println(searchMode);
		System.out.println(word);
		
		ModelAndView mav = new ModelAndView();
		List<NewsDTO> list = newsDAO.findNews(searchMode, word);
		mav.addObject("findList", list);
		mav.addObject("mode", "find");
		req.setAttribute("searchMode", searchMode);
		req.setAttribute("word", word);
		mav.setViewName("news/list");
		return mav;
	}
}
