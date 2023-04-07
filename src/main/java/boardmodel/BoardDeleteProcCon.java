package boardmodel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pass=request.getParameter("pass");
		String password=request.getParameter("password");
		
		if(pass.equals(password)) {
			BoardDAO bdao=new BoardDAO();
			bdao.DeleteBoard(num);
			
			RequestDispatcher dis=request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}else {
				request.setAttribute("msg", "1");
				RequestDispatcher dis=request.getRequestDispatcher("BoardListCon.do");
				dis.forward(request, response);
			
		}
		
	}
}
