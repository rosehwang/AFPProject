package call.dao;

import java.util.List;

import call.dto.CallDTO;

public interface CallDAO {

   public List<CallDTO> adminListCall();
   public List<CallDTO> memberListCall(String loginId);
   public CallDTO getCall(int call_no);
   public int insertCall(CallDTO dto);
   public int updateCheck(String call_no,String call_check);
   public int deleteCall(int call_no);
}
