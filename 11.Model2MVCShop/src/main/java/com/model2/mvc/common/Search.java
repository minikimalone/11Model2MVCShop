package com.model2.mvc.common;


public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private String menu;
	private int pageSize;
	private String orderByLowPrice;
	private String orderByHighPrice;
	private String orderByProdNo;
	private String category1;
	private String category2;
	
	//==> 占쏙옙占쏙옙트화占쏙옙 currentPage占쏙옙 占쌔댐옙占싹댐옙 회占쏙옙占쏙옙占쏙옙占쏙옙 ROWNUM 占쏙옙占� SELECT 占쏙옙占쏙옙 占쌩곤옙占쏙옙 Field 
		//==> UserMapper.xml 占쏙옙 
		//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
		//==> 占쏙옙占쏙옙
		private int endRowNum;
		private int startRowNum;
	
	
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

	public String getOrderByProdNo() {
			return orderByProdNo;
		}

		public void setOrderByProdNo(String orderByProdNo) {
			this.orderByProdNo = orderByProdNo;
		}

	///Constructor
	public Search() {
	}
	
	///Method
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int curruntPage) {
		this.currentPage = curruntPage;
	}

	public String getOrderByLowPrice() {
		return orderByLowPrice;
	}

	public void setOrderByLowPrice(String orderByLowPrice) {
		this.orderByLowPrice = orderByLowPrice;
	}

	public String getOrderByHighPrice() {
		return orderByHighPrice;
	}

	public void setOrderByHighPrice(String orderByHighPrice) {
		this.orderByHighPrice = orderByHighPrice;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	//==> Select Query 占쏙옙 ROWNUM 占쏙옙占쏙옙占쏙옙 占쏙옙 
		public int getEndRowNum() {
			return getCurrentPage()*getPageSize();
		}
		//==> Select Query 占쏙옙 ROWNUM 占쏙옙占쏙옙 占쏙옙
		public int getStartRowNum() {
			return (getCurrentPage()-1)*getPageSize()+1;
		}

		@Override
		public String toString() {
			return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
					+ searchKeyword + ", menu=" + menu + ", pageSize=" + pageSize + ", orderByLowPrice="
					+ orderByLowPrice + ", orderByHighPrice=" + orderByHighPrice + ", orderByProdNo=" + orderByProdNo
					+ ", category1=" + category1 + ", category2=" + category2 + ", endRowNum=" + endRowNum
					+ ", startRowNum=" + startRowNum + "]";
		}
	
}