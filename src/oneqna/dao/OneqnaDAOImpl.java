package oneqna.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import oneqna.dto.OneqnaDTO;
import oneqna.mybatis.OneqnaMapper;


public class OneqnaDAOImpl implements OneqnaDAO {
	class MyRowMapper implements RowMapper<OneqnaDTO	>{
		@Override
		public OneqnaDTO mapRow(ResultSet rs, int arg1) throws SQLException {
			OneqnaDTO dto = new OneqnaDTO();
			dto.setNo(rs.getInt("no"));
			dto.setWriter(rs.getString("writer"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setAdmin_title(rs.getString("admin_title"));
			dto.setAdmin_regdate(rs.getString("admin_regdate"));
			dto.setAdmin_content(rs.getString("admin_content"));
			return dto;
		}
	}
	private MyRowMapper mapper = new MyRowMapper();
	
	class MyResultSetExtractor implements ResultSetExtractor<OneqnaDTO>{

		@Override
		public OneqnaDTO extractData(ResultSet rs) throws SQLException, DataAccessException {
			if (rs.next()) {
				OneqnaDTO dto = new OneqnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAdmin_title(rs.getString("admin_title"));
				dto.setAdmin_regdate(rs.getString("admin_regdate"));
				dto.setAdmin_content(rs.getString("admin_content"));
				return dto;
			}
			throw new DataRetrievalFailureException("해당 객체를 찾을 수 없습니다.");
		}
	}
	class MyPreparedStatementSetter implements PreparedStatementSetter{
		private Integer no;
		public MyPreparedStatementSetter(Integer no) {
			this.no = no;
		}
		@Override
		public void setValues(PreparedStatement arg0) throws SQLException {
			// TODO Auto-generated method stub
			arg0.setInt(1, no);
		}
	}
	private MyResultSetExtractor extractor = new MyResultSetExtractor();
	
	
	@Override
	public List<OneqnaDTO> listOneqna(int start, int end) {
		return OneqnaMapper.listOneqna(start, end);
	}
	@Override
	public OneqnaDTO getOneqna(int no, String mode) {
		// TODO Auto-generated method stub
		return OneqnaMapper.getOneqna(no, mode);
	}
	@Override
	public int insertOneqna(OneqnaDTO dto) {
		// TODO Auto-generated method stub
		return OneqnaMapper.insertOneqna(dto);
	}
	
	@Override
	public int deleteOneqna(int no) {
		// TODO Auto-generated method stub
		return OneqnaMapper.deleteOneqna(no);
	}
	
	@Override
	public int insertAdmin(String admin_title, String admin_content, String admin_regdate, String no) {
		// TODO Auto-generated method stub
	return OneqnaMapper.insertAdmin(admin_title, admin_content, admin_regdate, no);
	}
	@Override
	public int updateOneqna(String content, String reg_date, String no) {
		// TODO Auto-generated method stub
		return OneqnaMapper.OneqnaUpdate(content, reg_date, no);
	}
	@Override
	public int deleteAdmin(String no) {
		// TODO Auto-generated method stub
		return OneqnaMapper.deleteAdmin(no);
	}
	@Override
	public List<OneqnaDTO> mylistOneqna(String writer) {
		// TODO Auto-generated method stub
		return OneqnaMapper.IdOneqnaList(writer);
	}

	
	
	
	
}
