--[[
  	COMP 6411: COMPARATIVE STUDY OF PROGRAMMING LANGUAGES: SECTION CC
		 		  SUMMER 2013
			POTUM: THE BEVERAGE COASTER PROJECT
		Created By: Radha Mendhurwar (Student Id: 6770088)
	]]

	-------------------------------------------------------------------
	-- Declaration of constants
	-- number of terms to use from the definition of PI
	PI_ITER = 12

	-- number of terms to use for trignometric functions (sine, cosine)
	TRIG_ITER = 12

	--Tolerance for the root finding method
	DELTA = 1e-14
	-------------------------------------------------------------------

	-------------------------------------------------------------------
	-- power function
	-- @param b (base)
	-- @param e (exponent)
	-- @return (b^e)
	-------------------------------------------------------------------
	function pow(b, e)

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
				end -- if (e%2) statement
			end	-- for statement
			return sum
		end	-- if (e<0) statement

	end	-- pow function

	-------------------------------------------------------------------
	-- factorial function x!
	-- @ param x (input for which factorial is required)
	-- @ return (x!)
	-------------------------------------------------------------------
	function fact(x)

		local sum = 1
		for iterator = 1, x do
			sum = sum * iterator
		end	-- for statemet
		return sum

	end	-- fact function

	-------------------------------------------------------------------
	-- calculate pi
	-- @return (value of pi)
	-------------------------------------------------------------------
	function calcpi()

		ret = 0;
		i = PI_ITER;
		while i>-1 do
			-- terms are from the Bailey-Borwein-Plouffe forumla for PI
			ret = ret + 1 / pow(16, i) * (4 / (8 * i + 1) - 2 / (8 * i + 4) - 1 / (8 * i + 5) - 1 / (8 * i + 6))
			i = i-1;
		end	--while statement
		return ret;

	end	-- calcpi function

	-------------------------------------------------------------------
	-- calculate sine angle
	-- @param x (angle value in radians)
	-- @return sin(x)
	-------------------------------------------------------------------
	function lsin(x)

		local sum = 0
		-- terms are from the Taylor's Series for Sin Calculations
		-- sin(x) = x - x^3/3! + x^5/5! - x^7/7! + x^9/9! - ... + (-1)^(n)*x^(2n+1)/(2n+1)! + .... for n 0 -> inf
		for iterator = 0, TRIG_ITER do
			sum = sum + ((pow(-1, iterator) * pow(x, 2 * iterator + 1))/ fact(2 * iterator + 1))
		end	-- for statement
		return sum

	end	-- lsin function

	-------------------------------------------------------------------
	-- calculate cosine
	-- @param x (angle value in radians)
	-- @return cos(x)
	-------------------------------------------------------------------
	function lcos(x)

		local sum = 0
		-- terms are from the Taylor's Series for Cosine Calculations
		-- cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + ... + (-1)^(n)*x^(2n)/(2n)! + .... for n 0 -> inf
		for iterator = 0, TRIG_ITER do
			sum = sum + ((pow(-1, iterator) * pow(x, 2 * iterator))/ fact(2 * iterator))
		end	-- for statement
		return sum

	end	--lcos function

	---------------------------------------------------------------------------------------
	-- bisection method implemetation to find the root in the interval [l,h] for function f
	-- @param eqn (equation to be solved)
	-- @param l (lower limit for the root)
	-- @param h (higher limit for the root)
	-- return root for eqn
	---------------------------------------------------------------------------------------
	function solve(eqn, l, h)

		while true do

			-- find the mid point
			local mid = (l + h) / 2

			-- if the rounding error causes m to match either l or h
			-- this will not work with infinite precision
			if mid == l or mid == h or math.abs(l - h) < DELTA then
				return mid
			end	-- if mid == ... condition


			-- sove f at two points
			local a = eqn(l)
			local b = eqn(mid)

			-- if the signs match, then the zero is not in that region
			-- otherwise it is
			if a*b > 0 then
				l = mid
			else
				h = mid
			end	-- if a*b>0 condition

		end	-- while loop

	end	-- solve function


	-- calulate pi
	local pi = calcpi()

	-------------------------------------------------------------------
	-- function used to solve for k
	-- @param k (value to be put in the equation)
	-- @return evaluation of the equation at given value k
	-------------------------------------------------------------------
	function f(k)

		return k - lsin(k) - pi / 2

	end	-- f function


	-------------------------------------------------------------------
	-- Code for user interaction, exception handeling and main loop
	-------------------------------------------------------------------
	local answer

	repeat

    	local r
		repeat

			io.write("Please enter a radius value (r): ")
			--io.flush()
			r = io.read()

			-- Validate r to be a numeric value
			if(not tonumber(r)) then
				io.write("Invalid input: " .. r .. " is not a number. Please enter a numeric value.\n")
			else
				-- Validate r to be positive
				if(tonumber(r) <= 0) then
					io.write("Invalid input: r must be greater than zero.\n")
				end	-- if tonumber(r) <= 0 statement
			end	-- if not tonumber(r) statement

		until (tonumber(r) and tonumber(r) > 0)


		-- call solve on f to get a. It can't be greater than pi.
		local a = solve(f, 0, pi)

		-- calculate l based on a
		local l = 2 * r * (1- lcos(a / 2))

		-- Areas for the coaster and overlap
		local coasterArea = pi * pow(r, 2)
		local overlapArea = pow(r, 2) * (a- lsin(a))

		io.write(string.format("Value of pi computed is %.9f \n", pi))
		io.write(string.format("For radius = %.4f the overlap l is %.14f \n", r, l))
		io.write(string.format("Upper coaster has to be moved (2r-l) = %.14f to have overlapping area to be half of any coaster's area.\n", 2*r-l))
		io.write(string.format("Area of coaster with radius %.4f = pi*r^2 = %.5f \nOverlapping area with computed alpha (%.4f) = r^2(alpha - sin(alpha)) = %.14f \n", r, coasterArea, a, overlapArea))


		repeat
			io.write("Do you want to try for another radius (y/n)? ")
			io.flush()
			answer = io.read()

			-- Validate for y/n
			if(answer ~= "y" and answer ~= "n") then
				io.write("Please enter y or n \n")
			end -- if answer ~= "y" and answer ~= "n" statement

		until answer == "y" or answer == "n"

	until answer=="n"
