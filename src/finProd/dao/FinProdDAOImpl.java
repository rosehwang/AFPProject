package finProd.dao;

import java.util.HashMap;
import java.util.List;

import finProd.dto.FinProdDTO;
import finProd.mybatis.FinProdMapper;

public class FinProdDAOImpl implements FinProdDAO {
	@Override
	public List<FinProdDTO> listFinProd() {
		return FinProdMapper.listFinProd();
	}
	@Override
	public List<FinProdDTO> findFinProd(HashMap<String, Object> hm) {
		return FinProdMapper.findFinProd(hm);
	}
	@Override
	public FinProdDTO getFinProd(int num) {
		return FinProdMapper.getFinProd(num);
	}
	@Override
	public List<FinProdDTO> compareFinProd(HashMap<String, int[]> hm) {
		return FinProdMapper.compareFinProd(hm);
	}
}
