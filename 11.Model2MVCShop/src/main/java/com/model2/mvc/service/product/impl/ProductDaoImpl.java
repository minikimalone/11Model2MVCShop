package com.model2.mvc.service.product.impl;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;



//==> ȸ������ DAO CRUD ����
@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}
	

	public void addProdct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}


	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}


	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList",search);
	}
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
		public int getTotalCount(Search search) throws Exception {
			return sqlSession.selectOne("ProductMapper.getTotalCount", search);
		}
		

		public void updateQuantity(Map<String, Object> pur) throws Exception {
		sqlSession.update("ProductMapper.updateQuantity", pur);
		}
		public void updateQuantity2(Map<String, Object> pur) throws Exception {
			sqlSession.update("ProductMapper.updateQuantity2", pur);
			}
		@Override
		public List<String> getProductName() throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectList("ProductMapper.getProductName");
		}	
	}
	
