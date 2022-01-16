package coconut.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import product.dao.ProductDAO;
import product.dto.ProductDTO;

@Controller
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	
	/*@RequestMapping(value="/fin_Index.do")
	public ModelAndView finIndex() {
		return new ModelAndView("finIndex");
	}
	
	@RequestMapping(value="/prod_Index.do")
	public ModelAndView prodIndex() {
		return new ModelAndView("product/prodIndex");
	}*/
	
	protected ModelAndView adminOnly() {
		ModelAndView mav = new ModelAndView();
		String msg = "관리자 전용 페이지입니다.";
		String url = "finIndex.do";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value="/prod_insert.do")
	public ModelAndView prodInsert(HttpSession session) {
		if((String)session.getAttribute("loginId")==null) {
			return new ModelAndView("index/finIndex");
		}
		String loginId = (String)session.getAttribute("loginId");
		if(loginId.equals("admin")) {
			return new ModelAndView("product/prodInsert");
		}else {
			return adminOnly();
		}
	}
	
	@RequestMapping(value = "/prod_insertPro.do")
	public ModelAndView prodInsertPro(@ModelAttribute ProductDTO dto, HttpSession session)
			throws IOException {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId.equals("admin")) {
			ModelAndView mav = new ModelAndView();
			String url = null;
			String msg = null;
			int res = productDAO.insertProduct(dto);
			
			if(res > 0) {
				msg = "상품 등록 성공";
			}else {
				msg = "상품 등록 실패";
			}
			url = "prod_list.do";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}else {
			return adminOnly();
		}
	}

	@RequestMapping(value="/prod_list.do")
	public ModelAndView prodList() {
		List<ProductDTO> prodList = productDAO.listProduct();
		return new ModelAndView("product/prodList", "prodList", prodList);
	}
	
	@RequestMapping(value="/prod_content.do")
	public ModelAndView prodContent(@RequestParam int num) {
		ProductDTO dto = productDAO.getProduct(num);
		return new ModelAndView("product/prodContent", "dto", dto);
	}
	
	@RequestMapping(value="/prod_delete.do")
	public ModelAndView prodDelete() {
		return new ModelAndView("product/prodDelete");
	}
	
	@RequestMapping(value="/prod_deletePro.do")
	public ModelAndView prodDeletePro(@RequestParam int num, @RequestParam String passwd, @RequestParam String id) {
		int res = 0;
		String originPass = productDAO.deletePassword(id);
		if(originPass.equals(passwd)) {
			res = productDAO.deleteProduct(num, passwd);
			return new ModelAndView("product/prodDeletePro","res", res);
		}else {
			return new ModelAndView("product/prodDeletePro","res", res);			
		}
	}
	
	@RequestMapping(value="/prod_update.do")
	public ModelAndView prodUpdate(@RequestParam int num) {
		ProductDTO dto = productDAO.getProduct(num);
		return new ModelAndView("product/prodUpdate", "dto", dto);
	}
	
	@RequestMapping(value="/prod_updatePro.do")
	public ModelAndView prodUpdatePro(@ModelAttribute ProductDTO dto) {
		int res = productDAO.updateProduct(dto);
		String msg = null, url = null;
		ModelAndView mav = new ModelAndView();
		if(res > 0) {
			msg = "상품 수정 성공";
		}else {
			msg = "상품 수정 실패";
		}
		url = "prod_content.do?num="+dto.getNum();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
}













