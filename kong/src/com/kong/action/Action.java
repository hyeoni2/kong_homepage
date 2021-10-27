package com.kong.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//Action: 인터페이스 
	
	//추상메서드 
	//추상메서드를 쓰는 이유: 꼭 사용하라는 강제성을 띔
	
	//forward, sendRedirect 결정 => ActionForward
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	

}
