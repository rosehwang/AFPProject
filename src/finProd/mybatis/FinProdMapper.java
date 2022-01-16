package finProd.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.ibatis.common.resources.Resources;
import finProd.dto.FinProdDTO;

public class FinProdMapper {
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
	
	public static List listFinProd() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List list = session.selectList("listFinProd");
			return list;
		}finally {
			session.close();
		}
	}
	
	public static List findFinProd(HashMap<String, Object> hm) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List list = session.selectList("findFinProd", hm);
			return list;
		}finally {
			session.close();
		}
	}
	
	public static FinProdDTO getFinProd(int num) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			FinProdDTO dto = session.selectOne("getFinProd", num);
			return dto;
		}finally {
			session.close();
		}
	}
	
	public static List<FinProdDTO> compareFinProd(HashMap<String, int[]> hm) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List compList = session.selectList("compareFinProd", hm);
			return compList;
		}finally {
			session.close();
		}
	}
}