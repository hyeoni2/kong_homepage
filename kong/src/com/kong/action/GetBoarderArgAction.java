package com.kong.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kong.dao.BoardDAO;
import com.kong.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class GetBoarderArgAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//메인페이지
		String url         = "";
		
		String attch_path  = "C:/sh/workspace_jsp/kong/WebContent/img";
		String upload_path = attch_path+"/boardImg"; 
		int    max_upload  = 15 * 1024* 1024;
		
		//디렉토리 존재하지 않으면
		File   isDir       = new File(upload_path);	
		if(!isDir.exists()) {
			try {
				  System.out.println("디렉토리가 존재하지 않습니다.");
				  isDir.mkdirs();
				
			} catch (Exception e) {
				  System.out.println("오류");
				  e.printStackTrace();
			}
		}
		
		try {
			  MultipartRequest multi = new MultipartRequest(
					  request,
					  upload_path,
					  max_upload,
					  "UTF-8",
					  new DefaultFileRenamePolicy());
			
			  String   type      = multi.getParameter("type");
			  String   writer    = multi.getParameter("writer");
			  String   subject   = multi.getParameter("subject");
			  String   content   = multi.getParameter("content");			
			  String   board_img = multi.getFilesystemName("board_img");

			  if(board_img == null) {
				  board_img = "-";
			  }
			  
			  int      searchNum = 0;
			
			  BoardDAO dao	   = BoardDAO.getInstance();
			  BoardDTO dto 	   = new BoardDTO();
			  dto.setType(type);
			  dto.setWriter(writer);
			  dto.setSubject(subject);
			  dto.setContent(content);
			  dto.setBoard_img(board_img);
			  dto.setSearchNum(searchNum);
			
			
			int result = dao.setInsertBoard(dto);
				if(result == 0) {
						System.out.println("실패");
						out.println("<script>");
						out.println("alert('게시글 등록에 실패했습니다.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
				}else {
						System.out.println("성공");
						out.println("<script>");
						out.println("location.href = 'BoardList.do';");
						out.println("</script>");
						out.close();
				}
				
		} catch (Exception e) {
			  System.out.println("에러가 났어..");
			  e.printStackTrace();
			
		}

		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return null;
	}

}
