package oneqna_email.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import oneqna_email.dto.Oneqna_emailDTO;

public class Oneqna_emailMapper {
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}
	public static List emailListAdmin(int start, int end) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from (select rownum rn, A.* from "
				     + "(select * from email order by no desc)A) "
				     + "where rn between '"+start+"' and '"+end+"'";
			java.util.HashMap<String,String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("emailListAdmin", map);
			return list;
		}finally {
			session.close();
		}
	}
	public static int insertuserEmail(Oneqna_emailDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertuserEmail", dto);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	public static Oneqna_emailDTO getEmail(int no, String mode) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			Oneqna_emailDTO res = session.selectOne("getEmail", no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	//public List<Oneqna_emailDTO> mylistEmail(String writer);
	public static List mylistEmail(String writer) {
		SqlSession session=null;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from email where writer = '" + writer + "' order by no desc";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("mylistEmail", map);
			return list;
		}finally {
			session.close();
		}
	}
	
	//public int insertAdminEmail(String admin_title, String no);
	public static int insertAdminEmail(String admin_title, int no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "update email set admin_title='"+admin_title+"' where no='"+no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("insertAdmin", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int deleteEmail(int no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteEmail", no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
}
