package product.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import product.dto.ProductDTO;

public class ProductMapper {
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
	
	public static String deletePassword(String id) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String password = session.selectOne("getPasswordCheck", id);
			return password;
		} finally {
			session.close();
		}
	}
}
















