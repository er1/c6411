@@TOL = 1e-15
#puts @@TOL
def pow(b,e)

	if e == 0
		return 1
	elsif e== 1
		return b
	end
	i=1 # counter	
	temp = b 

	while  i < e
		temp=temp * b
		i = i + 1
	end
	# we have result in temp
	return temp
	
end

def calcpi()
		pi=0.0
		rep=11.0
		while rep>=0.0
			pi +=  1.0 / pow(16.0, rep) * (
		  4.00 / (8.00 * rep + 1.0) - 2.0 / (8.0 * rep + 4.0) - 
		  1.0 / (8.0 * rep + 5.0) - 1.0 / (8.0 * rep + 6.0))
			rep=rep-1.00
		end	
		return pi
end

@@var=calcpi()
puts @@var


	
def fact(x)
	y=1
	temp=1
	if x==1 or x==0
		return 1
	
		else
		
			while y<=x do
				temp=temp*y
				y=y+1
			end
			return temp
	
		end
	
end
	
def lsin(x)
		#x=x*@@var/180	# converting angle into radians
		ret=0.0
		rep=12.0
		while  rep>=0.0 
				
				ret+= pow(-1, rep) * pow(x, 2.0 * rep + 1) / fact(2.0 * rep + 1)
				rep=rep-1.0
			
		end
		return ret 
	
end

#sine=lsin(30)
#puts "This is the sine value : #{sine}"


def lcos(x)
	


		#x=x*@@var/180
		ret=0.0
		rep=12.0
		while  rep>=0.0 
			
				ret+=pow(-1, rep) * pow(x, 2.0 * rep) / fact(2.0 * rep)
				rep=rep-1.0
			
		end
		return ret 
	end
#cose=lcos(30)
#puts "This is the cose value : #{cose}"


#def f(a) 
 #lambda{return lsin(a) + @@var/2}
#end

#@@fo=f()
#puts "lambda value expression : : #{@@fo}"

def f(a)
	 return lsin(a) + @@var / 2
end
	
def solve(f,l,h)
	
	
	while true 
		m = (l + h) / 2
			
		# calculate f at two points
		
		#x=f(l)
		#y=f(m)
		
		#if y == 0 or (h - l) / 2 < @@TOL
		#	return m
		#end
		
		# check for tolerance and eqn(m)=0
		if (m == l || m == h)
			return m
		end
		
		a = f(l)
		b = f(m)
		c = f(h)
		
		if (a < 0 == b < 0)
				return solve(f, m, h);
		else
				return solve(f, l, m);
		end

		#if x * y > 0 # new interval if x and y have same sign
		#	l = m
		#else
		#	h = m
		#end

	end
end
	
	a = solve((method(:f)), 0, 2 * @@var)
	
	puts "Enter radius:"

		r = gets.chomp.to_i
	#l = 2 * r * (1 - lcos(a / 2))
	l = -2 * r * lcos(a / 2)
	puts "value of L :: #{l}"
	#	l = -2 * r * lcos(a / 2)
	#	puts  r
	#	puts  l




