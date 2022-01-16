package oneqna_email.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.SystemProfileValueSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import oneqna.dto.OneqnaDTO;
import oneqna.mybatis.OneqnaMapper;
import oneqna_email.dao.Oneqna_emailDAO;
import oneqna_email.dto.Oneqna_emailDTO;


@Controller
public class Oneqna_emailController {

   @Autowired
   private Oneqna_emailDAO emailDAO;
   
   @Autowired
   private JavaMailSender mailSender;
   
   //관리자만 보는 이메일 리스트
   @RequestMapping(value = "/email_adminlist.do")
   public ModelAndView qnalist(HttpServletRequest req) {
      HttpSession session = req.getSession();
      String url, msg = null;  
      ModelAndView mav = new ModelAndView("message");
      if(!(session.getAttribute("loginId").equals("admin")))
         {
            msg = "관리자만 이용이 가능합니다.";
            url = "index.jsp";
            req.setAttribute("msg", msg);
            req.setAttribute("url", url);
            return mav;
         }
      
      String pageNum = req.getParameter("pageNum");
      

      if (pageNum == null){
         pageNum = "1";
      }
     

      
      int pageSize = 5;
         int currentPage = Integer.parseInt(pageNum);//1
      int startRow = currentPage * pageSize - (pageSize - 1);// 5 - (5-1) =1
      int endRow = currentPage * pageSize;// 5
      int count = OneqnaMapper.getCountOneqna();
      if (endRow > count) endRow = count; 
      int number = count - (currentPage-1)*pageSize;

      List<Oneqna_emailDTO> emailAdminList =emailDAO.emailListAdmin(startRow, endRow);
      
      req.setAttribute("pageSize", pageSize);
      req.setAttribute("number",number );
      req.setAttribute("count", count);
      req.setAttribute("currentPage", currentPage);
      req.setAttribute("emailListAdmin", emailAdminList );
      mav.addObject("emailListAdmin", emailAdminList );
      mav.setViewName("oneqna_email/email_list_admin");
      return mav; 
      
   }
   
   //사용자가 자신이쓴글만보는 이메일리스트
   @RequestMapping(value = "/emailList_id.do" )
   public String mylistEmail(HttpServletRequest req, @RequestParam String writer, Model model) {
      HttpSession session = req.getSession();
         String url, msg = null;  
         String id=(String)session.getAttribute("loginId");
         if(!(id.equals(writer)))
            {
               msg = "현재 로그인한 아이디로만 접근이가능합니다.";
               url = "index.jsp";
               req.setAttribute("msg", msg);
               req.setAttribute("url", url);
               return "message";
            }
      model.addAttribute("mylistEmail", emailDAO.mylistEmail(writer));
      List<Oneqna_emailDTO> email_id=emailDAO.mylistEmail(writer);
      req.setAttribute("IdOneqnaList", email_id);
      return "oneqna_email/email_list_id";
   }
   
      @RequestMapping(value = "/useremail.do")
      public String userEmailForm() {
         return "oneqna_email/email_userWrite";
      }
      
      @RequestMapping(value = "/useremailPro.do")
      public ModelAndView insert_email(Oneqna_emailDTO dto, @ModelAttribute Oneqna_emailDTO oneqna_emailDTO, HttpServletRequest req) {
         String url, msg = null;
         String email_id=req.getParameter("email_id");
         String selectEmail=req.getParameter("selectEmail");
         String email=req.getParameter("email");

         if(email.equals("9")) {dto.setWriter_email(email_id+"@"+selectEmail);
         }else {dto.setWriter_email(email_id+"@"+email);}
         
          emailDAO.insertuserEmail(oneqna_emailDTO);
          return new ModelAndView("redirect:/emailList_id.do?writer="+dto.getWriter());

      }
      
      @RequestMapping(value = "/email_content.do")
      public String emailContent(HttpServletRequest req, @RequestParam int no) {
         Oneqna_emailDTO dto = emailDAO.getEmail(no, "emailContent");
         req.setAttribute("dto", dto);
         return "oneqna_email/emailContent";
      }
      @RequestMapping(value = "/adminEmailForm.do")
      public String adminWriteForm(HttpServletRequest req, @RequestParam int no) {
         HttpSession session = req.getSession();
         String url, msg = null;  
         if(!(session.getAttribute("loginId").equals("admin")))
            {
               msg = "관리자만 들어갈 수 있습니다.";
               url = "index.jsp";
               ModelAndView mav = new ModelAndView("message");
               req.setAttribute("msg", msg);
               req.setAttribute("url", url);
               return "message";
            }
         Oneqna_emailDTO dto=emailDAO.getEmail(no, "emailContent");
         req.setAttribute("dto", dto);
         return "oneqna_email/email_adminSubmit";
      }

      @RequestMapping(value ="/adminEmailPro.do", method = RequestMethod.POST)
      public ModelAndView emailSubmit(HttpServletRequest req, @RequestParam int no, @RequestParam String admin_title)throws Exception{
         HttpSession session = req.getSession();
         String url=null;
         String msg = null;  
         if(!(session.getAttribute("loginId").equals("admin")))
            {
               msg = "관리자만 들어갈 수 있습니다.";
               url = "index.jsp";
               ModelAndView mav = new ModelAndView("message");
               req.setAttribute("msg", msg);
               req.setAttribute("url", url);
               return mav;
            }
      
         String setfrom="sky01023795136@gmail.com";
         
         String writer=req.getParameter("writer");
         String writer_email=req.getParameter("writer_email");
         String content=req.getParameter("content");
           ModelAndView mav = new ModelAndView();
         int submit=emailDAO.insertAdminEmail(admin_title, no);
            req.setAttribute("insertAdminEmail", submit);
            if(submit!=0) {
             
                MimeMessage message = mailSender.createMimeMessage();
               MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
                  messageHelper.setFrom(setfrom);  
                  messageHelper.setTo(writer_email);     
                  messageHelper.setSubject(admin_title);
                  messageHelper.setText(content);
               
                  
                  mailSender.send(message);
                  msg=writer_email+"님에게 이메일이 전송되었습니다.";
                  url="email_adminlist.do";

                 
            }
          
            mav.addObject("msg", msg);
            mav.addObject("url", url);
            mav.setViewName("message");
            return mav;
      }


      @RequestMapping(value = "/deleteE.do")
      public ModelAndView boardDeletePro(@RequestParam int no, Oneqna_emailDTO dto) {
         String url, msg = null;
         emailDAO.deleteEmail(no);
      return new ModelAndView("redirect:/userEmaildelete.do");
      }

      
         @RequestMapping(value = "/userEmaildelete.do")
         public String emaildeleteForm() {
            return "oneqna_email/emailDelete";
         }
      
}