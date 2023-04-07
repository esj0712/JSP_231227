package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO mdao=new MemberDAO();
		// 모든 회원의 정보 가져오기
		Vector<MemberDBBean> v=mdao.allSelectMember();
		request.setAttribute("vec", v);
		// 웹상에서 서버로
		RequestDispatcher dis= request.getRequestDispatcher("MemberList.jsp");
		dis.forward(request, response);
		
	}
}
