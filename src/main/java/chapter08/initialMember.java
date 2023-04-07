package chapter08;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
/*
@WebListener : servlet-api 라이브러리를 가져오는 애노테이션
웹 어플리케이션 의 시작, 종료에 대한 이벤트 리스너
Member클래스가 호출되는 순간 객체화되어 실행되는 것 
*/
@WebListener
public class initialMember implements ServletContextListener {

    // 시작
    public void contextInitialized(ServletContextEvent sce)  { 
         ServletContext context=sce.getServletContext(); // application 영역의 객체
         ArrayList<Member> datas=new ArrayList<Member>();
         
         for(int i=0; i<=8; i++) {
        	 Member data=new Member("김자바"+i, "test"+i+"@testco.kr");
        	 datas.add(data);
         }
         
         
         datas.add(new Member("금찬혁", null));
         datas.add(new Member("조찬혁", null));
         // application 영역에 저장
         context.setAttribute("members", datas);
         context.setAttribute("member", new Member()); //Member() member=new Member();
         
         
        		 
    }
    // 소멸
    public void contextDestroyed(ServletContextEvent sce)  { 
    	// TODO Auto-generated method stub
    }
	
    
}
