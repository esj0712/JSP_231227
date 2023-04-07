package chapter10;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

@WebFilter("*.jsp")
public class EndFilter extends HttpFilter implements Filter {
       
	private String encoding;
	
	
	 /*
	 public EndFilter() {
	 
	 
	 }
	 
	 public void destroy() {
	 
	 }
	 */
	
	// 시작
	// 이미 초기화 되어있는 encoding값을 읽어와서 캐릭터를 설정
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = fConfig.getServletContext().getInitParameter("encoding"); // utf-8
	}

	// 필터 활용 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 캐릭터 인코딩이 없을경우
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(encoding);
			chain.doFilter(request, response); // 필터 실행
		}
		
	}


}
