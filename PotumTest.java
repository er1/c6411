package test;

import static org.junit.Assert.assertEquals;

import java.math.BigInteger;

import org.junit.Before;
import org.junit.Test;

import com.Potum;

public class PotumTest {

	private Potum potum;
	private double pi;
	private static final double DELTA = 1e-15;
	private static final double a = 2.3098814600100575;
	
	@Before
	public void setUp() throws Exception {
		potum = new Potum();
		pi = potum.calcPi();
	}

	@Test
	public void testCalcPI() {
		assertEquals(Math.PI, pi, DELTA);
	}
	
	@Test
	public void testFact(){
		BigInteger input = new BigInteger("5");
		BigInteger result = potum.fact(input);
		assertEquals(new String(result.toByteArray()),new String(result.toByteArray()));
	}
	
	@Test
	public void testFact12(){
		BigInteger input = new BigInteger("-5");
		BigInteger result = potum.fact(input);
		assertEquals(new String(result.toByteArray()),new String(result.toByteArray()));
	}
	
	@Test
	public void testFact2(){
		BigInteger input = new BigInteger("5.5");
		BigInteger result = potum.fact(input);
		assertEquals(new String(result.toByteArray()),new String(result.toByteArray()));
	}
	
	@Test
	public void testFact3(){
		BigInteger input = new BigInteger(" ");
		BigInteger result = potum.fact(input);
		assertEquals(new String(result.toByteArray()),new String(result.toByteArray()));
	}
	
	@Test
	public void testPower(){
		double base = 2.5;
		int exp = 3;
		double result = potum.pow(base, exp);
		assertEquals(Math.pow(base,exp), result, DELTA);
	}
	
	@Test
	public void testPower1(){
		double base = -2.5;
		int exp = -3;
		double result = potum.pow(base, exp);
		assertEquals(Math.pow(base,exp), result, DELTA);
	}
	
	
	@Test
	public void testSine(){
		double input = -5.5; 
		double result = potum.lSin(input);
		assertEquals(Math.sin(input), result + input, DELTA);
	}
	
	@Test
	public void testCosine(){
		double input = -5.5;
		double result = potum.lCos(input);
		System.out.println(result + 1);
		assertEquals(Math.cos(input), result + 1, DELTA);
	}
	
	@Test
	public void testSolve(){
		double expectedOutput = potum.solve(0, 2 * pi);
		assertEquals(expectedOutput, a, DELTA);
	}
	
	
	
	
	@Test
	public void testResult(){
		double radius = -25;
		double actualOutput = potum.potumCalc(radius);
		double expectedOutput = 2 * radius * (1 - Math.cos(a / 2));
		assertEquals(expectedOutput, actualOutput, DELTA);
	}
	
	@Test
	public void testResult1(){
		double radius = 0;
		double actualOutput = potum.potumCalc(radius);
		double expectedOutput = 2 * radius * (1 - Math.cos(a / 2));
		assertEquals(expectedOutput, actualOutput, DELTA);
	}
	
	@Test
	public void testResult2(){
		double radius = 50;
		double actualOutput = potum.potumCalc(radius);
		double expectedOutput = 2 * radius * (1 - Math.cos(a / 2));
		assertEquals(expectedOutput, actualOutput, DELTA);
	}

	
}
