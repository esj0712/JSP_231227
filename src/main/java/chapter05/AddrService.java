package chapter05;

import java.util.ArrayList;

public class AddrService {
	
	//주소록 목록을 관리하기 위한 ArrayList (addrlist)
	ArrayList<AddrBean> addrlist = new ArrayList<>();
	
	//addrlist 주소록 관리 컬렉션에 주고 저장하는 메서드(add)
	public void add(AddrBean ab) {
		addrlist.add(ab); //회원정보 추가
	}
	
	//주소록 목록 전달 메서드
	public ArrayList<AddrBean> getAddrList() {
		return addrlist;
	}
	
	//특정 사용자를 주소록 목록에서 검색하는 메서드(username)
	public AddrBean getAddr(String username) {
		
		for(AddrBean ab:addrlist) {
			if(ab.getUsername().equals(username))//회원 찾기
				return ab; //회원 전달
		}
		return null;
		
	}
	
}
