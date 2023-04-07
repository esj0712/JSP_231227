package chapter11;

public class MemberDBBean {
	
	private String id;
	private String pass;
	private String email;
	private String phone;
	private String address;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}

/*
- VO(Value Object) : 변경없이 값으로 취급하는 객체(Read-Only)
- DTO(Data Transfer Object) : view -> Controller -> Service(메소드) -> DAO
절차에서 데이터를 조작할수 있게 전송해주는 역할(Getter, Setter)
- Bean : Spring에서 Database를 지칭하는 용어이다.
		 데이터베이스 관리 및 제어
*/