--[[
  	COMP 6411: COMPARATIVE STUDY OF PROGRAMMING LANGUAGES: SECTION CC
		 		  SUMMER 2013
			POTUM: THE BEVERAGE COASTER PROJECT
		Created By: Radha Mendhurwar (Student Id: 6770088)
	]] 

	-- number of terms to use from the definition of PI
	PI_ITER = 100000

	-- number of terms to use for trignometric functions (sine, cosine)
	TRIG_ITER = 12

	--Tolerance for the root finding method
	delta = 1e-14

	-- power function b^e
	function calculatePower(b, e)

		local sum = 1

		if(e < 0) then
			return 1 / pow(b, e)	-- In case of a negative exponent.
		else

			for iterator = 1, e do
				if (e % 2 == 0) then
					e = e / 2
					b = b * b
				else
					e = e - 1
					sum = sum * b
				end
			end
			return sum
		end

	end

	-- factorial function x!
	function calculateFactorial(x)

		local sum = 1
		for iterator = 1, x do
			sum = sum * iterator
		end
		return sum

	end

	-- calculate pi
	function calculatePi()

		-- term accumulator for summation
		local sum = 0
		local fac = 1
		for iterator = 1, PI_ITER do
		-- terms are from Leibniz forumla for PI pi/4 = 1 - 1/3 + 1/5 - 1/7 + ... + (-1)^n/2*n+1
			term = fac/(2*iterator-1)
			fac = fac * -1
			sum = sum + term
		end
		return 4*sum	-- We need pi and not pi/4.

	end

	-- calculate sine angle
	function calculateSine(x)

		local sum = 0
		-- terms are from the Taylor's Series for Sin Calculations
		-- sin(x) = x - x^3/3! + x^5/5! - x^7/7! + x^9/9! - ... + (-1)^(n)*x^(2n+1)/(2n+1)! + .... for n 0 -> inf
		for iterator = 0, TRIG_ITER do
			sum = sum + ((calculatePower(-1, iterator) * calculatePower(x, 2 * iterator + 1))/ calculateFactorial(2 * iterator + 1))
		end
		return sum

	end

	-- calculate cosine
	function calculateCosine(x)

		local sum = 0
		-- terms are from the Taylor's Series for Cosine Calculations
		-- cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + ... + (-1)^(n)*x^(2n)/(2n)! + .... for n 0 -> inf
		for iterator = 0, TRIG_ITER do
			sum = sum + ((calculatePower(-1, iterator) * calculatePower(x, 2 * iterator))/ calculateFactorial(2 * iterator))
		end
		return sum

	end

	-- bisection method implemetation to find the root in the interval [l,h] for function f
	function solve(eqn, l, h)

		while true do

			-- find the mid point
			local mid = (l + h) / 2

			-- if the rounding error causes m to match either l or h
			-- this will not work with infinite precision
			if mid == l or mid == h or math.abs(l - h) < delta then
				return mid
			end


			-- sove f at two points
			local a = eqn(l)
			local b = eqn(mid)

			-- if the signs match, then the zero is not in that region
			-- otherwise it is
			if a*b > 0 then
				l = mid
			else
				h = mid
			end
		end

	end

	-- calulate pi
	local pi = calculatePi()

	-- function used to solve for a
	function f(k)

		return k - calculateSine(k) - pi / 2

	end

	local answer
	repeat
    local r
		repeat

			io.write("Please enter a radius value (r): ")
			io.flush()
			r = io.read()

			--Validate r to be a numeric value
			if(tonumber(r) == nil) then
				io.write("Invalid input: " .. r .. " is not a number. Please enter a numeric value.\n")
			else
				--Validate r to be positive
				if(tonumber(r) <= 0) then
					io.write("Invalid input: r must be greater than zero.\n")
				end
			end

		until (tonumber(r) ~= nil and tonumber(r) > 0)


		-- call solve on f to get a. It can't be greater than pi.
		local a = solve(f, 0, pi)

		-- calculate l based on a
		local l = 2 * r * (1- calculateCosine(a / 2))

		--Areas for the coaster and overlap
		local coasterArea = pi * calculatePower(r, 2)
		local overlapArea = calculatePower(r, 2) * (a- calculateSine(a))

		io.write(string.format("For radius = %.4f the overlap l is %.14f \n", r, l))
		io.write(string.format("Upper coaster has to be moved (2r-l) = %.14f to have overlapping area to be half of any coaster's area.\n", 2*r-l))
		io.write(string.format("Area of coaster with radius %.4f = pi*r^2 = %.5f \nOverlapping area with computed alpha (%.4f) = r^2(alpha - sin(alpha)) = %.14f \n", r, coasterArea, a, overlapArea))

		repeat
			io.write("Do you want to try for another radius (y/n)? ")
			io.flush()
			answer = io.read()

			--Validate for y/n
			if(answer ~= "y" and answer ~= "n") then
				io.write("Please enter y or n \n")
			end

		until answer == "y" or answer == "n"

	until answer=="n"
