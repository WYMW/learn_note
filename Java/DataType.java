/*************************************************************************
	> File Name: DataType.java
	> Author: barry
*/
class DataType {
	public static void main(String [] args){
		Integer a = 40;
		Integer b = 40;
		System.out.println(a == b);

		Integer c = new Integer(20);
		Integer d = new Integer(20);
		System.out.println(c == d);

		Integer e = Integer.valueof(30);
		Integer f = Integer.valueof(30);
		System.out.println(e == f);
	}
}
