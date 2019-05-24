package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	// INSERT
	public void addProdct(Product product) throws Exception;
	
	// SELECT ONE
	public Product getProduct(int prodNo) throws Exception;
	
	// UPDATE
	public void updateProduct(Product product) throws Exception;
	
	
	public void updateQuantity(Map<String, Object> pur) throws Exception;
	
	public void updateQuantity2(Map<String, Object> pur) throws Exception;
	// SELECT LIST
	public List<Product> getProductList(Search search) throws Exception;

	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
		
	
	public List<String> getProductName() throws Exception;
}