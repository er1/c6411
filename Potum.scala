
object po {
  def potumCalc(r: Float): Float = {

    val PI_ITER = 12
    val TRIG_ITER = 12

    // power function b^e
    def pow(base: Float, exp: Float): Float = {
      var ret:Float = 1
      var b = base
      var e = exp 
		while (e > 0) {
			// optimize around b ^ (2 * n) === (b * b) ^ n
			if (e % 2 == 0) {
				e /= 2
				b *= b
			} else {
				e -= 1
				ret *= b
			}
		}		
		return ret
    }

    // calculate factorial of x
    def fact(x: Int): Int = {
      var ret: Int = 1
      var xx: Int = x
      while (xx > 0) {
        ret *= xx
        xx -= 1
      }
      return ret
    }
    
    // calculate pi value
    def calcpi(): Float = {
      var ret: Float = 0;
      var i = PI_ITER;
      while (i != 0) {
        i -= 1
        // terms are from the Bailey-Borwein-Plouffe forumla for PI
        ret += 1 / pow(16, i) * (
          4 / (8 * i + 1) - 2 / (8 * i + 4) -
          1 / (8 * i + 5) - 1 / (8 * i + 6))
      }
      return ret;
    }

    // calculate sine
    def lsin(x: Float): Float = {
      var ret: Float = 0
      var i = TRIG_ITER
      //loop in reverse to reduce error
      while (i > 1) {
        i -= 1
        ret += pow(-1, i) * pow(x, 2 * i + 1) / fact(2 * i + 1)
      }
      return ret
    }

    // calculate cosine
    def lcos(x: Float): Float = {
      var ret: Float = 0
      var i = TRIG_ITER
      //loop in reverse to reduce errors
      while (i > 1) {
        i -= 1
        ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i)
      }
      return ret
    }

    // calculate pi
    val pi = calcpi();

    // function used to solve a (simplified to reduce truncation errors)
    def f(a: Float): Float = lsin(a) + pi / 2
    

    // Bisection method implementation to solve the zero for function f in the range of [l, h]
    def solve(ll:Float, hh:Float) :Float = {
      var l = ll
      var h = hh
      var m:Float = 0
      while ( true ) {
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
        if (a < 0 == b < 0)
          l = m
        else
          h = m
      }
      m
    }

    // call solve to get a
    val a:Float = solve(0, 2 * pi);

    // calculate l based on a
    val len:Float = -2 * r * lcos(a / 2)

    return len

  }
}
object Potum extends App {
  println("Enter Radius : ")
  val n:Float = Console.readFloat

  println("Length : " + po.potumCalc(n))
}