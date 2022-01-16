package oneqna.dao;

import java.util.List;

import oneqna.dto.OneqnaDTO;

public interface OneqnaDAO {
	public List<OneqnaDTO> listOneqna(int start, int end);
	
	public List<OneqnaDTO> mylistOneqna(String writer);
	
	public OneqnaDTO getOneqna(int no, String mode);
	
	public int insertOneqna(OneqnaDTO dto);
	
	public int updateOneqna(String content, String reg_date, String no);

	
	public int deleteOneqna(int no);
	
	public int insertAdmin(String admin_title, String admin_content, String admin_regdate, String no);

	public int deleteAdmin(String no);
	
	
	
	
}
