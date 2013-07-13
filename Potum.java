import java.util.Scanner;

/**
 * 
 */

/**
 * @author Tarnum
 *
 */
public class Potum {
	
	public int PI_ITER = 12;
	public int TRIG_ITER = 12;
	public double TOL = 1e-15;

	/**
	 * @param args Main Method Command line arguments
	 */
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Enter the value of radius: ");
		float r = input.nextFloat();
		System.out.println("Calculated Length: "+new Potum().potumCalc(r));
	}
	
	public float potumCalc(float r) {
		float pi = calcPi();
		float a = solve(0, 2*pi);
		System.out.println("Calculated alpha value: "+a);
		float l = -2 * r * lCos(a/2);
		return l;
	}
	
	public float pow(float base, float exp) {
		float ret = 1;
		float b = base;
		float e = exp;
		
		while (e > 0) {
			// optimize around b ^ (2 * n) === (b * b) ^ n
			if (e % 2 == 0) {
				e /= 2;
				b *= b;
			} else {
				e -= 1;
				ret *= b;
			}
		}
		return ret;
	}

	public int fact(int x) {
		int ret = 1;
		int xx = x;
		while(xx > 0) {
			ret *= xx;
			xx -= 1;
		}
		return ret;
	}

	public float calcPi() {
		float ret = 0;
		int i = PI_ITER;
	      while (i != 0) {
	          i -= 1;
	          // terms are from the Bailey-Borwein-Plouffe forumla for PI
	          ret += 1 / pow(16, i) * (
	            4 / (8 * i + 1) - 2 / (8 * i + 4) -
	            1 / (8 * i + 5) - 1 / (8 * i + 6));
	        }
		return ret;
	}

	public float lSin(float x) {
		float ret = 0 ;
		int i = TRIG_ITER;
	      while (i > 1) {
	          i -= 1;
	          ret += pow(-1, i) * pow(x, (2 * i) + 1) / fact((2 * i) + 1);
	        }
		return ret;
	}

	public float lCos(float x) {
		float ret = 0;
		int i = TRIG_ITER;
	      //loop in reverse to reduce errors
	      while (i > 1) {
	        i -= 1;
	        ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i);
	      }		
		return ret;
	}
	
	public float f(float a) {
		return lSin(a) + (calcPi() / 2);
	}
	
	public float solve(float ll, float hh) {
		float l = ll;
		float h = hh;
		float m = 0;
		
		while(true) {
			// find the mid point
	        m = (l + h) / 2;
	        
			// check for tolerance and eqn(m)=0
	        if (m == l || m == h)
	            return m;

	        //solve f at two points
	        float x = f(l);
	        float y = f(m);	        
	        

			// new interval if x and y have same sign
	        if (x < 0 == y < 0)
	            l = m;
	          else
	            h = m;
	        
		}

	}




}
