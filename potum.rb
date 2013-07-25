
# a function to calculate Power.
# n: n is the base number.
# e: e is the power to which the number has to be calculated.
# i: counter to track the iterations
$TOL = 1e-15
def pow(n,e)

	temp=0.0
	if e == 0
		return 1
	
	elsif e == 1
		return n
	end
	
	i = 1 	
	temp = n
	
	while  i < e
		temp = temp * n
		i = i + 1
	end
	
	return temp
	
end

# a function to calculate constant PI.
# rep: number of iterations to be performed to calculate approximate value of PI.
# Terms in the equation below are from the Bailey-Borwein-Plouffe forumla for PI.
def calcpi()

	pi = 0.0
	rep = 12.0
	
	while rep >= 0
	
		pi += 1.0 / pow(16.0, rep)  * (4.0 / (8.0 * rep + 1.0) - 2.0 / (8.0 * rep + 4.0) - 1.0 / (8.0 * rep + 5.0) - 1 / (8.0 * rep + 6.0))
		rep -= 1
		
	end
	
	return pi
end

# pi: Global variable to store PI value
$pi = calcpi()

# a function to calculate factorial of number
# ret: initialised to 1, returns the factorial of the number
# x: the input of which factorial has to be calculated

def fact(x)

		 ret = 1.0
		 
		while x > 0
			ret *= x
			x -= 1
		end
		
		return ret
	
end

# a function to calculate sine of an angle.
# ret: initialised to 0, returns the sine value.
# x: the input of which angle has to be calculated.
# Terms in the equation below are from the theory of Taylor Series.
# i: number of iterations to be performed to calculate sine value.
def lsin(x)

	ret = 0.0
	i = 12
	
	while i > 1
	
	    i -= 1.0
	    ret += pow(-1, i) * pow(x, (2 * i) + 1) / fact((2 * i) + 1)
		
	end
	
	return ret
end

# a function to calculate cosine of an angle.
# Terms in the equation below are from the theory of Taylor Series.
# i: number of iterations to be performed to calculate cosine value.
def lcos(x)

		ret = 0.0
		rep = 12
		
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

# Prompt the user to enter the radius.
print "Enter the radius :: "

# Stores the radius into variable r and converts it to float.
r = gets.chomp.to_f

# Call solve method on function 'f' to calculate the angle 'a'.
a = solve(method(:f), 0, 2*$pi)

puts "Angle :: #{a}"

# Calculate length based on value of angle 'a'
l = -2 * r * lcos(a/2)

puts "Length of the overlap :: #{l}"

