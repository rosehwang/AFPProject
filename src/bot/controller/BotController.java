package bot.controller;

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

import bot.dao.BotDAO;
import bot.dto.BotDTO;

@Controller
public class BotController {
	String msg = null, url = null;
	@Autowired
	BotDAO botDAO;

	@RequestMapping(value="/bot.do", method=RequestMethod.GET)
	public ModelAndView botGo(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		
		List answerList = botDAO.botAnswerList();
		mav.addObject("answerList", answerList);
		mav.setViewName("bot/bot");
		mav.addObject("mode", "no");
		return mav;
	}
	
	@RequestMapping(value="/bot.do", method=RequestMethod.POST)
	public ModelAndView botAnswer(@RequestParam String userChoiceNo) {
		ModelAndView mav = new ModelAndView();
		BotDTO dto = botDAO.getAnswerBot(userChoiceNo);
		List answerList = botDAO.botAnswerList();
		mav.addObject("answerList", answerList);
		mav.setViewName("bot/bot");
		mav.addObject("dto", dto);
		mav.addObject("mode", "ok");
		mav.addObject("userChoiceNo", userChoiceNo);
		return mav;
	}
	
	@RequestMapping(value="/botManager.do", method=RequestMethod.GET)
	public ModelAndView botManager(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
	
			mav.setViewName("bot/botManager");
		return mav;
	}
	
	@RequestMapping(value = "/botAnswerList.do")
	public ModelAndView botAnswerList(HttpServletRequest req)
	{
		ModelAndView mav = new ModelAndView();
		
			List list = botDAO.botAnswerList();
			mav.addObject("list", list);
			mav.setViewName("bot/list");
		return mav;
	}
	
	@RequestMapping(value = "insertAnswerBot.do")
	public ModelAndView insertAnswerBot(HttpServletRequest req, @ModelAttribute BotDTO dto)
	{
		ModelAndView mav = new ModelAndView();
		
		boolean check = botDAO.checkAnswerBot(dto.getBot_no());
		String num = dto.getBot_no();
		if(check)
		{
			msg = "�̹� ��ϵ� ��ȣ�Դϴ�. �ٸ� ��ȣ�� ����� �ּ���.";
			url = "botManager.do";
		}
		else if(num.equals("1") || num.equals("2") || num.equals("3") ||
				num.equals("4") || num.equals("5") || num.equals("6") ||
				num.equals("7") || num.equals("8") || num.equals("9"))
		{
			int res = botDAO.insertAnswerBot(dto);
			if(res > 0)
			{
				msg = "�亯 ������ ��ϵǾ����ϴ�. ������� �̵��մϴ�.";
				url = "botAnswerList.do";
			}
			else
			{
				msg = "�亯 ���� ����� �����Ͽ����ϴ�. �ٽ� ����� �ּ���.";
				url = "botManager.do";
			}

		}
		else
		{
			msg = "1 ~ 9������ ��ȣ�� �Է� �����մϴ�.";
			url = "botManager.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}
	
	@RequestMapping(value="/deleteAnswerBot.do")
	public ModelAndView deleteAnswerBot(HttpServletRequest req, @RequestParam String bot_no) {
		ModelAndView mav = new ModelAndView();
		
			int res = botDAO.deleteAnswerBot(bot_no);
			if(res > 0)
			{
				msg = "�亯 ������ �Ϸ�Ǿ����ϴ�. ������� �̵��մϴ�.";
				url = "botAnswerList.do";
			}
			else
			{
				msg = "�亯 ������ �Ϸ���� �ʾҽ��ϴ�. �ٽ� ������ �ּ���.";
				url = "botAnswerList.do";
			}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value= "/updateAnswerBot.do", method=RequestMethod.GET)
	public ModelAndView updateAnswerBot(HttpServletRequest req, @RequestParam String bot_no)
	{
		ModelAndView mav = new ModelAndView();
		BotDTO dto = null;
		
			dto = botDAO.getAnswerBot(bot_no);
			mav.addObject("dto", dto);
			mav.setViewName("bot/update");
		return mav;
	}
	
	@RequestMapping(value= "/updateAnswerBot.do", method=RequestMethod.POST)
	public ModelAndView updateAnswerBot(HttpServletRequest req, @ModelAttribute BotDTO dto)
	{
		ModelAndView mav = new ModelAndView();
		
		int res = botDAO.updateAnswerBot(dto);
		if(res > 0)
		{
			msg = "�亯 ������ �Ϸ�Ǿ����ϴ�. ������� �̵��մϴ�.";
			url = "botAnswerList.do";
		}
		else
		{
			msg = "�亯 ������ �Ϸ���� �ʾҽ��ϴ�. �ٽ� �õ��� �ּ���.";
			url = "botAnswerList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		mav.setViewName("message");
		return mav;
	}
}
