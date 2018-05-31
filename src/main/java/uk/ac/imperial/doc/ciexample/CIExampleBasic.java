package uk.ac.imperial.doc.ciexample;

import java.util.Arrays;
import java.util.List;

public class CIExampleBasic {

	private List<String> _actions = Arrays.asList("add", "sub");
	private String action = "";
	private int a, b;
	
	public CIExampleBasic() { }
	
	public CIExampleBasic(String[] args) { 
		if(args.length != 3) {
			printUsage();
		}
		this.action = args[0];
				
		if(!_actions.contains(this.action)) {
			printUsage();
		}
		
		this.a = Integer.parseInt(args[1]);
		this.b = Integer.parseInt(args[2]);	
	}
	
	public void setParams(String a, String b, String action) {
		this.a = Integer.parseInt(a);
		this.b = Integer.parseInt(b);
		this.action = action;
	}
	
	public int runAction() {
		int result = 0;
		if(action.equals("add")) {
			result = add(a, b);
		}
		else if(action.equals("sub")) {
			result = sub(a, b);
		}
		return result;
	}
		
	public int add(int a, int b) {
		return a + b;
	}
	
	public int sub(int a, int b) {
		return a - b;
	}

	public static void main(String[] args) {
		CIExampleBasic basic = new CIExampleBasic(args);
		int result = basic.runAction();
		System.out.println("Result is: " + result);
	}
	
	public void printUsage() {
		System.err.println("Usage: CIExampleBasic <action> <value a> <value b>");
		System.err.println("\t\t<action> can be one of: " + _actions);
		System.exit(-1);
	}
}
