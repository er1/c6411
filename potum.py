# number of terms to iterate from PI formulae 
PI_ITER = 12

# number of terms to iterate from sin/cos formulae
TRIG_ITER = 12

# the wanted tolerance, TOL
TOL = 1e-15

# function to calculate PI
def calcpi():
	# initialize term for summation
	ret = 0

	# looping backwards using steps to reduce errors
	for n in range(PI_ITER)[::-1]:
		# terms are from spigot algorithm
		ret += 1.0 / pow(16, n) * (
		  4.0 / (8 * n + 1) - 2.0 / (8 * n + 4) - 
		  1.0 / (8 * n + 5) - 1.0 / (8 * n + 6))

	return ret

# non-recursive power function n**e
def pow(n, e):
	ret = 1
	while e is not 0:
		if e and 1 is 0:
		    n = n * n
		    e = e / 2
		else:
		    ret = ret * n
		    e = e - 1
	return ret


# non-recursive factorial function n!
def fact(n):
	ret = 1
	while n > 0:
		ret *= n;
		n -= 1
	return ret


# sine function lsin(x)
def lsin(x):
	ret = 0

	# looping backwards using steps to reduce errors
	for k in range(TRIG_ITER, 0, -1):	
		# terms are from taylor series
		ret += pow(-1, k) * pow(x, 2 * k + 1) / fact(2 * k + 1)

	return ret

# cosine function lcos(x)
def lcos(x):
	ret = 0

	# looping backwards using steps to reduce errors
	for k in range(TRIG_ITER, 0, -1):
		# terms are from taylor series
		ret += pow(-1, k) * pow(x, 2 * k) / fact(2 * k)
 
	return ret

# bisection method implemetation to find the root in the interval [l,h] for function f
def solve(eqn, l, h):
	# loop until the error is less than TOL
	while True:
		# new midpoint
		m = (l + h) / 2

		# calculate f at two points
		x = eqn(l)
		y = eqn(m)

		# check for tolerance and eqn(m)=0
		if y == 0 or (h - l) / 2 < TOL:
			return m

		if (x * y) > 0: # new interval if x and y have same sign
			l = m
		else:
			h = m


# calculate PI
pi = calcpi()

# function used to compute a (simplified to reduce truncation error)
f = lambda x : lsin(x) + pi / 2

# call solve function on f to get a
a = solve(f, 0, 2 * pi)

# prompting for input
while True:
	line = input("Enter a radius: ")

	if line.lower() == "exit" or line.lower() == "quit":
		break;

	try:
		r = float(line)
		l = -2 * r * lcos(a / 2)
		print("Radius:  ",  r)
		print("Overlap: ",  l)
	except ValueError:
		pass # ignore silently
