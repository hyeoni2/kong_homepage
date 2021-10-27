package com.kong.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kong.dao.MemberDAO;

public class emailCheckAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		System.out.println(email);
		if(email != null) {
			if(email.trim().equals("") == false) {
				
				MemberDAO  dao  = MemberDAO.getInstance();
				String     msg  = dao.idCheck(email);
				
				JSONObject jobj = new JSONObject();
				
				jobj.put("message", msg);
				jobj.put("email", email);
				
				if(jobj.isEmpty()) {
					System.out.println("값이 없다");
				}else {
					System.out.println("값이 있다.");
				}
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jobj);
			}
		}

		return null;
	}

}
