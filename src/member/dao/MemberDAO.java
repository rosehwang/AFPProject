package member.dao;

import java.sql.SQLException;
import java.util.List;

import find_Address.dto.Find_addressDTO;
import member.dto.MemberDTO;

public interface MemberDAO {

	//ȸ��---------------------------------------------------

	public int insertMember(MemberDTO dto); //ȸ������
	public int updateMember(MemberDTO dto); //��������
	public boolean checkMember(String name, String ssn) throws SQLException;//�ߺ�üũ	
	public String find_id(String email, String ssn, String name) throws Exception;
	public String find_passwd(String email, String id, String name) throws Exception;
	public int login(String id, String passwd) throws Exception;

	public MemberDTO getMember(String id); // ������������
	
	
	public int deleteMember(String id); //ȸ��Ż��

	public boolean idCheck(String id);

	/*	public List<Find_addressDTO> getAddress(String word);*/
    
	//�ӽ� ��� ����
	public int update_passwd(String id, String passwd); 
	//������
	public List<MemberDTO> listMember(int startRow, int endRow); //ȸ����Ϻ���
	public int memberCount();
	public List<MemberDTO> memberFind(String searchMode, String word);

}
