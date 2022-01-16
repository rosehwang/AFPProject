package oneqna_email.dao;

import java.util.List;

import oneqna_email.dto.Oneqna_emailDTO;

public interface Oneqna_emailDAO {

	public List<Oneqna_emailDTO> emailListAdmin(int start, int end);
	

	public int insertuserEmail(Oneqna_emailDTO dto);
	
	public  Oneqna_emailDTO getEmail(int no, String mode);
	
	public List<Oneqna_emailDTO> mylistEmail(String writer);
	
	public int insertAdminEmail(String admin_title, int no);
	
	public int deleteEmail(int no);
	
}
