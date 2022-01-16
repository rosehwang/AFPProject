package bot.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bot.dto.BotDTO;

public class BotMapper {
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
	
	public static List botAnswerList() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			List list = session.selectList("botAnswerList");
			return list;
		}finally {
			session.close();
		}
	}
	
	public static BotDTO getAnswerBot(String bot_no)
	{
		SqlSession session = null;
		BotDTO dto;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from bot where bot_no = '"+bot_no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			dto = session.selectOne("getAnswerBot", map);
		}finally {
			session.close();
		}
		return dto;
	}
	
	public static int insertAnswerBot(BotDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("insertAnswerBot", dto);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int deleteAnswerBot(String bot_no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("deleteAnswerBot", bot_no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int updateAnswerBot(BotDTO dto) {
		SqlSession session = null;
		String sql = null;
		try {
			session = sqlMapper.openSession();
			sql = "update bot set bot_title = '"+dto.getBot_title()+"', bot_content = '"+dto.getBot_content()+"' where bot_no = '"+dto.getBot_no()+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("updateAnswerBot", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static boolean checkAnswerBot(String bot_no)
	{
		SqlSession session = null;
		String sql = null;
		BotDTO dto = null;
		try {
			session = sqlMapper.openSession();
			sql = "select * from bot where bot_no = '"+bot_no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			dto = session.selectOne("checkAnswerBot", map);
			if(dto != null)
			{
				return true;
			}
			session.commit();
		}finally {
			session.close();
		}
		return false;
	}
	
	
	
	
}














