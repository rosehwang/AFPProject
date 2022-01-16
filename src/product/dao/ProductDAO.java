package product.dao;

import java.util.List;

import product.dto.ProductDTO;

public interface ProductDAO {
	public int insertProduct(ProductDTO dto);
	public List<ProductDTO> listProduct();
	public ProductDTO getProduct(int num);
	public int updateProduct(ProductDTO dto);
	public int deleteProduct(int num, String passwd);
	public String deletePassword(String id);
}
