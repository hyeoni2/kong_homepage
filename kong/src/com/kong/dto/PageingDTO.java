package com.kong.dto;

public class PageingDTO {
	
	private int page; //보여줄 페이지
	private int perPageNum; //페이지당 보여줄 페이지 수
	private String keyword;//키워드
	private String search;//찾을거
	
	
	public PageingDTO() {
		this.page = 1; 
		this.perPageNum = 10;
	}
	
	public int getPageStart() {	
		
		return ((this.page - 1) * this.perPageNum)+1;
	}
	


	//getter setter
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {//page가 0보다 작거나 같아지면 페이지는 1
			this.page = 1;
		}else {			
			this.page = page;
		}

	}

	public int getPerPageNum() {
		return this.page * perPageNum;
	}

	public void setPerPageNum(int perPageNum) {

		this.perPageNum = perPageNum;
	}


	
	
	/* 키워드 관련 */
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}
