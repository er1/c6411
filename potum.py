#!/usr/bin/pythonw (Interpreter)

# number of terms to iterate from PI formulae 
PI_COUNTER = 12

# number of terms to iterate from sin/cos formulae
TRIG_COUNTER = 12

# limit iterations to prevent infinite loop
NMAX = 20

# the wanted tolerance, TOL
TOL = 10e-5

# function to calculate PI
def calcpi():
      
      # initialize term for summation
      pi = 0

      # looping backwards using steps to reduce errors
      for k in range(PI_COUNTER-1, -1, -1):
            
            # terms are from spigot algorithm
            pi += 1 / pow(16, k) * (
		  4 / (8 * k + 1) - 2 / (8 * k + 4) - 
		  1 / (8 * k + 5) - 1 / (8 * k + 6))
            
      return pi


# calculate PI
pi = calcpi()

# non-recursive power function n**e
def pow(n, e):
      a = 1
      while e is not 0:
            if e and 1 is 0:
                n = n * n
                e = e / 2
            else:
                a = a * n
                e = e - 1
      return a


# non-recursive factorial function n!
def fact(n):
      fact = 1
      while n > 0:
            fact *= n;
            n -= 1
      return fact


# sine function lsin(x)
def lsin(x):
      sine = 0
      
      # looping backwards using steps to reduce errors
      for k in range(TRIG_COUNTER, 0, -1):
            
            # terms are from taylor series
            sine += pow(-1, k) * pow(x, 2 * k + 1) / fact(2 * k + 1)
            
      return sine

# cosine function lcos(x)
def lcos(x):
      cosine = 0
      
      # looping backwards using steps to reduce errors
      for k in range(TRIG_COUNTER, 0, -1):
            
            # terms are from taylor series
            cosine += pow(-1, k) * pow(x, 2 * k) / fact(2 * k)
            
      return cosine


# function used to compute a (simplified to reduce truncation error)
def f(a):
      return lsin(a) + pi / 2


# bisection method implemetation to find the root in the interval [l,h] for function f
def solve(eqn, l, h):
      
      #counter for looping 
      count = 1

      # loop until it reach to maximum no of iterations NMAX or under TOL
      while(count <= NMAX):

            # new midpoint
            m = (l + h) / 2

            # calculate f at two points
            x = eqn(l)
            y = eqn(m)
            
            # check for tolerance and eqn(m)=0
            if y == 0 or (h - l) / 2 < TOL:
                  return m
            
            # increment step counter
            count += 1

            if (x * y) > 0: # new interval if x and y have same sign
                  l = m
            else:
                  h = m

                 
# call solve function on f to get a
a = solve(f, 0, 2 * pi)


# prompting for input
while True:
      radius = 1.0
      try:
            radius = float(input("Enter the radius >> ") or radius)
      except ValueError:
            print("Invalid number; please try again")
            
      if radius is not None:
            radius = float(radius)
            l = -2 * radius * lcos(a / 2)
            print("For radius R: ", radius," Length l: ", l)
      else:
            print("please enter proper value for radius!")

      cont = input("Do you want to continue? (0: exit; 1:continue) >> ")
      if cont.isdigit():
            cont = int(cont)
      else:
            print("Invalid entry")
      if cont == 0:
            break                    

