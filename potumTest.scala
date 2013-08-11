
import scala.math.BigInt.int2bigInt
import org.junit.Test
import junit.framework.Assert.assertEquals

class potumTest extends potum {

  @Test def testFactPositive() {
    val actual: BigInt = po.fact(5);
    val i: BigInt = 120;
    assertEquals(actual, i);

  };

  @Test def testFactNegative() {
    val actual: BigInt = po.fact(-5);
    val i: BigInt = 1;
    assertEquals(actual, i);
  };

  @Test def testFactDouble() {
    val temp: BigInt = BigInt("5");
    val actual = po.fact(temp);
    val expected = 120;
    assertEquals(expected, actual);
  };

  @Test def testFactNull() {
    val t: BigInt = Double.NaN.toInt;
    val actual = po.fact(t);
    val expected = 1;
    assertEquals(expected, actual);
  };

  @Test def testFactString() {
    val temp: BigInt = BigInt("1");
    val actual = po.fact(temp);
    val expected = 1;
    assertEquals(expected, actual);
  };

  @Test def testPi() {
    val actual: Double = po.calcpi();
    val expected: Double = Math.PI;
    assertEquals(expected, actual);
  };

  @Test def testPowPositive() {
    val result: Double = po.pow(2, 3);
    val expected: Double = 8;
    assertEquals(expected, result);
  };
  @Test def testPowNegative() {
    val result: Double = po.pow(-2, -2);
    val expected: Double = 1.0;
    assertEquals(expected, result);
  };

  @Test def testPowNegativeA() {
    val result: Double = po.pow(-2, 2);
    val expected: Double = 4;
    assertEquals(expected, result);
  };
  @Test def testPowNull() {
    val t: Double = Double.NaN;
    val result = po.pow(t, 3);
    val expected = t;
    assertEquals(expected, result);
  };

  

  @Test def testLSinNegative() {
    var x = -2;
    var result = po.lsin(x) + x;
    var expected = Math.sin(x);
    assertEquals(expected, result);
  };
  @Test def testLSinPositive() {
    var x = 2;
    var result = po.lsin(x) + x;
    var expected = 0.9092974268256817;
    assertEquals(expected, result);
  };
  @Test def testLSinZero() {
    var x = 0;
    var result = po.lsin(x) + x;
    var expected = 0.0;
    assertEquals(expected, result);
  };

  @Test def testLSinNull() {
    val t: Double = Double.NaN;
    var x = null;
    var result = po.lsin(t) + x;
    var expected = t;
    assertEquals(expected, result);
  };

  @Test def testLSinDouble() {
    var x = 1.2345;
    var t: Double = x.toDouble;
    var result = po.lsin(t) + x;
    var expected =0.9439833239445112;
    assertEquals(expected, result);
  };
@Test def testLSinNegativeDouble() {
    var x = -5.5;
    var t: Double = x.toDouble;
    var result = po.lsin(t) + x;
    var expected =0.7055405250952838;
    assertEquals(expected, result);
  };

  @Test def testLCosNegative() {
    var x = -1;
    var result = po.lcos(x) + 1;
    var expected = Math.cos(x);
    assertEquals(expected, result);
  };

  @Test def testLCosPositive() {
    var x = 2;
    var result = po.lcos(x) + 1;
    var expected = -0.4161468365471426;
    assertEquals(expected, result);
  };

  @Test def testLCosZero{
    var x=0;
     var result = po.lcos(x) + 1;
    var expected = 1.0;
    assertEquals(expected, result);
    
  }
  @Test def testLCosNull() {
    val t: Double = Double.NaN;
    var result = po.lcos(t) + 1;
    var expected = Math.cos(t);
    assertEquals(expected, result);
  };

  @Test def testLCosDouble() {
    var x = 3.3333;
    var t: Double = x.toDouble;
    var result = po.lcos(t) + 1;
    var expected = -0.9816803564367413;
    assertEquals(expected, result);
  };

  @Test def testSolveAlpha() {
    var a = po.solve(0, 2 * po.pi);
    var expected = 2.3098814600100575;
    assertEquals(expected, a);
  };

  @Test def testSolveLength() {
    var r: Double = 1;
    var expected: Double = 1.1920544934009658;
    var alpha: Double = 2.3098814600100575;
    var actual = 2 * r * (1 - Math.cos(alpha / 2))
    assertEquals(expected, actual);
  };
@Test def testSolveLengthA() {
    var r: Double = 50;
    var expected: Double = 59.60272467004829;
    var alpha: Double = 2.3098814600100575;
    var actual = 2 * r * (1 - Math.cos(alpha / 2))
    assertEquals(expected, actual);
  };
}