package finProd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
/*import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;*/
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import finProd.dao.FinProdDAO;
import finProd.dto.FinProdDTO;

@Controller
public class FinProdAnoController {
	@Autowired
	private FinProdDAO finProdDAO;
	
	// 금융상품검색 페이지 최초 진입시 상품 리스트 출력
	@RequestMapping(value="/findFinProd.do")
	public String finProdList(HttpServletRequest req) {
		List<FinProdDTO> finProdList = finProdDAO.listFinProd();
		req.setAttribute("plist", finProdList);
		return "finProd/findFinProd";
	}
	
	// 금융상품 검색 기능
	@RequestMapping(value="/findFinProdOk.do")
	public String findFinProd(@ModelAttribute FinProdDTO dto, HttpServletRequest req) {
		HashMap<String, Object> hm = new HashMap<>();
		splitAndPut(dto, hm);
		
		List<FinProdDTO> finProdList = finProdDAO.findFinProd(hm);
		req.setAttribute("plist", finProdList); // 검색 결과 리스트 출력용
		req.setAttribute("dto", dto); // 검색 후 검색조건 유지용
		return "finProd/findFinProd";
	}
	
	// findFinProd에서 사용할 method(검색 조건 분할 & HashMap에 Array 넣기)
	protected void splitAndPut(FinProdDTO dto, HashMap<String, Object> hm) {
		hm.put("keyword", dto.getKeyword());
		
		if(dto.getKind() != null) {
			String[] kindArr = dto.getKind().split(",");
			hm.put("kindArr", kindArr);
		}
		if(dto.getBank() != null) {
			String[] bankArr = dto.getBank().split(",");
			hm.put("bankArr", bankArr);
		}
		if(dto.getDuration() != null) {
			String[] durArr = dto.getDuration().split(",");
			hm.put("durArr", durArr);
		}
		if(dto.getInterest() != null) {
			String[] intArr = dto.getInterest().split(",");
			hm.put("intArr", intArr);
		}
		if(dto.getMember() != null) {
			String[] memArr = dto.getMember().split(",");
			hm.put("memArr", memArr);
		}
	}
	
	// 제품비교
	@RequestMapping(value="/compareFinProd.do")
	public String compareFinProd(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value="num",required=true) int[] list) throws ServletRequestBindingException {
		HashMap<String, int[]> hm = new HashMap<>();
		hm.put("compArr", list);
		List<FinProdDTO> compList = finProdDAO.compareFinProd(hm);
		req.setAttribute("clist", compList);
		return "finProd/compareFinProd";
	}
}

