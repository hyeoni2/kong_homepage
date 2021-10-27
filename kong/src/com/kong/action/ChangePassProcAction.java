package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.drew.metadata.heif.boxes.PrimaryItemBox;
import com.kong.dao.MemberDAO;
import com.kong.dto.MemberDTO;

public class ChangePassProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String    url    = "";	
		
		String    id     = request.getParameter("id");
		String    passwd = request.getParameter("newpasswd");

		System.out.println("id = "+id);
		System.out.println("passwd = "+passwd);
		
		MemberDAO dao    = MemberDAO.getInstance();
		MemberDTO dto    = new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		
		int       result = dao.setChangePasswd(dto);

		if(result == 0) {
			System.out.println("실패");
			out.println("<script>");
			out.println("alert('비밀번호 변경에 실패했습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			System.out.println("성공");
			session.invalidate();
			url = "Index.do";
			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다 다시 로그인해주세요.');");
			out.println("location.href = 'Index.do';");
			out.println("</script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return null;
	}

}
