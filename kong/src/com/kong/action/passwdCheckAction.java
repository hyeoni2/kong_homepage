package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.drew.metadata.heif.boxes.PrimaryItemBox;
import com.kong.dao.MemberDAO;
import com.kong.dto.MemberDTO;

public class passwdCheckAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id     = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		System.out.println("id = "+id);
		System.out.println("passwd = "+passwd);
	
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);

		MemberDAO dao = MemberDAO.getInstance();
		dto = dao.PasswdCheck(dto);
		String    msg = null;
		
		
		if(dto != null) {
			System.out.println("회원 맞음");
			msg = "1";
		}else {
			System.out.println("회원 아님");
			msg = "-1";
		}
		
		JSONObject jobj = new JSONObject();
		
		jobj.put("message", msg);
		jobj.put("id", id);
		jobj.put("passwd", passwd);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jobj);
		

		
		return null;
	}

}
