package oneqna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import oneqna.dao.OneqnaDAO;
import oneqna.dto.OneqnaDTO;
import oneqna.mybatis.OneqnaMapper;

@Controller
public class OneqnaAnoController {
   @Autowired
   private OneqnaDAO oneqnaDAO;
   
   //관리자가보는 글리스트
   @RequestMapping(value = "/oneqna_list.do")
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
     
      //실행 됨
      System.out.println("넘어오는 값:"+pageNum);
      
      int pageSize = 8;
         int currentPage = Integer.parseInt(pageNum);//1
      int startRow = currentPage * pageSize - (pageSize - 1);// 5 - (5-1) =1
      int endRow = currentPage * pageSize;// 5
      int count = OneqnaMapper.getCountOneqna();// 총 게시물 가져오면 ,
      if (endRow > count) endRow = count; 
      int number = count - (currentPage-1)*pageSize;
                  // 총개수  30 
      List<OneqnaDTO> qnalist =oneqnaDAO.listOneqna(startRow, endRow);
      
      
      req.setAttribute("pageSize", pageSize);
      req.setAttribute("number",number );
      req.setAttribute("count", count);
      req.setAttribute("currentPage", currentPage);
      req.setAttribute("oneqnalist", qnalist);
      mav.addObject("oneqnalist", qnalist);
      mav.setViewName("oneqna/qnalist");
      return mav; 
      
   }
   
   //자신이쓴글만 볼수있는 리스트
   @RequestMapping(value = "/qnalist_Id.do")
   public String IdOneqnaList(HttpServletRequest req, @RequestParam String writer, Model model) {
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
      model.addAttribute("IdOneqnaList", oneqnaDAO.mylistOneqna(writer));
      List<OneqnaDTO> IdOneqnaList=oneqnaDAO.mylistOneqna(writer);
      req.setAttribute("IdOneqnaList", IdOneqnaList);
      return "oneqna/qnalist_Id";
   }
   
   //사용자 글쓰기 폼
   @RequestMapping(value = "/userWriter.do")
   public String userWriteForm() {
      return "oneqna/userWriter";
   }

   //사용자 글쓰기
   @RequestMapping(value = "/userWritePro.do")
   public ModelAndView insertOneqna(OneqnaDTO dto, @ModelAttribute OneqnaDTO oneqnaDTO, HttpServletRequest req) {
      String url, msg = null;
       oneqnaDAO.insertOneqna(oneqnaDTO);
      
       return new ModelAndView("redirect:/qnalist_Id.do?writer="+dto.getWriter());

   }
   
   //상세보기
   @RequestMapping(value = "/oneqna_content.do")
   public String Content(HttpServletRequest req, @RequestParam int no) {
     
      OneqnaDTO dto = oneqnaDAO.getOneqna(no, "content");
      req.setAttribute("dto", dto);
      return "oneqna/content";
   }
   //관리자글등록 폼
   @RequestMapping(value = "/adminWriterForm.do")
   public String adminWriteForm(HttpServletRequest req, @RequestParam int no) {
      HttpSession session = req.getSession();
      String url, msg = null;  
      if(!(session.getAttribute("loginId").equals("admin")))
         {
            msg = "관리자만 이용이 가능합니다.";
            url = "index.jsp";
            req.setAttribute("msg", msg);
            req.setAttribute("url", url);
            return "message";
         }
      OneqnaDTO dto=oneqnaDAO.getOneqna(no, "content");
      req.setAttribute("dto", dto);
      return "oneqna/adminWriter";
   }
   
   //관리자글 상세보기
   @RequestMapping(value = "/adminContent.do")
   public String adminForm(HttpServletRequest req, @RequestParam int no) {
      OneqnaDTO dto=oneqnaDAO.getOneqna(no, "content");
      req.setAttribute("dto", dto);
      return "oneqna/admincontent";
   }
   
   
   @RequestMapping(value = "/oneqnaUpdate.do")
   public String userForm(HttpServletRequest req, @RequestParam int no) {
      OneqnaDTO dto=oneqnaDAO.getOneqna(no, "content");
      req.setAttribute("dto", dto);
      return "oneqna/oneqnaupdateForm";
   }
   

   //사용자 글 수정
   @RequestMapping(value = "/userupdatepro.do")
   public ModelAndView oneqnaUpdate(OneqnaDTO dto, @RequestParam String content, @RequestParam String reg_date, @RequestParam String no) {
      String url, msg = null;
      oneqnaDAO.updateOneqna(content, reg_date, no);
      msg="글이 수정되었습니다.";
    ModelAndView mav = new ModelAndView("message");
      mav.addObject("msg", msg);
    return new ModelAndView("redirect:/qnalist_Id.do?writer="+dto.getWriter());

      
   }
   
   //관리자 글등록
   @RequestMapping(value="/adminWritePro.do")
   public ModelAndView insertAdmin(HttpServletRequest req, @RequestParam String admin_title, @RequestParam  String admin_content, @RequestParam  String admin_regdate,@RequestParam  String no) {
      HttpSession session = req.getSession();
      String url, msg = null;  
      if(!(session.getAttribute("loginId").equals("admin")))
         {
            msg = "관리자만 이용이 가능합니다.";
            url = "index.jsp";
            ModelAndView mav = new ModelAndView("message");
            req.setAttribute("msg", msg);
            req.setAttribute("url", url);
            return mav;
         }
      int res=oneqnaDAO.insertAdmin(admin_title, admin_content, admin_regdate, no);
      return new ModelAndView("redirect:oneqna_list.do");
   }
   
   //관리자 글 삭제
   @RequestMapping(value="/admindeletePro.do")
   public ModelAndView deleteAdmin(HttpServletRequest req,@RequestParam  String no, OneqnaDTO dto) {
      HttpSession session = req.getSession();
      String url, msg = null;  
      if(!(session.getAttribute("loginId").equals("admin")))
         {
            msg = "관리자만 이용이 가능합니다.";
            url = "index.jsp";
            ModelAndView mav = new ModelAndView("message");
            req.setAttribute("msg", msg);
            req.setAttribute("url", url);
            return mav;
         }
      System.out.println(no);
      oneqnaDAO.deleteAdmin(no);
      msg="글이 삭제 되었습니다.";
      ModelAndView mav = new ModelAndView("message");
      mav.addObject("msg", msg);
    return new ModelAndView("redirect:/oneqna_list.do");

   }


   
   
   //사용자 글삭제
   @RequestMapping(value = "/board_delete.do")
   public ModelAndView boardDeletePro(@RequestParam int no, OneqnaDTO dto) {
      String url, msg = null;
      oneqnaDAO.deleteOneqna(no);
   return new ModelAndView("redirect:/userdelete.do");
   }

   //글삭제 결과
      @RequestMapping(value = "/userdelete.do")
      public String userdeleteForm() {
         return "oneqna/userdelete";
      }
}


   