package chapter05;

public class CalcBean {

	private int num1, num2;
	private String operator="";
	private int result;
	
	// 계산기능의 메서드
	public void calclate() {
		if(operator.equals("+")) {
			result = num1+num2;
		}else if(operator.equals("-")) {
			result = num1-num2;
		}else if(operator.equals("*")) {
			result = num1*num2;
		}else if(operator.equals("/")) {
			result = num1/num2;
		}
	}
	
	
	public int getResult() {
		return result;
	}
	// sertter
	public void setResult(int result) {
		this.result = result;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public void setOperator(String operator) {
		System.out.println("## "+operator);
		this.operator = operator;
	}
	
	
}	
