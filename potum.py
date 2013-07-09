#!/usr/bin/pythonw (Interpreter)

PI_COUNTER = 12
TRIG_COUNTER = 16
NMAX = 20
TOL = 10e-5

def calcpi():
      pi=0
      for k in range(PI_COUNTER-1, -1, -1):
            pi += 1 / pow(16, k) * (
		  4 / (8 * k + 1) - 2 / (8 * k + 4) - 
		  1 / (8 * k + 5) - 1 / (8 * k + 6))            
      return pi

pi = calcpi()

def pow(n,e):
      if e == 0:
        return 1
      else:   
        return n * pow(n,e-1)

def fact(n):
      if n <= 1:
            return 1
      else:           
            return n * fact(n-1)

def sin(x):
      sine=0
      for k in range(TRIG_COUNTER-1, -1, -1):
            sign = pow(-1,k)
            sine += pow(x,2*k+1)/fact(2*k+1) * sign
      return sine

def cos(x):
      cosine=0
      for k in range(TRIG_COUNTER-1, -1, -1):
            sign = pow(-1,k)
            cosine += pow(x,2*k)/fact(2*k) * sign            
      return cosine


def f(a):
      return a-sin(a)-pi/2

def solve(eqn, l, h):
      count = 1
      while(count <= NMAX):
            m = (l + h)/2
            x = eqn(l)
            y = eqn(m)
            if y == 0 or (h-l)/2 < TOL:
                  return m
            count += 1

            if (x*y) > 0: 
                  l = m
            else:
                  h = m

a = solve(f, 0, 2*pi)

while True:
      radius = 1.0
      try:
            radius = float(input("Enter the number > ") or radius)
      except ValueError:
            print("Invalid number; please try again")
            
      if radius is not None:
            radius = float(radius)
            l = 2 * radius *(1-cos(a/2))
            print("For radius: ",radius," Length: ",l)
      else:
            print("invalid radius")

      cont = input("enter 0:exit 1:continue >> ")
      if cont.isdigit():
            cont = int(cont)
      else:
            print("invalid")
      if cont == 0:
            break                    

