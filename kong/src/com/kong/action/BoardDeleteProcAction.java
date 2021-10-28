package com.kong.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dao.MemberDAO;
import com.kong.dao.ReplyDAO;
import com.kong.dao.Testdao;
import com.kong.dto.BoardDTO;
import com.kong.dto.ReplyDTO;

public class BoardDeleteProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String  attch_path  = "C:/sh/workspace_jsp/kong/WebContent/img";
		String  upload_path = attch_path+"/boardImg"; 

		String   url        = "";

		String   tmp        = request.getParameter("no");
		int      no  		= Integer.parseInt(tmp);
		
		BoardDAO dao 	    = BoardDAO.getInstance();
		BoardDTO dto        = new BoardDTO();
		dto.setNo(no);
		
		dto = dao.getSelectOne(dto);
		String delete_img = dto.getBoard_img();
		
		File f1 = new File(upload_path + "/" + delete_img);
		f1.delete();
		
		int result = dao.setDeleteBoard(no);
		
		if(result == 0) {
			System.out.println("실패");
			out.println("<script>");
			out.println("alert('게시글 삭제에 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			System.out.println("성공");
			ReplyDAO replyDao = ReplyDAO.getInstance();
			replyDao.setReplyDeleteBoardNo(no);
			out.println("<script>");
			out.println("location.href = 'BoardList.do';");
			out.println("</script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return null;
	}

}
