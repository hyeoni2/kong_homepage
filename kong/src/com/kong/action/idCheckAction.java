package com.kong.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kong.dao.MemberDAO;

public class idCheckAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		String id = request.getParameter("id");
		System.out.println(id);
		if(id != null) {
			if(id.trim().equals("") == false) {
				
				MemberDAO  dao  = MemberDAO.getInstance();
				String     msg  = dao.idCheck(id);
				
				JSONObject jobj = new JSONObject();
				
				jobj.put("message", msg);
				jobj.put("id", id);
				
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
