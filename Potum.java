import java.math.BigInteger;
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

	/**
	 * @param args Main Method Command line arguments
	 */
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Enter the value of radius: ");
		double r = input.nextDouble();
		System.out.println("Calculated Length: "+new Potum().potumCalc(r));
	}
	
	public double potumCalc(double r) {
		double pi = calcPi();
		System.out.println("Calculated pi value: "+pi);
		double a = solve(0, 2*pi);
		System.out.println("Calculated alpha value: "+a);
		double l = -2 * r * lCos(a/2);
		return l;
	}
	
	public double pow(double base, int exp) {
		double ret = 1;
		double b = base;
		int e = exp;
		
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


	public BigInteger fact(BigInteger x) {
		BigInteger ret = BigInteger.ONE;
		//double xx = x;
		while(x.compareTo(BigInteger.ZERO) > 0) {
			ret = ret.multiply(x);
			x = x.subtract(BigInteger.ONE);
		}
		return ret;
	}

	
	public double calcPi() {
		double ret = 0;
		int i = PI_ITER;
	      while (i != 0) {
	          i -= 1;
	          // terms are from the Bailey-Borwein-Plouffe forumla for PI
	          ret += (1.0 / pow(16, i)) * (
	            4.0 / (8 * i + 1) - 2.0 / (8 * i + 4) -
	            1.0 / (8 * i + 5) - 1.0 / (8 * i + 6));
	        }
		return ret;
	}

	public double lSin(double x) {
		double ret = 0 ;
		int i = TRIG_ITER;
	      while (i > 1) {
	          i -= 1;
	          int xx = (2 * i) + 1;
	          BigInteger yy = new BigInteger(String.valueOf(xx));
	          ret += pow(-1, i) * pow(x, (2 * i) + 1) / fact(yy).doubleValue();
	        }
		return ret;
	}

	public double lCos(double x) {
		double ret = 0;
		int i = TRIG_ITER;
	      //loop in reverse to reduce errors
	      while (i > 1) {
	        i -= 1;
	        int xx = (2 * i);
	        BigInteger yy = new BigInteger(String.valueOf(xx));
	        ret += (Double)(pow(-1, i) * pow(x, 2 * i) / fact(yy).doubleValue());
	      }		
		return ret;
	}
	
	public double f(double a) {
		return lSin(a) + (calcPi() / 2);
	}
	
	public double solve(double ll, double hh) {
		double l = ll;
		double h = hh;
		double m = 0;
		
		while(true) {
			// find the mid point
	        m = (l + h) / 2;
	        
			// check for tolerance and eqn(m)=0
	        if (m == l || m == h)
	            return m;

	        //solve f at two points
	        double x = f(l);
	        double y = f(m);	        
	        

			// new interval if x and y have same sign
	        if (x < 0 == y < 0)
	            l = m;
	          else
	            h = m;
	        
		}

	}



}
