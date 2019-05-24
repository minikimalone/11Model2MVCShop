package com.model2.mvc.service.domain;

import java.sql.Date;

public class Cart {
	
	private User buyer;
	private Product purchaseProd;
	private Purchase tranNo;
	private int cartQty;
	private int cartNo;

	
	public Cart(){
		
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	
	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public Product getPurchaseProd() {
		return purchaseProd;
	}

	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}

	public Purchase getTranNo() {
		return tranNo;
	}

	public void setTranNo(Purchase tranNo) {
		this.tranNo = tranNo;
	}

	public int getCartQty() {
		return cartQty;
	}

	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}


		@Override
		public String toString() {
			return "Cart [buyer=" + buyer + ", purchaseProd=" + purchaseProd + ", tranNo=" + tranNo + ", cartQty="
					+ cartQty + ", cartNo=" + cartNo + "]";
		}

	
	}
	