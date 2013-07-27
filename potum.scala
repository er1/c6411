
/**
 * Name: potum.scala
 * Purpose: POTUM: THE BEVERAGE COASTER PROJECT
 * 
 * Author: Bargavi Chinni Krishnamoorthy
 * Version: 1.0
 * Created: 2013/07/04
 */

object po {

  /**
   * Defines a function potum
   * @param r  Input radius value
   * @return   Length
   */

  def potumCalc(r: Double): Double = {

    // Number of terms to iterate over PI formulae to get exact value of pi constant
    val PI_ITER = 12

    // Number of terms to iterate over sine/cosine functions
    val TRIG_ITER = 12

    /**
     * Calculates the value of the first argument raised to the power of the 
     * second argument.
     * @param base  Base number
     * @param exp  exponent number
     * @return  base^^exp
     */

    def pow(b: Double, e: Int): Double = {
      var ret: Double = 1
      var b1 = b
      var e1 = e
      while (e1 > 0) {
        // optimize around b1 ^ ( * n) === (b * b) ^ n
        if (e1 % 2 == 0) {
          e1 /= 2
          b1 *= b1
        } else {
          e1 -= 1
          ret *= b1
        }
      }
      ret
    }

    /**
     * Calculates the value of constant PI
     * @return  pi value
     */

    def calcpi(): Double = {
      var ret: Double = 0
      var i = PI_ITER
      while (i != 0) {
        i -= 1
        // terms are from the Bailey-Borwein-Plouffe forumla for PI
        ret += (1.0 / pow(16, i)) * (
          4.0 / (8 * i + 1) - 2.0 / (8 * i + 4) -
          1.0 / (8 * i + 5) - 1.0 / (8 * i + 6))
      }
      ret
    }

    /**
     * Calculates factorial of given number
     * @param x  Number
     * @return  factorial value of x
     */

    def fact(n: BigInt): BigInt = {
      var ret: BigInt = 1
      var x: BigInt = n
      while (x > 0) {
        ret *= x
        x -= 1
      }
      ret
    }

    /**
     * Calculates value using modified sine function
     * @param x  the input number to which sine has to be calculated
     * @return  modified sine value of x
     */

    def lsin(x: Double): Double = {
      var ret: Double = 0
      var i = TRIG_ITER
      //loop in reverse to reduce error
      while (i > 1) {
        i -= 1
        ret += pow(-1, i) * pow(x, 2 * i + 1) / fact(2 * i + 1).toDouble
      }
      ret
    }

    /**
     * Calculates value using modified cosine function
     * @param x  the input number to which cosine has to be calculated
     * @return  modified cosine value of x
     */

    def lcos(x: Double): Double = {
      var ret:Double = 0
      var i = TRIG_ITER
      //loop in reverse to reduce errors
      while (i > 1) {
        i -= 1
        ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i).toDouble
      }
      ret
    }

    // calculate pi
    val pi = calcpi

    /**
     * function used to solve alpha (a) (simplified to reduce truncation errors)
     * @param a  Alpha angle
     * @return value
     */
    def f(a: Double): Double = lsin(a) + pi / 2

    /**
     * Bisection method implementation to solve the zero for function f 
     * in the range of [l, h]
     * @param low  Lower bound value
     * @param high  Higher bound value
     * @return  Alpha angle value
     */

    def solve(low: Double, high: Double): Double = {
      var l = low
      var h = high
      var m: Double = 0
      while (true) {
        // find the mid point
        m = (l + h) / 2

        // if the rounding error causes m to match either l or h
        // this will not work with infinite precision
        if (m == l || m == h)
          return m

        // solve f at two points
        var a = f(l)
        var b = f(m)

        // if the signs match, then the zero is not in that region
        // otherwise it is.
        if ((a < 0) == (b < 0))
          l = m
        else
          h = m
      }
      m
    }

    // call solve to get a
    val a: Double = solve(0, 2 * pi);

    // calculate l based on a
    val len: Double = -2 * r * lcos(a / 2)

    len
  }
}

object potum {

  /**
   * Main method
   * @param args  no command line arguments
   */
  def main (args : Array[String]) {

    println("Enter exit/quit to terminate")
    var input: String = " "

    while(true) {
      print("\nEnter Radius : ")
      input = Console.readLine()

      if (input.equals("exit") || input.equals("quit"))
        sys.exit()

      try {
        Some(input.toDouble)
        var r: Double = input.toDouble
        println("Radius  : " + r)
        println("OverLap : " + po.potumCalc(r))
      }
      catch {
        case _: Throwable => println("Invalid Input! Try Again!")
      }
    }
  }
}

