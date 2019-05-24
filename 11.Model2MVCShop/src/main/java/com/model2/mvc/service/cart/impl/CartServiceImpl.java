package com.model2.mvc.service.cart.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.cart.CartService;


@Service("cartServiceImpl")
public class CartServiceImpl implements CartService{

	@Override
	public void addCart(Cart cart) throws Exception {

		
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		
		
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		
	}

	public Map<String,Object> getCartList(Search search,String userId) throws Exception{
	
		return null;
	}

} 
