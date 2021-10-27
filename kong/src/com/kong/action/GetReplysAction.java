package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.ReplyDAO;
import com.kong.dao.Testdao;
import com.kong.dto.ReplyDTO;

public class GetReplysAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//메인페이지
		String url = "board/.jsp";		
		
		String tmp      = request.getParameter("board_no");
		int    board_no =Integer.parseInt(tmp);
		  
		 	   tmp      = request.getParameter("page");
		int    page     =Integer.parseInt(tmp);
		
			   tmp      = request.getParameter("no");
		int    no       =Integer.parseInt(tmp);

		String writer   = request.getParameter("writer");
		String content  = request.getParameter("content");
		
		System.out.println("board_no : "+board_no);
		System.out.println("page : "+page);
		System.out.println("no : "+no);
		System.out.println("writer : "+writer);
		System.out.println("content : "+content);
		
		
	
		ReplyDTO dto = new ReplyDTO();
		dto.setBoard_no(board_no);
		dto.setNo(no);
		dto.setWriter(writer);
		dto.setContent(content);
		
		ReplyDAO dao = ReplyDAO.getInstance();
		int result = dao.setInsertReplys(dto);
		if(result == 0) {
			out.println("<script>");
			out.println("alert('댓글등록에 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script>");
			out.println("location.href = 'BoardRead.do?no="+board_no+"&page="+page+"';");
			out.println("</script>");
			out.close();
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return null;
	}

}
