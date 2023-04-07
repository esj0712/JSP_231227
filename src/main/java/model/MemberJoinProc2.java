package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MProc.do")
public class MemberJoinProc2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberJoinProc2() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MemberDBBean bean=new MemberDBBean();
		bean.setId(request.getParameter("id"));
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		bean.setPass1(pass1);
		bean.setPass2(pass2);
		
		String eamil=request.getParameter("email");
		bean.setEmail(eamil);
		bean.setGender(request.getParameter("gender"));
		bean.setAddress(request.getParameter("address"));
		bean.setPhone(request.getParameter("phone"));
		// 배열로 받아서 하나의 스트림으로 처리
		String arr[]=request.getParameterValues("hobby");
		String data="";
		
		for(String str:arr) {
			data+=str+" "; // 하나의 스트링으로 연결
		}
		bean.setHobby(data);
		bean.setJob(request.getParameter("job"));
		bean.setAge(request.getParameter("age"));
		bean.setInfo(request.getParameter("info"));
		
		if(pass1.equals(pass2)) {
			MemberDAO mdao=new MemberDAO();
			mdao.insertMember(bean);
			
			RequestDispatcher dis=request.getRequestDispatcher("MemberListCon.do");
			dis.forward(request, response);
		}else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다.");
			RequestDispatcher dis=request.getRequestDispatcher("joinError.jsp");
			dis.forward(request, response);
		}
	}
}
