package notice.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import notice.dto.NoticeDTO;


public class NoticeMapper {
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
	
	public static List listNotice(int start, int end) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			/*List list = session.selectList("noticeList",int start, int end);*/
			String sql = "select * from (select rownum rn, A.* from "
					     + "(select * from notice order by notice_no desc)A) "
					     + "where rn between '"+start+"' and '"+end+"'";
					
			java.util.HashMap<String,String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("noticeList",map);
			return list;
		}finally {
			session.close();
		}
	}
	
	public static int plusReadcount(int notice_no) {
		SqlSession session = null;
		try {
			session =sqlMapper.openSession();
		    int res = session.update("upreadcount",notice_no);
		    session.commit();
		    return res;
		}finally {
			session.close();
		}
	}
	
	
	public static NoticeDTO getNotice(int notice_no, String mode)
	{                                  // parameter,  content
		if(mode.equals("content")) {
			plusReadcount(notice_no);
		}
		
		SqlSession session = null;
		NoticeDTO dto;
		try {
			session = sqlMapper.openSession();
			String sql = "select * from notice where notice_no = '"+notice_no+"'";
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			dto = session.selectOne("getNotice", map);
		}finally {
			session.close();
		}
		return dto;
	}
	
	public static List<NoticeDTO> getMainNotice()
	{
		SqlSession session = null;
		List list;
		try
		{
			session  = sqlMapper.openSession();
			String sql = "SELECT * FRO"
					+ "M (SELECT T1.*, ROWNUM RNUM FROM (select * from notice order by notice_no desc ) T1" + 
					     " WHERE ROWNUM <= 5) WHERE RNUM >= 1"; 
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			list = session.selectList("getMainNotice", map);
			return list;
		}
		finally {
			session.close();
		}
		}
		
	
	
	public static int insertNotice(NoticeDTO dto) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.insert("noticeInsert", dto);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	public static int deleteNotice(String notice_no) {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.delete("noticeDelete", notice_no);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}
	
	//수정
	//문제는 여기 
	public static int updateNotice(NoticeDTO dto, String chk) {//완료
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			String sql = null;
			if(dto.getNotice_filesize() > 0 || chk.equals("chk"))//완료
			{
				sql = "update notice set notice_title = '"+dto.getNotice_title()+"', notice_content = '"+dto.getNotice_content()+"', notice_filesize = '"+dto.getNotice_filesize()+"', notice_file = '"+dto.getNotice_file()+"' where notice_no = '"+dto.getNotice_no()+"'";
			}
			else if(dto.getNotice_filesize() == 0 || chk.equals(null))
			{
				sql = "update notice set notice_title = '"+dto.getNotice_title()+"', notice_content = '"+dto.getNotice_content()+"' where notice_no = '"+dto.getNotice_no()+"'";
			}
	
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			int res = session.update("updateNotice", map);
			session.commit();
			return res;
		}finally {
			session.close();
		}
	}

	
	
	public static List findNotice(String word, String type) {
		SqlSession session = null;
		String sql = null;
		try {
			session = sqlMapper.openSession();
			
			if(type.equals("notice_title"))
			{
				sql = "select * from notice where notice_title like '"+word+"'||'%' or"
						+ " notice_title like '%'||'"+word+"' or notice_title like '%'||'"+word+"'||'%' order by notice_no desc";
			}
			if(type.equals("notice_content"))
			{
				sql = "select * from notice where notice_content like '"+word+"'||'%' or"
						+ " notice_content like '%'||'"+word+"' or notice_content like '%'||'"+word+"'||'%' order by notice_no desc";
			}
					     
			java.util.HashMap<String, String> map = new java.util.HashMap<>();
			map.put("sql", sql);
			List list = session.selectList("noticeFind", map);
			return list;
		}finally {
			session.close();
		}
	}
	
	 public static int getCountNotice() {
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			int res = session.selectOne("getCountNotice");
			return res;
			
		}finally {
			session.close();
		}
	  }
	
}














