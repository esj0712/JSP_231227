package boardmodel;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한 화면에 보여지는 게시글의 숫자 = 10개
		int pageSize=10;
		// 현재 보여지는 페이지 번호 [1][2][3]
		String pageNum=request.getParameter("pageNum");
		// pageNum의 null처리
		if(pageNum==null) {
			pageNum="1"; // 최신 글을 받아옴 [1]
		}
		
		// 총 게시글의 갯수를 지정
		int count=0;
		// 화면에 보여지는 글번호 숫자의 위치 [1][2]
		int number=0;
		// 페이지번호 형변환
		int currentPage=Integer.parseInt(pageNum);
		
		// DAO객체 
		BoardDAO bdao=new BoardDAO();
		// 총 게시글의 갯수를 반환해주는 메소드
		count=bdao.getallcount();
		//-----------------------------------------------------
		// 현재 보여지는 페이지의 시작번호
		// 첫번째블럭 : [1] ~[10] : (1-1)*10+1
		// 두번째블럭 : [11]~[21] : (2-1)*10+1
		// 세번째블럭 : [21]~[31] : (3-1)*10+1
		int startRow=(currentPage-1)*pageSize+1;
		// 1*10=10, 2*10=20
		int endRow=currentPage*pageSize;
		// 최신글 10개 기준으로 게시글 리턴하는 메소드를 호출
		Vector<BoardDTO> v=bdao.getAllBoard(startRow, endRow);
		//-----------------------------------------------------
		// 전체가 9개의 게시글일때 => 9-(1-1)*10=9
		// 전체가 11개의 게시글일때 => 11-(2-1)*10=1
		// 전체가 23개의 게시글일때 => 23-(3-1)*10=3
		number=count-(currentPage-1)*pageSize;
		
		// 수정, 삭제 비번 일치여부를 메세지로 처리
		String msg=(String)request.getAttribute("msg");
		
		// jsp페이지로 이동전에 데이터 저장
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("msg", msg);
		request.setAttribute("v", v);
		
		RequestDispatcher dis= request.getRequestDispatcher("BoardList.jsp");
		dis.forward(request, response);
		
	}
}
