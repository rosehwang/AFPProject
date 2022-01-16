package finProd.dao;

import java.util.HashMap;
import java.util.List;

import finProd.dto.FinProdDTO;

public interface FinProdDAO {
	public List<FinProdDTO> listFinProd();
	public List<FinProdDTO> findFinProd(HashMap<String, Object> hm);
	public FinProdDTO getFinProd(int num);
	public List<FinProdDTO> compareFinProd(HashMap<String, int[]> hm);
}
