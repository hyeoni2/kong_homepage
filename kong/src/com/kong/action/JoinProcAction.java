package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.drew.metadata.heif.boxes.PrimaryItemBox;
import com.kong.dao.MemberDAO;
import com.kong.dto.MemberDTO;
import com.kong.dto.ReplyDTO;

public class JoinProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//로그인페이지
		String url   	 = "";
		
		String id    	 = request.getParameter("id");
		String passwd	 = request.getParameter("passwd");
		String name  	 = request.getParameter("name");
		String email 	 = request.getParameter("email");
	
		
		MemberDTO dto    = new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setEmail(email);
		
		MemberDAO dao    = MemberDAO.getInstance();
		int       result = dao.setInsertMember(dto);
		
		if(result == 0) {
			out.println("<script>");
			out.println("alert('회원가입이 실패했습니다.');");
			out.println("location.href = 'Join.do';");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다 로그인해주세요.');");
			out.println("location.href = 'Login.do';");
			out.println("</script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
