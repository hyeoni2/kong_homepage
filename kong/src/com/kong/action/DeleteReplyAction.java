package com.kong.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.kong.dao.MemberDAO;
import com.kong.dao.ReplyDAO;
import com.kong.dto.MemberDTO;
import com.kong.dto.ReplyDTO;

public class DeleteReplyAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out     = response.getWriter();
		HttpSession session = request.getSession();
		
		//메인페이지
		String      url 	= "";
		
		String 		msg  = "";
		
		String 		tmp  = request.getParameter("no");
		int 		no   = Integer.parseInt(tmp);

		ReplyDAO    dao  = ReplyDAO.getInstance();
		
		ReplyDTO    dto  = new ReplyDTO();
		dto.setNo(no);
		
		dto = dao.SelectReplyPno(no);
		int indent = dto.getIndent();
		int grp_num = dto.getGrp_num();
		
		
		int result = 0;
		
		if(indent == 0) {
			dto.setGrp_num(grp_num);
			
			result = dao.setReplyDelete_p(grp_num);
			
		}else {
			result = dao.setReplyDelte(no);
		}
					

		JSONObject  jobj = new JSONObject();
		
		
		if(result == 0) {
			msg = "-1";
		}else {
			msg = "1";
		}
		
		jobj.put("message", msg);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jobj);
		
		return null;
	}

}
