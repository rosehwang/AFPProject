package product.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import account.dto.AccountDTO;
import account.dto.CoconutDTO;
import account.dto.MyAccountDTO;
import account.dto.ThirdDTO;

public class CoconutMapper {
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}
	
	public static AccountDTO getPass1(AccountDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			HashMap<String, String> hs = new HashMap<>();
			System.out.println(dto.getId());
			System.out.println(dto.getPasswd());
			String sql = "select * from bank_member where id = '" + dto.getId() + "' and passwd = '" + dto.getPasswd() + "'";
			
			hs.put("sql", sql);
			dto = session.selectOne("getPassword1", hs);
			
			return dto;
		} finally {
			session.close();
		}
	}
	
	public static AccountDTO getPass2(AccountDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			AccountDTO dto1 = session.selectOne("getPassword2", dto);
			return dto1;
		} finally {
			session.close();
		}
	}
	
	public static ThirdDTO getPass3(ThirdDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			ThirdDTO dto1 = session.selectOne("getPassword3", dto);
			return dto1;
		} finally {
			session.close();
		}
	}
	
	public static int insertCoco(String id) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertCoconut", id);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	
	public static CoconutDTO getId(String id) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			CoconutDTO dto = session.selectOne("getId", id);
			return dto;
		} finally {
			session.close();
		}
	}
	
	public static int DeleteCoconut(String id) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteCoconut", id);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	
	public static List<CoconutDTO> listCoconut() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List<CoconutDTO> list = session.selectList("listCoconut");
			return list;
		} finally {
			session.close();
		}
	}
	
	public static int insertNewAccount(MyAccountDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("newAccount", dto);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	
	public static List<MyAccountDTO> listMyAccount(String id) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List<MyAccountDTO> list = session.selectList("listMyAccount", id);
			return list;
		} finally {
			session.close();
		}
	}
	
	public static int isMyAccount(AccountDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.selectOne("isMyAccount", dto);
			return res;
		} finally {
			session.close();
		}
	}
	
	public static MyAccountDTO myAccountContent(MyAccountDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			MyAccountDTO content = session.selectOne("myAccountContent", dto);
			return content;
		} finally {
			session.close();
		}
	}
	
	public static int checkAccountNum(String accountNum) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.selectOne("checkAccountNum", accountNum);
			return res;
		} finally {
			session.close();
		}
	}
	
	/*
	public static int insertProduct(ProductDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertProduct", dto);
			System.out.println("삽입 메서드 실행");
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}

	public static List<ProductDTO> listProduct() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List<ProductDTO> list = session.selectList("listProduct");
			return list;
		} finally {
			session.close();
		}
	}
	
	public static ProductDTO getProduct(int num) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			ProductDTO dto = session.selectOne("getProduct", num);
			return dto;
		} finally {
			session.close();
		}
	}
	
	public static int deleteProduct(int num) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteProduct", num);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}

	public static int updateProduct(ProductDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.update("updateProduct", dto);
			System.out.println("업데이트 메서드 실행");
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}
	
	public static int updateCount(int num) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.update("updateCount", num);
			session.commit();
			return res;
		} finally {
			session.close();
		}
	}*/
}
















