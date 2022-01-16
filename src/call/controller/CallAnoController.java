package call.controller;

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

import call.dao.CallDAO;
import call.dto.CallDTO;
import call.mybatis.CallMapper;
import notice.mybatis.NoticeMapper;

@Controller
public class CallAnoController {

   @Autowired
   private CallDAO callDAO;
   
   //admin_list.do
   @RequestMapping(value ="/admin_list.do")
   public ModelAndView admincall(HttpServletRequest req,@ModelAttribute CallDTO dto)      
   {     
      
       String call_check = req.getParameter("call_check");
      String call_no = req.getParameter("call_no");
      String pageNum = req.getParameter("pageNum");
      
      if(pageNum == null) {
         pageNum = "1";
      }
      
       int pageSize = 5;
         int currentPage = Integer.parseInt(pageNum);//1
      int startRow = currentPage * pageSize - (pageSize - 1);// 5 - (5-1) =1
      int endRow = currentPage * pageSize;// 5
      int count = CallMapper.getCountCall();// 총 게시물 가져오면 ,
      if (endRow > count) endRow = count; 
      int number = count - (currentPage-1)*pageSize;
      
      System.out.println("페이징처리:"+pageNum);
      //값 넘어옴                                               0                       2  
      System.out.println("call_check:"+call_check+",call_no:"+call_no);
      
      if(call_check != null ) {
       System.out.println("call_check 실행완료 ");  
       int res = callDAO.updateCheck(call_no, "1");  
       System.out.println("메소드에서 res:"+res);   
      }
      
       List<CallDTO> callList = callDAO.adminListCall();
       ModelAndView mav = new ModelAndView();
       mav.addObject("callList",callList);
       req.setAttribute("number", number);
      req.setAttribute("count", count);
      req.setAttribute("pageSize", pageSize);
      req.setAttribute("currentPage", currentPage);
       mav.setViewName("call/admin_list");
      return mav;   
   }
   
   //member_list.do
   @RequestMapping(value = "/member_list.do")
   public ModelAndView membercall(HttpServletRequest req)
   {
      
       String pageNum = req.getParameter("pageNum");
       HttpSession session = req.getSession();
       String loginId = (String) session.getAttribute("loginId");
       
         if(pageNum == null) {
            pageNum = "1";
         }
         
          int pageSize = 5;
            int currentPage = Integer.parseInt(pageNum);//1
         int startRow = currentPage * pageSize - (pageSize - 1);// 5 - (5-1) =1
         int endRow = currentPage * pageSize;// 5
         int count = CallMapper.getCountMemberCall(loginId);// 총 게시물 가져오면 ,
         if (endRow > count) endRow = count; 
         int number = count - (currentPage-1)*pageSize;
         
         System.out.println("페이징처리:"+pageNum);
      
      
      
      List<CallDTO> membercallList = callDAO.memberListCall(loginId);
       ModelAndView mav = new ModelAndView();
       mav.addObject("membercallList",membercallList);
       req.setAttribute("number", number);
      req.setAttribute("count", count);
      req.setAttribute("pageSize", pageSize);
      req.setAttribute("currentPage", currentPage);
       mav.setViewName("call/member_list");
       return mav;
   }   
   
   //content.do
   @RequestMapping(value = "/content.do")
   public String callContent(HttpServletRequest req)
   { 
       String call_no = req.getParameter("call_no");
       System.out.println("call_no:"+call_no);
       CallDTO cdto = callDAO.getCall(Integer.parseInt(call_no));
      req.setAttribute("cdto", cdto);
       return "call/content";
   }
   

   //member_write.do(폼)
   @RequestMapping(value ="/member_write.do", method =RequestMethod.GET )
   public String InsertCallForm(HttpServletRequest req)
   {
      return "call/member_write";
   }
   
   //member_writePro.do
   @RequestMapping(value = "/member_write.do", method=RequestMethod.POST)
   public ModelAndView InsertCallPro(HttpServletRequest req,@ModelAttribute CallDTO dto)
   {       
          
      int res = callDAO.insertCall(dto);   
      return new ModelAndView("redirect:member_list.do");
   
   }
   
   //member_delete.do
   @RequestMapping(value ="/member_delete.do")
   public ModelAndView deleteCall(HttpServletRequest req, @RequestParam int call_no)
   {   
      System.out.println("call_no:"+call_no);
      String msg = null, url = null;
      
      int res = callDAO.deleteCall(call_no);
      if(res > 0) {
         msg = "글 삭제가 완료되었습니다.";
         url = "member_list.do";
         
      }else {
         
         msg = "글 삭제가 완료되지 않았습니다.";
         url = "member_list.do";
      }
      
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return new ModelAndView("message");
   }
   
}
