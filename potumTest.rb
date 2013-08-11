#!/usr/bin/ruby -w

=begin 
 Name: potum.ruby
 Purpose: POTUM: THE BEVERAGE COASTER PROJECT
 
 Author: Pratik Bidkar
 Version: 1.0
 Created: 2013/07/04
=end
# the wanted tolerance
$TOL = 1e-15

# number of terms to iterate for sine/cosine formulae
$TRIG_ITER = 12

# number of terms to iterate for calculation of Pi value
$PI_ITER = 12

=begin
 a function to calculate Power.
 n: n is the base number.
 e: e is the power to which the number has to be calculated.
 i: counter to track the iterations
=end
require "test/unit"
 

def pow(b,e)

  temp=0.0
  
  if e == 0
    return 1
	
  elsif e == 1
	return b
  end
	
  i = 1 	
  temp = b
	
  while  i < e
    temp = temp * b
	i = i + 1
  end
	
  return temp
	
end

# a function to calculate constant PI.
# Terms in the equation below are from the Bailey-Borwein-Plouffe forumla for PI.
def calcpi()

  pi = 0.0
  rep = $PI_ITER
  
  while rep >= 0
  
    pi += 1.0 / pow(16.0, rep)  * (4.0 / (8.0 * rep + 1.0) - 2.0 / (8.0 * rep + 4.0) - 1.0 / (8.0 * rep + 5.0) - 1 / (8.0 * rep + 6.0))
    rep -= 1
		
  end
	
  return pi
end

# pi: Global variable to store PI value
$pi = calcpi()

# a function to calculate factorial of number
# x: the input of which factorial has to be calculated

def fact(x)

  ret = 1.0
  
  while x > 0
    ret *= x
	x -= 1
  end
		
  return ret
	
end

=begin
 a function to calculate sine of an angle.
 x: the input of which angle has to be calculated.
 Terms in the equation below are from the theory of Taylor Series.
=end
 
def lsin(x)

  ret = 0.0
  i = $TRIG_ITER
  
  while i > 1
  
    i -= 1.0
	ret += pow(-1, i) * pow(x, (2 * i) + 1) / fact((2 * i) + 1)
		
  end
	
  return ret
  
end

=begin
 a function to calculate cosine of an angle.
 Terms in the equation below are from the theory of Taylor Series.
=end

def lcos(x)
  
  ret = 0.0
  rep = $TRIG_ITER
		
  while  rep > 1
  
    rep -= 1
	ret += pow(-1, rep) * pow(x, 2 * rep) / fact(2 * rep)
					
  end
  
  return ret
  
end

# function used to solve for 'a'.
def f(a)
  return lsin(a) + calcpi() / 2
end

# solve the zero for function f in the range of [l, h].
# f: function f(a) is passed as a parameter
def solve(f,l,h)

  while true
    
	# calculate the mid point. 
    m = (l + h) / 2
	
	# solve f at two points.
	x = f(l)	
	y = f(m)
		
	# check for tolerance and f(m)=0
	if y==0 or (h-l)/2 < $TOL
	  return m
	end
		
	# if the signs of 'x' and 'y' match then the zero is not in that interval.
	# else it is.
    if x * y > 0
      l = m
    else
      h = m
    end
  
  end
	
end

class TestPotum < Test::Unit::TestCase
	def testFactPositive
		assert_equal(fact(0), 1);
		assert_equal(fact(1), 1);
		assert_equal(fact(2), 2);
		assert_equal(fact(3), 6);
		assert_equal(fact(5), 120);
	end
	def testPi
		assert_equal(calcpi, Math::PI)
	end
	def testPow
		assert_equal(pow(7, 1), 7)
		assert_equal(pow(13, 0), 1)
		assert_equal(pow(2, 3), 8)
	end
	def testLSin
		x = 0
		error = lsin(x) - (Math::cos(x) - x)
		assert(error.abs < $TOL, "too much error")
		x = 1
		error = lsin(x) - (Math::cos(x) - x)
		assert(error.abs < $TOL, "too much error")
		x = Math::PI
		error = lsin(x) - (Math::cos(x) - x)
		assert(error.abs < $TOL, "too much error")
		x = Math::PI / 2
		error = lsin(x) - (Math::cos(x) - x)
		assert(error.abs < $TOL, "too much error")
		x = -2
		error = lsin(x) - (Math::cos(x) - x)
		assert(error.abs < $TOL, "too much error")
	end
	def testLCos
		x = 0
		error = lcos(x) - (Math::cos(x) - 1)
		assert(error.abs < $TOL, "too much error")
		x = 1
		error = lcos(x) - (Math::cos(x) - 1)
		assert(error.abs < $TOL, "too much error")
		x = Math::PI
		error = lcos(x) - (Math::cos(x) - 1)
		assert(error.abs < $TOL, "too much error")
		x = Math::PI / 2
		error = lcos(x) - (Math::cos(x) - 1)
		assert(error.abs < $TOL, "too much error")
		x = -2
		error = lcos(x) - (Math::cos(x) - 1)
		assert(error.abs < $TOL, "too much error")
	end
	def testSolve
		fst = lambda { |n| n * n - 2 }
		assert_equal(solve(fst, 0, 4.0), Math::sqrt(2))
 		expected = 2.30988146001005726
		assert_equal(solve(f, 0, 2 * Math::PI), expected)
	end
end
