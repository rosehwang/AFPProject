package member.dao;

import java.sql.SQLException;
import java.util.List;

import find_Address.dto.Find_addressDTO;
import member.dto.MemberDTO;

public interface MemberDAO {

	//회원---------------------------------------------------

	public int insertMember(MemberDTO dto); //회원가입
	public int updateMember(MemberDTO dto); //정보수정
	public boolean checkMember(String name, String ssn) throws SQLException;//중복체크	
	public String find_id(String email, String ssn, String name) throws Exception;
	public String find_passwd(String email, String id, String name) throws Exception;
	public int login(String id, String passwd) throws Exception;

	public MemberDTO getMember(String id); // 정보가져오기
	
	
	public int deleteMember(String id); //회원탈퇴

	public boolean idCheck(String id);

	/*	public List<Find_addressDTO> getAddress(String word);*/
    
	//임시 비번 지정
	public int update_passwd(String id, String passwd); 
	//관리자
	public List<MemberDTO> listMember(int startRow, int endRow); //회원목록보기
	public int memberCount();
	public List<MemberDTO> memberFind(String searchMode, String word);

}
