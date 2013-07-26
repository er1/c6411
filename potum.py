#!/usr/bin/env python

"""-----------------------------------------------------------------------------
Name: potum.py
Purpose: POTUM: THE BEVERAGE COASTER PROJECT 

Author: Jaiminkumar Patel
Version: 1.0.4
Created: 2013/07/05
-----------------------------------------------------------------------------"""

# Number of terms to iterate from PI formulae 
PI_ITER = 12

# Number of terms to iterate from sin/cos formulae
TRIG_ITER = 12

# The wanted tolerance, TOL
TOL = 1e-15

# Function to calculate PI
def calcpi():
    # Initialize term for summation
    ret = 0
    
    # Looping backwards using steps to reduce errors
    for n in range(PI_ITER)[::-1]:

        # Terms are from spigot algorithm
        ret += 1.0 / pow(16, n) * (
            4.0 / (8 * n + 1) - 2.0 / (8 * n + 4) - 
            1.0 / (8 * n + 5) - 1.0 / (8 * n + 6))

    return ret

# Non-recursive power function n**e
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


# Non-recursive factorial function n!
def fact(n):
    ret = 1
    
    while n > 0:
        ret *= n
        n -= 1

    return ret


#Sine function lsin(x)
def lsin(x):
    ret = 0

    #Looping backwards using steps to reduce errors
    for k in range(TRIG_ITER, 0, -1):	

        # Terms are from taylor series
        ret += pow(-1, k) * pow(x, 2 * k + 1) / fact(2 * k + 1)
        
    return ret

# Cosine function lcos(x)
def lcos(x):
    ret = 0

    # Looping backwards using steps to reduce errors
    for k in range(TRIG_ITER, 0, -1):

        # Terms are from taylor series
        ret += pow(-1, k) * pow(x, 2 * k) / fact(2 * k)
        
    return ret

# Bisection method implemetation to find the root in the interval [l,h] for function f
def solve(eqn, l, h):

    # Loop until the error is less than TOL
    while True:
	# New midpoint
        m = (l + h) / 2

	# Calculate f at two points
        x = eqn(l)
        y = eqn(m)

	# Check for tolerance and eqn(m)=0
        if y == 0 or (h - l) / 2 < TOL:
            return m

        if (x * y) > 0: # New interval if x and y have same sign
            l = m
        else:
            h = m


# Calculate PI
pi = calcpi()

# Function used to compute a (simplified to reduce truncation error)
f = lambda x : lsin(x) + pi / 2

# Call solve function on f to get a
a = solve(f, 0, 2 * pi)

def main():
    while True:
        line = input("Enter a radius: ")

        if line.lower() == "exit" or line.lower() == "quit":
                break

        try:
                r = float(line)
                l = -2 * r * lcos(a / 2)
                print("Radius:  ",  r)
                print("Angle:  ",  a)
                print("Overlap: ",  l)
                
        except ValueError:
                pass # Ignore silently


if __name__ == '__main__':
    main()
