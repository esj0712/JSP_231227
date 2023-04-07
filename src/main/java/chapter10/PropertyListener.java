package chapter10;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class PropertyListener implements ServletContextListener {

    // 실행 메소드
    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContext ctx=sce.getServletContext(); // web.xml 업근 가능한 객체
    	
    	String file=ctx.getInitParameter("propfile");
    	
    	// 지정된 경로에 파일을 속성으로 가져올 수 있는 객체 생성
    	Properties p=new Properties();
    	
    	try {
			p.load(new FileInputStream(file)); // 파일 읽기
		} catch (FileNotFoundException e) {
			
		}catch (IOException e) {
			e.printStackTrace();
		}
    	ctx.setAttribute("prop", p);
    }
	
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	
	
}
