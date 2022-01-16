package main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import news.dao.NewsDAO;
import notice.dao.NoticeDAO;

@Controller
public class MainController {
		@Autowired
		private NewsDAO newsDAO;
		
		@Autowired
		private NoticeDAO noticeDAO;

		@RequestMapping(value="/finIndex.do")
		public ModelAndView finIndex() {
			List mainNewsList = newsDAO.getMainNews();
			List mainNoticeList = noticeDAO.getMainNotice();
			ModelAndView mav = new ModelAndView();
			mav.addObject("mainNews", mainNewsList);
			mav.addObject("mainNotice",mainNoticeList);
			mav.setViewName("index/finIndex");
			return mav;
		}
		
		@RequestMapping(value = "message.do")
		public String messageGo()
		{
			return "message";
		}
}
