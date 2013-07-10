


@@TOL= 1e-15
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
		rep=12.0
		while rep>=0.0
			pi = pi + 1.0 / pow(16.0, rep) * (
		  4.0 / (8.0 * rep + 1.0) - 2.0 / (8.0 * rep + 4.0) - 
		  1.0 / (8.0 * rep + 5.0) - 1.0 / (8.0 * rep + 6.0))
			rep=rep-1.0
		end	
		return pi
end

@@var=calcpi()
#puts @@var


	
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
		x=x*@@var/180	# converting angle into radians
		ret=0.0
		rep=0.0
		while  rep<12.0 
				
				ret=ret + pow(-1, rep) * pow(x, 2.0 * rep + 1) / fact(2.0 * rep + 1)
				rep=rep+1.0
			
		end
		return ret
	
end

#sine=lsin(30)
#puts sine
def lcos(x)
		x=x*@@var/180
		ret=0.0
		rep=0.0
		while  rep<12.0 
			
				ret=ret+pow(-1, rep) * pow(x, 2.0 * rep) / fact(2.0 * rep)
				rep=rep+1.0
			
		end
		return ret
	
end

#cose=lcos(30)
#puts cose

def solve(eqn,l,h)
	
	while true
		m= (l+h)/2
		
	end
	
	def f(a)
      return lsin(a) + pi / 2
	end
		# calculate f at two points
		x = eqn(l)
		y = eqn(m)
		
		# check for tolerance and eqn(m)=0
		if y == 0 or (h - l) / 2 < TOL
			return m
		end
		if (x * y) > 0 # new interval if x and y have same sign
			l = m
		else
			h = m
		end

		
		
		
		
end

def f()
	return lsin(x) + @@var/2
end
puts "Enter radius:"

		r = gets.chomp.to_i
		a = solve(f, 0, 2 * @@var)
		l = -2 * r * lcos(a / 2)
		puts  r
		puts  l




