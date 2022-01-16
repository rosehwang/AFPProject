package member.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import member.dto.MemberDTO;
import member.mybatis.MemberMapper;

public class MemberDAOImpl implements MemberDAO {
	private MemberDAO memberDAO;

	@Override
	public boolean checkMember(String name, String ssn) throws SQLException {
		//회원가입 유무
		return MemberMapper.checkMember(name, ssn);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return MemberMapper.insertMember(dto);
	}
	
	@Override
	public int login(String id, String passwd) throws Exception {
		return MemberMapper.login(id,passwd);
	}

	@Override
	public int updateMember(MemberDTO dto) {	
		return MemberMapper.updateMember(dto);
	}
	
	@Override
	public MemberDTO getMember(String id) {
		return MemberMapper.getMember(id);
	}
		

	
	@Override
	public String find_id(String email,String ssn,String name) throws Exception {
		return MemberMapper.find_id(email, ssn, name);
	}

	@Override
	public String find_passwd(String email,String id, String name) throws Exception {
		return MemberMapper.find_passwd(email, id, name);
	}

	
	@Override
	public int deleteMember(String id) {
		return MemberMapper.deleteMember(id);
	}
	
	@Override
	public boolean idCheck(String id)
	{
		return MemberMapper.idCheck(id);
	}
	
	@Override
	public List<MemberDTO> listMember(int startRow, int endRow) {
		return MemberMapper.listMember(startRow, endRow);
	}
	
	@Override
	public int memberCount()
	{
		return MemberMapper.memberCount();
	}
	
	@Override
	public List<MemberDTO> memberFind(String searchMode, String word)
	{
		return MemberMapper.memberFind(searchMode, word);
	}

	//임시 비밀번호 업데이트 
	@Override
	public int update_passwd(String id, String passwd) {// (가져온 값,임시 비번)
		return MemberMapper.update_passwd(id, passwd);
		}
	}




