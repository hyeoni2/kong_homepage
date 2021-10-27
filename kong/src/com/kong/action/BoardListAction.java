package com.kong.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dao.Testdao;
import com.kong.dto.BoardDTO;
import com.kong.dto.PageMakerDTO;
import com.kong.dto.PageingDTO;

public class BoardListAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//메인페이지
		String     url         = "board/list.jsp";
		
		String	   keyword      = request.getParameter("keyword");
		String	   search     = request.getParameter("search");
		System.out.println(keyword);
		System.out.println(search);
		
	
		//페이징
		PageingDTO    pageDto  = new PageingDTO();
		int           page     = 1;
		String        tmp      = request.getParameter("page");
		
		System.out.println(pageDto.getPerPageNum());
		if(tmp != null) {
			page = Integer.parseInt(tmp);
		}
		
		System.out.println(page);
		pageDto.setPage(page);
		pageDto.setKeyword(keyword);
		pageDto.setSearch(search);
		
		int            pageNum = pageDto.getPage();

		BoardDAO       dao     = BoardDAO.getInstance();
		List<BoardDTO> list    = dao.getPggeSelectAll(pageDto);
		
		//페이징 관련
		PageMakerDTO paging    = new PageMakerDTO();
		paging.setDto(pageDto);
		
		int totalCount         = dao.totalCount(pageDto);
		paging.setTotalCount(totalCount);
		
		System.out.println(list.size());
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		//물고갈 페이지
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
