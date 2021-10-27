package com.kong.dto;

public class PageMakerDTO {

	private PageingDTO dto;
	
	//전체 수
	private int totalCount;
	//no에 따라 보여지는 페이지의 시작번호
	private int startPage;
	//no에 따라 보여지는 마지막 번호
	private int endPage;
	//이전 버튼의 경우의 수
	private boolean prev;
	//다음 버튼의 경우의 수
	private boolean next;
	
	//화면 하단에 보여지는 페이지 개수
	private int displayPageNum = 10;
	private int tempEndPage;
	
	private int finalPage;
	private int firstPage = 1;
	
	public int getFinalPage() {
		return finalPage;
	}
	
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
		calcData();
	}
	
	public int getFirstPage() {
		return firstPage;
	}
	
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();//setter호출 시 전체 세팅
	}
		
	//전체 필드 변수 값 계산
	public void calcData() {
		//페이지를 가져온것과 하단에 보여지는 페이지의 개수를 나눠서 int로 변환 후 다시 하단페이지 개수 곱하기
		endPage = (int)Math.ceil(dto.getPage() / (double) displayPageNum)* displayPageNum;
		
		startPage = (endPage - displayPageNum) + 1;
		finalPage = (int)(Math.ceil(totalCount)/(double)displayPageNum);
				
		int tempEndPage = (int) (Math.ceil(totalCount / (double) (dto.getPerPageNum()/dto.getPage())));
		this.tempEndPage = tempEndPage;
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = dto.getPage() == 1? false : true; //1페이지면 이전 누를 수 없음
		
		//마지막 페이지와 가져온 페이지가 토탈보다 작으면 누를수 있음
		next = (endPage * (dto.getPerPageNum()/dto.getPage())) >= totalCount ? false : true;
				
	}

	//getter setter
	public PageingDTO getDto() {
		return dto;
	}
	
	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setDto(PageingDTO dto) {
		this.dto = dto;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}


	
	



}
