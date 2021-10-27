package com.kong.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dao.MemberDAO;
import com.kong.dao.ReplyDAO;
import com.kong.dao.Testdao;
import com.kong.dto.BoardDTO;
import com.kong.dto.PageingDTO;
import com.kong.dto.ReplyDTO;

public class BoardReadAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//메인페이지
		String   url     = "board/view.jsp";

		String   tmp     = request.getParameter("no");
		int      no      = Integer.parseInt(tmp);

		         tmp     = request.getParameter("page");
		int      pageNum = Integer.parseInt(tmp);
		
		BoardDAO dao     = BoardDAO.getInstance();
		
		int      result  = dao.updateSearchNum(no);
		
		String	 keyword      = request.getParameter("keyword");
		String	 search     = request.getParameter("search");
		
		PageingDTO paging = new PageingDTO();
		paging.setPage(pageNum);
		paging.setKeyword(keyword);
		paging.setSearch(search);
		
		ReplyDTO replyDto = new ReplyDTO();
		replyDto.setBoard_no(no);
		
		ReplyDAO replyDao = ReplyDAO.getInstance();
		List<ReplyDTO> list = new ArrayList<>();
		int count = replyDao.CountReply(replyDto);
		list = replyDao.SelectReplyAll(replyDto);
		System.out.println(list.size());

		if(result > 0) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("실패");
		}
		
		
		BoardDTO  dto = new BoardDTO();
		dto.setNo(no);
		dto = dao.getSelectOne(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("paging", paging);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
