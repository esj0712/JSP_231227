package chapter02;

public class Calc {

	int result=0;
	
	public Calc(int num1, int num2, String op) {
		
		if(op.equals("+")) {
			result=num1+num2;
		}else if(op.equals("-")){
			result=num1-num2;
		}else if(op.equals("*")){
			result=num1*num2;
		}else if(op.equals("/")){
			result=num1/num2;
		}	
		
		
	}//Calc

	

	public int getResult() {
		// TODO Auto-generated method stub
		return result;
	}
	
	
	
}
