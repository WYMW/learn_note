/*************************************************************************
	> File Name: StringDemo.java
	> Author: Barry
	> Created Time: Fri Oct 11 20:39:33 2019
 ************************************************************************/
public class StringDemo {
	public static void main(String [] args) {
		System.out.println(add());
		System.out.println(add(1, 2, 3, 4));
		System.out.println(add(new int[]{1, 2, 3, 4}));
		for(int i : new int[]{1,2 ,3 ,4 ,5, 6, 7}){
			System.out.println(i);
		}
		Point<Integer> p = new Point<Integer>();
		p.setX(100);
		System.out.println(p.getX());
	}

	public static int add(int ... data) {
		
		int sum = 0;
		for(int i = 0; i < data.length; i++){
			sum += data[i];
		}

		return sum;
	}
}

class Point<T extends Number> {
  
	private T x;
	public T getX() {
	  return this.x;
	}
	public void setX(T x) {
	  this.x = x;
	} 
}
