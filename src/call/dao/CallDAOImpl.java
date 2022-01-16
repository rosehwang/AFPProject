package call.dao;

import java.util.List;

import call.dto.CallDTO;
import call.mybatis.CallMapper;

public class CallDAOImpl implements CallDAO {

   @Override
   public List<CallDTO> adminListCall() {
      // TODO Auto-generated method stub
      return CallMapper.adminList();
   }

   @Override
   public List<CallDTO> memberListCall(String loginId) {
      // TODO Auto-generated method stub
      return CallMapper.memberList(loginId);
   }

   @Override
   public CallDTO getCall(int call_no) {
      // TODO Auto-generated method stub
      return CallMapper.getCall(call_no);
   }

   @Override
   public int insertCall(CallDTO dto) {
      // TODO Auto-generated method stub
      return CallMapper.insertCall(dto);
   }

   @Override
   public int updateCheck(String call_no, String call_check) {
      // TODO Auto-generated method stub
      return CallMapper.updateCall(call_no,call_check);
   }

   @Override
   public int deleteCall(int call_no) {
      // TODO Auto-generated method stub
      return CallMapper.deleteCall(call_no);
   }

}