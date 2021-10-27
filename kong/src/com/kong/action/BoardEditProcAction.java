package com.kong.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dto.BoardDTO;
import com.kong.dto.PageingDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardEditProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//메인페이지
		String url = "";
		
		String attch_path = "C:/sh/workspace_jsp/kong/WebContent/img";
		String upload_path = attch_path+"/boardImg"; 
		int max_upload = 15 * 1024* 1024;
		
		try {
				MultipartRequest multi = new MultipartRequest(
						request,
						upload_path,
						max_upload,
						"UTF-8",
						new DefaultFileRenamePolicy());
				
				
				String tmp       = multi.getParameter("no");
				int    no        = Integer.parseInt(tmp);
				
					   tmp		 = multi.getParameter("page");
				int    pageNum   = Integer.parseInt(tmp);
	
				String keyword 	 = multi.getParameter("keyword");
				String search  	 = multi.getParameter("search");
	
				System.out.println(keyword);
				System.out.println(search);
				
				String type      = multi.getParameter("type");
				String subject   = multi.getParameter("subject");
				String content   = multi.getParameter("content");			
				String board_img = multi.getParameter("boardImg");
			
				
				BoardDAO dao     = BoardDAO.getInstance();
				
				BoardDTO dto     = new BoardDTO();
				dto.setNo(no);
				
				dto              = dao.getSelectOne(dto);
				String original  = dto.getBoard_img();
				
				File f1 = new File(upload_path+"/"+original);
				String imgPath = f1.getPath();
				
				if(imgPath.contains(board_img)) {
					dto.setBoard_img(board_img);
				}else {
					System.out.println("다름");
					f1.delete();
				}

				dto.setType(type);
				dto.setSubject(subject);
				dto.setContent(content);
				dto.setBoard_img(board_img);
				
				int result = dao.setupdateBoard(dto);
	
				if(result == 0) {
					System.out.println("실패");
					out.println("<script>");
					out.println("alert('게시글 수정에 실패했습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}else {
					System.out.println("성공");
					out.println("<script>");
					out.println("location.href = 'BoardRead.do?no="+no+"&page="+pageNum+"&keyword="+keyword+"&search="+search+"';");
					out.println("</script>");
					out.close();
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return null;
	}
	

}
