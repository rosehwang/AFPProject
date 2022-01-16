package oneqna.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import oneqna.dto.OneqnaDTO;


public class OneqnaMapper {
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
	public static List listOneqna(int start, int end) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from (select rownum rn, A.* from "
				     + "(select * from oneqna order by no desc)A) "
				     + "where rn between '"+start+"' and '"+end+"'";
			java.util.HashMap<String,String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("listOneqna", map);
			return list;
		}finally {
			session.close();
		}
	}
	//�ڽ��� ���۸��ҷ�����
	public static List IdOneqnaList(String writer) {
		SqlSession session=null;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from oneqna where writer = '" + writer + "' order by no desc";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);//����� sql�� rep�� �ȹް�, map���� �־ jstl ����߳�.
			List list = session.selectList("IdOneqnaList", map);// mapper.xml���� ������ �� �� �����;� �Ǵϱ� 
			return list;
		}finally {
			session.close();
		}
	}
	public static OneqnaDTO getOneqna(int no, String mode) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			OneqnaDTO res = session.selectOne("getOneqna", no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}

	public static int insertOneqna(OneqnaDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertOneqna", dto);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	public static int insertAdmin(String admin_title, String admin_content, String admin_regdate, String no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "update oneqna set admin_title='"+admin_title+"', admin_content='"+admin_content+"', admin_regdate='"+admin_regdate+"' where no='"+no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("insertAdmin", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
//����� �� ����
	public static int OneqnaUpdate(String content, String reg_date, String no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = "update oneqna set content='"+content+"', reg_date='"+reg_date+"' where no='"+no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("OneqnaUpdate", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int deleteAdmin(String no) {
		SqlSession session = null;
		System.out.println(no);
		try {
			session = sqlMapper.openSession();
			String sql = "update oneqna set admin_title ='', admin_content ='', admin_regdate = '' where no ='"+no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("deleteAdmin", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	public static int deleteOneqna(int no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteOneqna", no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
		
	public static int getCountOneqna() {
		SqlSession session= null;
		try {
			session=sqlMapper.openSession();
			int res=session.selectOne("getCountOneqna");
			return res;
		}finally{
			session.close();
		}
		
	}
		
	}
	











