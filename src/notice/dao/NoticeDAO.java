package notice.dao;

import java.util.List;

import notice.dto.NoticeDTO;

public interface NoticeDAO {
     public List<NoticeDTO> listNotice(int start, int end);
     public NoticeDTO getNotice(int notice_no,String mode);
	 public int insertNotice(NoticeDTO dto);
     public int deleteNotice(String notice_no);
     public List<NoticeDTO> findNotice(String word,String mode);
     public int updateNotice(NoticeDTO dto, String check);
     public List<NoticeDTO> getMainNotice();
}
