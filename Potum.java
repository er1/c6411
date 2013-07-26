/*-----------------------------------------------------------------------
 *  COMP 6411: COMPARATIVE STUDY OF PROGRAMMING LANGUAGES: SECTION CC
 *  (SUMMER 2013)
 *  POTUM: THE BEVERAGE COASTER PROJECT
 *  Author:        Tarnum Sharma
 *  Student Id.:   6768946
 *  Last updated:  07/25/2013
 *
 *  Compilation:   javac potum.java
 *  Execution:     java potum
 *-----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
 *  Note : Enter a positive value of Radius and it cannot be an alphabet.
 *-----------------------------------------------------------------------*/



import java.math.BigInteger;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Tarnum Sharma
 * this defines a class Potum
 * @param r (input radius)
 * @return (length)
 *
 */
public class Potum {
	// Number of terms to iterate over PI formulae to get exact value of pi constant
	public int PI_ITER = 12;
	// Number of terms to iterate over sine/cosine functions
	public int TRIG_ITER = 12;

	/**
	 * @param args Main Method Command line arguments
	 */
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Enter the value of radius: ");
		double r = 0;
		try {
			r = input.nextDouble();
			if (r < 0) {
				System.out.println("Input radius value should be positive.");
				return;
			}
		} catch (InputMismatchException e) {
			System.out.println("Input radius value cannot be a character.");
			return;
		}

		System.out.println("Calculated Length: " + new Potum().potumCalc(r));
	}

	public double potumCalc(double r) {
		double pi = calcPi();
		System.out.println("Calculated pi value: " + pi);
		double a = solve(0, 2 * pi);
		System.out.println("Calculated alpha value: " + a);
		double l = -2 * r * lCos(a / 2);
		return l;
	}
	
	/**
     * Calculates the value of the first argument raised to the power of the second argument.
     * @param base - Base number
     * @param exp - exponent number
     * @return - base^^exp
     */
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

	/**
     * Calculates factorial of given number
     * @param x - Number
     * @return - factorial value of x
     */
	public BigInteger fact(BigInteger x) {
		BigInteger ret = BigInteger.ONE;
		while (x.compareTo(BigInteger.ZERO) > 0) {
			ret = ret.multiply(x);
			x = x.subtract(BigInteger.ONE);
		}
		return ret;
	}

    /**
     * Calculates the value of constant PI
     * @return - pi value
     */
	
	public double calcPi() {
		double ret = 0;
		int i = PI_ITER;
		while (i != 0) {
			i -= 1;
			// terms are from the Bailey-Borwein-Plouffe forumla for PI
			ret += (1.0 / pow(16, i))
					* (4.0 / (8 * i + 1) - 2.0 / (8 * i + 4) - 1.0
							/ (8 * i + 5) - 1.0 / (8 * i + 6));
		}
		return ret;
	}

	/**
     * Calculates value using modified sine function
     * @param x - the input number to which sine has to be calculated
     * @return - modified sine value of x
     */
	public double lSin(double x) {
		double ret = 0;
		int i = TRIG_ITER;
		while (i > 1) {
			i -= 1;
			int xx = (2 * i) + 1;
			BigInteger yy = new BigInteger(String.valueOf(xx));
			ret += pow(-1, i) * pow(x, (2 * i) + 1) / fact(yy).doubleValue();
		}
		return ret;
	}

	
	/**
     * Calculates value using modified cosine function
     * @param x - the input number to which cosine has to be calculated
     * @return - modified cosine value of x
     */
	public double lCos(double x) {
		double ret = 0;
		int i = TRIG_ITER;
		// loop in reverse to reduce errors
		while (i > 1) {
			i -= 1;
			int xx = (2 * i);
			BigInteger yy = new BigInteger(String.valueOf(xx));
			ret += (Double) (pow(-1, i) * pow(x, 2 * i) / fact(yy)
					.doubleValue());
		}
		return ret;
	}
	
	

    /**
     * function used to solve alpha (a) (simplified to reduce truncation errors)
     * @param a - Alpha angle
     * @return value
     */
	public double f(double a) {
		return lSin(a) + (calcPi() / 2);
	}
	
	
	
	 /**
     * Bisection method implementation to solve the zero for function f in the range of [l, h]
     * @param low - Lower bound value
     * @param high - Higher bound value
     * @return - Alpha angle value
     */

	public double solve(double low, double high) {
		double l = low;
		double h = high;
		double m = 0;

		while (true) {
			// find the mid point
			m = (l + h) / 2;

			// check for tolerance and eqn(m)=0
			if (m == l || m == h)
				return m;

			// solve f at two points
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
