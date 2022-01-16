package member.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class MemberMapper {

	private static SqlSessionFactory sqlMapper;
	private MemberDAO memberDAO;

	static {
		try {
			String resource = "SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}
	
	
	// ȸ�����------------------------
	// ȸ������--------------------------------------
	public static int insertMember(MemberDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertMember", dto);
			System.out.println("insert res : " + res);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	

	// ȸ������ ���� ��ȸ�� �� �ϴ� ���
	public static boolean checkMember(String name, String ssn) throws SQLException {
		SqlSession session = null;
		MemberDTO dto = null;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from bank_member where name='" + name + "' and ssn= '" + ssn + "'";
			java.util.HashMap<String, String> Map = new java.util.HashMap<>();
			Map.put("sql", sql);
			dto = session.selectOne("checkMember", Map);
			if (dto == null) {
				session.commit();
				return false;
			}
			session.commit();
		} finally {
			session.close();
		}
		return true;
	}


	
	//�α���ó����� 
	public static int login(String id, String passwd ) {  //public static int login(String id, String passwd) {
		SqlSession session = null;
		MemberDTO dto = null;

		try {
			session = sqlMapper.openSession();
			String sql = "select passwd from bank_member where id='" + id + "'";
			java.util.HashMap<String, String> Map = new java.util.HashMap<>();
			Map.put("sql", sql);

			String dbPass = session.selectOne("login", Map);
			if(dbPass != null)
			{
				if (dbPass.equals(passwd)) {
					session.commit();
					return 0;
				}
				else
				{
					return 2;
				}
			}

			session.commit();

		}
		finally {
			session.close();
		}
		return 1;
	}


	//�α׾ƿ�
	public static void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();

		return;
	}


	// ID,��й�ȣã��
	public static String find_id(String email, String ssn, String name){
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "select id from bank_member where email = '" + email + "' and ssn = '" + ssn + "' and name = '" + name + "'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			String res = session.selectOne("find_id", map); 
			return res;
		} finally {
			session.close();
		}
	}

	public static String find_passwd(String email, String id, String name) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "select passwd from bank_member where email = '" + email + "' and id = '" + id + "' and name = '" + name + "'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			String res = session.selectOne("find_passwd", map);
			return res;
		} finally {
			session.close();
		}
	}


	// ȸ��Ż��
	public static int deleteMember(String id) {		
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteMember", id);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	
	//����
	public static int updateMember(MemberDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.update("updateMember", dto);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}


	public static MemberDTO getMember(String id) {
		SqlSession session = null;
		MemberDTO dto = null;
		try {
			session = sqlMapper.openSession();
			dto = session.selectOne("getMember", id);
			
			session.commit();
			return dto;
		}finally {
			session.close();
		}
	}
	

	//�ּҰ�������
	public static List getAddress(String word)
	{
		SqlSession session = null;
		String sql = null;
		try {
			session = sqlMapper.openSession();
			sql = "select * from find_address where find_address1 like '%'||'"+word+"'||'%' or find_address2 like '%'||'"+word+"'||'%' order by addr_no desc";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("getAddress", map);
			return list;
		} finally {
			session.close();
		}
	}

	
	//���̵� �ߺ�üũ
	public static boolean idCheck(String id) {
		SqlSession session = null;
		MemberDTO dto = null;
		try {
			session = sqlMapper.openSession();
			dto = session.selectOne("idCheck", id);
			if(dto != null)
			{
				return true;
			}
			session.commit();
		} finally {
			session.close();
		}
		return false;		
	}

	//ȸ������ ����
	public static List memberMypage() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List list = session.selectList("memberMypage");
			return list;
		} finally {
			session.close();
		}
	}

	// ������ ���---------------------
		public static List listMember(int startRow, int endRow) {
			SqlSession session = null;
			String sql = null;
			try {
				session = sqlMapper.openSession();
				sql =  "select * from (select rownum rn, A.* from "
						+ "(select * from bank_member order by num desc)A) "
						+ "where rn between '"+startRow+"' and '"+endRow+"'";
				java.util.HashMap<String, String> map = new java.util.HashMap<>();
				map.put("sql", sql);
				List list = session.selectList("listMember", map);
				return list;
			}finally {
				session.close();
			}
		}
		//////////////////�ҿ��߰�
		public static int memberCount()
		{
			SqlSession session = null;
			try
			{
				session = sqlMapper.openSession();
				int count = session.selectOne("memberCount");
				return count;
			}
			 finally {
				session.close();
			}
		}
		public static List memberFind(String searchMode, String word)
		{
			SqlSession session = null;
			String sql = null;
			try {
				session = sqlMapper.openSession();
				if(searchMode.equals("name"))
				{
					sql = "select * from bank_member where name like '"+word+"'||'%' or"
							+ " name like '%'||'"+word+"' or name like '%'||'"+word+"'||'%' order by num desc";
				}
				if(searchMode.equals("ID"))
				{
					sql = "select * from bank_member where id like '"+word+"'||'%' or"
							+ " id like '%'||'"+word+"' or id like '%'||'"+word+"'||'%' order by num desc";
				}
				
				java.util.HashMap<String, String> map = new java.util.HashMap<>();
				map.put("sql", sql);
				List list = session.selectList("memberFind", map);
				return list;
			}finally {
				session.close();
			}
		}
		////////////////////////�������
	
	
	//�ӽ� ��й�ȣ �ֱ�
    public static int update_passwd(String id, String passwd) {
    	SqlSession session = null;
    	try {
    		//�ƴϾ� �� �ʿ����, ���̵� �Է��ϴϱ�  �� ���̵��
    		//���� ��� ������Ʈ �ϸ� �� 
    		
    		//�Ϸ�  
    		System.out.println("mapper ���:"+passwd);
    		
      		session = sqlMapper.openSession();
//    		String sql = "update bank_member set passwd ='"+passwd+"' where id = '"+id+"'";
    		java.util.HashMap<String, String> map = new java.util.HashMap<>();
//    		map.put("sql", sql);
    		map.put("passwd", passwd);
    		map.put("id", id);
    		int res = session.update("updatePasswd",map);
    		session.commit();
    		System.out.println("mapper���� ���� res="+res);
    		return res;
    	}finally {
    		session.close();
    	}
    }
}
