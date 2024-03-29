package boardmodel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bdao=new BoardDAO();
		// Update할 데이터를 가져옴
		BoardDTO bean=bdao.getOneUpdateBoard(num);
		
		request.setAttribute("bean", bean);
		
		RequestDispatcher dis=request.getRequestDispatcher("BoardUpdateform.jsp");
		dis.forward(request, response);
		
		
	}
}
