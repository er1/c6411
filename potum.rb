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

def pow(b,e)

  temp=0.0
  
  if e == 0
    return 1
	
  elsif e == 1
	return b
  end
	
  i = 1 	
  temp = n
	
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

def loop()

  begin
    # Prompt the user to enter the radius.
    print "Enter the radius :: "

    # Stores the radius into variable r and converts it to float.
    r = gets.chomp.to_f
    $rad = r
	
    if $rad < 0
      puts "Radius cannot be negative, enter a valid positive radius"
	  loop()
    end
    
  end
  
end
 
  loop()
  
  # Call solve method on function 'f' to calculate the angle 'a'.
  a = solve(method(:f), 0, 2 * $pi)

  puts "Angle :: #{a}"

  # Calculate length based on value of angle 'a'
  l = -2 * $rad * lcos(a/2)

  puts "Length of the overlap :: #{l}"



