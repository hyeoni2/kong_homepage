package com.kong.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kong.action.AboutAction;
import com.kong.action.Action;
import com.kong.action.ActionForward;
import com.kong.action.BoardDeleteProcAction;
import com.kong.action.BoardEditAction;
import com.kong.action.BoardEditProcAction;
import com.kong.action.BoardListAction;
import com.kong.action.BoardReadAction;
import com.kong.action.ChangePassAction;
import com.kong.action.ChangePassProcAction;
import com.kong.action.DeleteMemberAction;
import com.kong.action.DeleteMemberProcAction;
import com.kong.action.DeleteReplyAction;
import com.kong.action.GetBoarderAction;
import com.kong.action.GetBoarderArgAction;
import com.kong.action.GetReplyAction;
import com.kong.action.GetReplysAction;
import com.kong.action.IndexAction;
import com.kong.action.JoinAction;
import com.kong.action.JoinProcAction;
import com.kong.action.LogOutAction;
import com.kong.action.LoginAction;
import com.kong.action.LoginProcAction;
import com.kong.action.UpdateAction;
import com.kong.action.ViewAction;
import com.kong.action.emailCheckAction;
import com.kong.action.idCheckAction;
import com.kong.action.passwdCheckAction;


@WebServlet("/KongController")
public class KongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KongController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		
		Action action = null; //실제 동작 부분
		ActionForward forward = null; //forward, sendRedirect 설정
		
		String uri = request.getRequestURI(); //컨트롤러까지
		String ctx = request.getContextPath(); //path
		String command = uri.substring(ctx.length()); //path를 뺀 
		
		System.out.println("uri:" +uri);
		System.out.println("ctx:"+ ctx);
		System.out.println("페이지 이동====>"+command);
		
		if(command.equals("/Index.do")) {
			
			action = new IndexAction();
			forward = action.excute(request, response);
	
		//멤버	
		}else if(command.equals("/Login.do")) {
			
			action = new LoginAction();
			forward = action.excute(request, response);
		
		}else if(command.equals("/LoginProc.do")) {
			
			action = new LoginProcAction();
			forward = action.excute(request, response);	

		}else if(command.equals("/Logout.do")) {

			action = new LogOutAction();
			forward = action.excute(request, response);	
		
		}else if(command.equals("/Join.do")) {
			
			action = new JoinAction();
			forward = action.excute(request, response);
		
		}else if(command.equals("/JoinProc.do")) {
			
			action = new JoinProcAction();
			forward = action.excute(request, response);
		}else if(command.equals("/idCheck.do")) {

			action = new idCheckAction();
			forward = action.excute(request, response);

		}else if(command.equals("/emailCheck.do")) {
		
			action = new emailCheckAction();
			forward = action.excute(request, response);
	
		}else if(command.equals("/passwdCheck.do")) {

			action = new passwdCheckAction();
			forward = action.excute(request, response);
		
		
		}else if(command.equals("/View.do")) {
		
			action = new ViewAction();
			forward = action.excute(request, response);
			
		}else if(command.equals("/Update.do")) {

			action = new UpdateAction();
			forward = action.excute(request, response);
			
		}else if(command.equals("/ChangePass.do")) {
	
			action = new ChangePassAction();
			forward = action.excute(request, response);
			
		}else if(command.equals("/ChangePassProc.do")) {
			
			action = new ChangePassProcAction();
			forward = action.excute(request, response);

		}else if(command.equals("/DeleteMember.do")) {

			action = new DeleteMemberAction();
			forward = action.excute(request, response);
		
		}else if(command.equals("/DeleteMemberProc.do")) {

			action = new DeleteMemberProcAction();
			forward = action.excute(request, response);	
		
		
		//about
		}else if(command.equals("/About.do")) {
	
			action = new AboutAction();
			forward = action.excute(request, response);	
		
		
		//board
		}else if(command.equals("/BoardList.do")) {
					
			action = new BoardListAction();
			forward = action.excute(request, response);		
		
		}else if(command.equals("/GetBoarder.do")) {
			
			action = new GetBoarderAction();
			forward = action.excute(request, response);		
			
		}else if(command.equals("/GetBorderArg.do")) {

			action = new GetBoarderArgAction();
			forward = action.excute(request, response);		
			
		}else if(command.equals("/BoardRead.do")) {
			
			action = new BoardReadAction();
			forward = action.excute(request, response);		
			
		}else if(command.equals("/BoardEdit.do")) {

			action = new BoardEditAction();
			forward = action.excute(request, response);		
		
		}else if(command.equals("/EditProc.do")) {
			
			action = new BoardEditProcAction();
			forward = action.excute(request, response);	

		}else if(command.equals("/BoardDelete.do")) {

			action = new BoardDeleteProcAction();
			forward = action.excute(request, response);	
		}
	
		
		
		/*  reply  */
		else if(command.equals("/ReplyGetReply.do")) {

			action = new GetReplyAction();
			forward = action.excute(request, response);	

		}else if(command.equals("/ReplyGetReplys.do")) {
			
			action = new GetReplysAction();
			forward = action.excute(request, response);	
			
		}else if(command.equals("/DeleteReply.do")) {
			
			action = new DeleteReplyAction();
			forward = action.excute(request, response);	

		}
		
		
		//공통 분기작업(페이지 이동)
		if(forward !=null) {
			if(forward.isRedirect()) {//true :sendRedirect방식   //fasle 담김
				response.sendRedirect(forward.getPath());
			}else {
				//false : forward방식
				//목적지 : index.jsp
				//이동수단 : forward
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
		
	
	}

}
