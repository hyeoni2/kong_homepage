package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kong.dao.MemberDAO;
import com.kong.dto.MemberDTO;

public class DeleteMemberProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out     = response.getWriter();
		HttpSession session = request.getSession();
		
		//메인페이지
		String      url 	= "";
		
		String 		passwd  = request.getParameter("passwd");
		
		System.out.println("passwd"+passwd);
		
		MemberDAO 	dao 	= MemberDAO.getInstance();
		MemberDTO 	dto 	= new MemberDTO();
		dto.setPasswd(passwd);
		
		int 		result  = dao.DeleteMember(dto);
		
		if(result == 0) {
			out.println("<script>");
			out.println("alert('회원탈퇴에 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			session.invalidate();
			out.println("<script>");
			out.println("alert('회원탈퇴가 완료되었습니다.');");
			out.println("location.href = 'Index.do';");
			out.println("</script>");
			out.close();
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
