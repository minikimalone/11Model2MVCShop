package com.model2.mvc.service.domain;

import java.sql.Date;


public class Product {
	
	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String prodTranCode;
	private int prodTranNo;
	private int prodQty;
	private int prodPurQty;
	private String category1;
	private String category2;
	
	
	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public Product(){
	}

	public int getProdQty() {
		return prodQty;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}

	public int getProdTranNo() {
		return prodTranNo;
	}

	public int getProdPurQty() {
		return prodPurQty;
	}

	public void setProdPurQty(int prodPurQty) {
		this.prodPurQty = prodPurQty;
	}

	public void setProdTranNo(int prodTranNo) {
		this.prodTranNo = prodTranNo;
	}

	public void setProdTranCode(String prodTranCode) {
		this.prodTranCode = prodTranCode;
	}

	public String getProdTranCode() {
		return prodTranCode;
	}
	public void setProTranCode(String prodTranCode) {
		this.prodTranCode = prodTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Product [fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price + ", prodDetail="
				+ prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate=" + regDate
				+ ", prodTranCode=" + prodTranCode + ", prodTranNo=" + prodTranNo + ", prodQty=" + prodQty
				+ ", prodPurQty=" + prodPurQty + ", category1=" + category1 + ", category2=" + category2 + "]";
	}	
}