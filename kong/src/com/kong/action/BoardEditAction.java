package com.kong.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dao.MemberDAO;
import com.kong.dao.Testdao;
import com.kong.dto.BoardDTO;
import com.kong.dto.PageingDTO;

public class BoardEditAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//메인페이지
		String   url     = "board/edit.jsp";

		String   tmp     = request.getParameter("no");
		int      no      = Integer.parseInt(tmp);
		
		         tmp     = request.getParameter("page");
		int      pageNum = Integer.parseInt(tmp);       
		
		String	 keyword = request.getParameter("keyword");
		String	 search  = request.getParameter("search");
		
		PageingDTO paging = new PageingDTO();
		paging.setPage(pageNum);
		paging.setKeyword(keyword);
		paging.setSearch(search);
		
		BoardDAO dao     = BoardDAO.getInstance();
		BoardDTO dto     = new BoardDTO();
		
		dto.setNo(no);
		dto = dao.getSelectOne(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("paging", paging);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
