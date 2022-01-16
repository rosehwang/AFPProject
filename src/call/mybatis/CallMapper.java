package call.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

import call.dto.CallDTO;
import notice.dto.NoticeDTO;

public class CallMapper {

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
   
   public static List adminList() {
      SqlSession session = null;
      try {
       session = sqlMapper.openSession();
       String sql = "select * from call order by call_no desc";
       java.util.HashMap<String,String> map = new java.util.HashMap<>();
       map.put("sql", sql);
       List list = session.selectList("adminList",map);
       return list;
       
      }finally {
         session.close();
      }
   }
   
   public static List memberList(String loginId) {
      SqlSession session = null;
      try {
       session = sqlMapper.openSession();
       String sql = "select * from call where call_writer = '"+loginId+"'order by call_no desc";
       java.util.HashMap<String,String> map = new java.util.HashMap<>();
       map.put("sql", sql);
       List list = session.selectList("memberList",map);
       return list;
       
      }finally {
         session.close();
      }
   }
   
   public static CallDTO getCall(int call_no)
   {
      SqlSession session = null;
      CallDTO cdto;
      try {
         session = sqlMapper.openSession();
         String sql = "select * from call where call_no = '"+call_no+"'";
         java.util.HashMap<String, String> map = new java.util.HashMap<>();
         map.put("sql", sql);
         cdto = session.selectOne("getCall", map);
      }finally {
         session.close();
      }
      return cdto;
   }
   
   public static int insertCall(CallDTO dto)
   {
      SqlSession session = null;
      try {
         session = sqlMapper.openSession();
         int res = session.insert("callInsert", dto);
         session.commit();
         return res;
      }finally {
         session.close();
      }
   }
   
   public static int updateCall(String call_no,String call_check)
   {
      SqlSession session = null;
      try {
         session = sqlMapper.openSession();
         String sql = "update call set call_check ='"+call_check+"' where call_no = '"+call_no+"'";
         java.util.HashMap<String, String> map = new java.util.HashMap<>();
         map.put("sql", sql);
         int res = session.update("updateCall", map);
         session.commit();
         return res;
      }finally {
         session.close();
      }
   }
   
   public static int getCountCall() {
      SqlSession session = null;
   try {
         session = sqlMapper.openSession();
         int res = session.selectOne("getCountCall");
         return res;
            
      }finally {
         session.close();
      }
     }
   
   public static int getCountMemberCall(String loginId) {
      SqlSession session = null;
   try {
         session = sqlMapper.openSession();
         String sql = "select count(*) from call where call_writer='"+loginId+"'";
         java.util.HashMap<String,String> map = new java.util.HashMap<>();
         map.put("sql", sql);
         int res = session.selectOne("getCountMemberCall",map);
         return res;
            
      }finally {
         session.close();
      }
     }
   
   public static int deleteCall(int call_no) {
      SqlSession session = null;
      try {
         
         session = sqlMapper.openSession();
         int res = session.delete("deleteCall",String.valueOf(call_no));
         session.commit();
         return res;
      }finally {
         session.close();
      }
      
      
   }
   
   
   
   
}