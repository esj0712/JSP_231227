package chapter01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 관련 애너테이션 설정
@WebServlet(description = "처음 만드는 서블릿", urlPatterns = {"/HelloworldServlet"})
public class HelloworldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 컨텐츠 타입 선언
		// 한글 설정
		response.setContentType("text/html; charset=UTF-8");
		// 웹 브라우저 출력을 위한 PrintWriter 객체 확보
		PrintWriter out=response.getWriter();
		// HTML 형식으로 브라우저 출력 컨텐츠 작성
		out.println("<HTML>");
		out.println("<HEAD><TITLE>Hello World Servlet</TITLE></HEAD>");
		out.println("<BODY><H2>Hello World Servlet:헬로월드</H2></BODY>");
		out.println("<HTML>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
