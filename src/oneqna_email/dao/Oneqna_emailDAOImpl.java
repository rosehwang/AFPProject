package oneqna_email.dao;

import java.util.List;

import oneqna_email.dto.Oneqna_emailDTO;
import oneqna_email.mybatis.Oneqna_emailMapper;

public class Oneqna_emailDAOImpl implements Oneqna_emailDAO{

	@Override
	public List<Oneqna_emailDTO> emailListAdmin(int start, int end) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.emailListAdmin(start, end);
	}

	@Override
	public int insertuserEmail(Oneqna_emailDTO dto) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.insertuserEmail(dto);
	}

	@Override
	public Oneqna_emailDTO getEmail(int no, String mode) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.getEmail(no, mode);
	}

	@Override
	public List<Oneqna_emailDTO> mylistEmail(String writer) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.mylistEmail(writer);
	}

	@Override
	public int insertAdminEmail(String admin_title, int no) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.insertAdminEmail(admin_title, no);
	}

	@Override
	public int deleteEmail(int no) {
		// TODO Auto-generated method stub
		return Oneqna_emailMapper.deleteEmail(no);
	}

}
