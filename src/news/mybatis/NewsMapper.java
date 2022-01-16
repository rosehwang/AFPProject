package news.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import news.dto.NewsDTO;

public class NewsMapper {
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
	
	public static List newsList(int startRow, int endRow) {
		SqlSession session = null;
		String sql = null;
		try {
			session = sqlMapper.openSession();
			sql =  "select * from (select rownum rn, A.* from "
					+ "(select * from news order by news_no desc)A) "
					+ "where rn between '"+startRow+"' and '"+endRow+"'";
			java.util.HashMap<String, String> newsMap = new java.util.HashMap<>();
			newsMap.put("sql", sql);
			List list = session.selectList("newsList", newsMap);
			return list;
		}finally {
			session.close();
		}
	}
	
	public static int getNewsContent(String news_no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.update("getNewsContent", news_no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static NewsDTO getNews(String news_no)
	{
		SqlSession session = null;
		NewsDTO dto;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from news where news_no = '"+news_no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			dto = session.selectOne("getNews", map);
		}finally {
			session.close();
		}
		return dto;
	}
	
	public static List<NewsDTO> getMainNews()
	{

		SqlSession session = null;
		List list;
		try
		{
			session = sqlMapper.openSession();
			String sql = "SELECT * FROM (SELECT T1.*, ROWNUM RNUM FROM (select * from news order by news_no desc ) T1" + 
					" WHERE ROWNUM <= 5) WHERE RNUM >= 1"; 
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			list = session.selectList("getMainNews", map);
			return list;
		}
		finally {
			session.close();
		}
	}
	
	public static int getMaxNo()
	{
		SqlSession session = null;
		try
		{
			session = sqlMapper.openSession();
			int res = session.selectOne("getMaxNo");
			return res;
		}
		finally {
			session.close();
		}
	}
	
	public static int getCount() 
	{
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int count = session.selectOne("getCount");
			return count;
		}finally {
			session.close();
		}
	}
	
	public static int insertNews(NewsDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			System.out.println(dto.getNews_file());
			int res = session.insert("insertNews", dto);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int deleteNews(String news_no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteNews", news_no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int updateNews(NewsDTO dto, String chk) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = null;
			if(dto.getNews_filesize() > 0 || chk.equals("chk"))
			{
				sql = "update news set news_title = '"+dto.getNews_title()+"', news_content = '"+dto.getNews_content()+"', news_filesize = '"+dto.getNews_filesize()+"', news_file = '"+dto.getNews_file()+"' where news_no = '"+dto.getNews_no()+"'";
			}
			else if(dto.getNews_filesize() == 0 || chk.equals(null))
			{
				sql = "update news set news_title = '"+dto.getNews_title()+"', news_content = '"+dto.getNews_content()+"' where news_no = '"+dto.getNews_no()+"'";
			}
	
			java.util.HashMap<String, String> newsMap = new java.util.HashMap<>();
			newsMap.put("sql", sql);
			int res = session.update("updateNews", newsMap);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static List findNews(String searchMode, String word) {
		SqlSession session = null;
		String sql = null;
		try {
			session = sqlMapper.openSession();
			if(searchMode.equals("news_title"))
			{
				sql = "select * from news where news_title like '"+word+"'||'%' or"
						+ " news_title like '%'||'"+word+"' or news_title like '%'||'"+word+"'||'%' order by news_no desc";
			}
			if(searchMode.equals("news_content"))
			{
				sql = "select * from news where news_content like '"+word+"'||'%' or"
						+ " news_content like '%'||'"+word+"' or news_content like '%'||'"+word+"'||'%' order by news_no desc";
			}
			
			java.util.HashMap<String, String> newsMap = new java.util.HashMap<>();
			newsMap.put("sql", sql);
			List list = session.selectList("findNews", newsMap);
			return list;
		}finally {
			session.close();
		}
	}
	
	
}














