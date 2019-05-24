package com.model2.mvc.service.purchase.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;



//==> �쉶�썝愿�由� DAO CRUD 援ы쁽
@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	

	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}
	
	public void cancelPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.cancelPurchase", purchase);
	}

	public Purchase getPurchase(int tranNo) throws Exception{
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	
	public Purchase getPurchase2(int prodNo) throws Exception{
		return sqlSession.selectOne("PurchaseMapper.getPurchase", prodNo);
	}

	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}
	
	
	
	public List<Purchase> getPurchaseList(Search search,String userId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search );
		map.put("userId", userId);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList",map);
	}

	public List<Purchase> getSaleList(Search search) throws Exception{
	return sqlSession.selectList("PurchaseMapper.getSaleList",search);
	}
	
	
	// 寃뚯떆�뙋 Page 泥섎━瑜� �쐞�븳 �쟾泥� Row(totalCount)  return
	
	public int getTotalCount(String userId) throws Exception {

		return sqlSession.selectOne("PurchaseMapper.getTotalCount", userId);
	}

}
