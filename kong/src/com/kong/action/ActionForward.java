package com.kong.action;

public class ActionForward {
	
	//view page(결과값 어디로 전송할지)
	private String path; //index.jsp
	
	//페이지 이동하는 방법 (sendRedirect, Forward)
	//true-> sendRedirect, fals-> forward
	private boolean isRedirect;  //trne

	public String getPath() {
		return path;
	}

	public void setPath(String path) { //path ="index.jsp"
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) { //true
		this.isRedirect = isRedirect;
	}

}
