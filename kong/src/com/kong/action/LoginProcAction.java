package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.drew.metadata.heif.boxes.PrimaryItemBox;
import com.kong.dao.MemberDAO;
import com.kong.dto.MemberDTO;

public class LoginProcAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String id     = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		System.out.println(id);
		System.out.println(passwd);

		MemberDAO dao = MemberDAO.getInstance();
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		
		String 	  msg = null;
		
		dto = dao.LoginCheck(dto);
		if(dto != null) {
			session.removeAttribute("user");
			System.out.println("로그인 성공");
			session.setAttribute("user", dto);
			session.setMaxInactiveInterval(-1);
			msg = "1";
		}else {
			System.out.println("로그인 실패");
			msg = "-1";
		}
		
		JSONObject jobj = new JSONObject();
		jobj.put("message", msg);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jobj);


		return null;
	}

}
