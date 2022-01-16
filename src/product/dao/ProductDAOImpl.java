package product.dao;

import java.util.List;

import product.dto.ProductDTO;
import product.mybatis.ProductMapper;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public int insertProduct(ProductDTO dto) {
		return ProductMapper.insertProduct(dto);
	}

	@Override
	public List<ProductDTO> listProduct() {
		return ProductMapper.listProduct();
	}

	@Override
	public ProductDTO getProduct(int num) {
		return ProductMapper.getProduct(num);
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		return ProductMapper.updateProduct(dto);
	}

	@Override
	public int deleteProduct(int num, String passwd) {
		return ProductMapper.deleteProduct(num); //��й�ȣ �Է� �޴� �ڵ� �߰� �ʿ�
	}

	@Override
	public String deletePassword(String id) {
		return ProductMapper.deletePassword(id);
	}

}








