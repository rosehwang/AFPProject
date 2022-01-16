package notice.dao;

import java.util.List;

import notice.dto.NoticeDTO;
import notice.mybatis.NoticeMapper;

public class NoticeDAOImpl implements NoticeDAO{


	@Override
	public List<NoticeDTO> listNotice(int start, int end) {
		// TODO Auto-generated method stub
		return NoticeMapper.listNotice(start,end);
	}
	
	
	@Override
	public NoticeDTO getNotice(int notice_no, String mode) {
		 return NoticeMapper.getNotice(notice_no, mode);
	}                                 //getParameter , "content"            

	@Override
	public int insertNotice(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return NoticeMapper.insertNotice(dto);
	}

	@Override
	public int deleteNotice(String notice_no) {
		// TODO Auto-generated method stub
		return NoticeMapper.deleteNotice(notice_no);
	}

	@Override
	public List<NoticeDTO> findNotice(String word, String type) {
		// TODO Auto-generated method stub
		return NoticeMapper.findNotice(word,type);
	}


	@Override
	public int updateNotice(NoticeDTO dto, String check) {
		// TODO Auto-generated method stub
		return NoticeMapper.updateNotice(dto, check);
	}


	@Override
	public List<NoticeDTO> getMainNotice() {
		// TODO Auto-generated method stub
		return NoticeMapper.getMainNotice();
	}
	
}
