// define a function potum based on some input radius r, return length l
var potum = function(r) {

	// number of terms to use from the definition of PI
	var PI_ITER = 12;

	// number of terms to use for trig functions (sin, cos)
	var TRIG_ITER = 12;

	// power function b^e
	var pow = function(b, e) {
		// return 1 in the base case of pow b ^ 0 === 1
		if (e == 0)
			return 1;
		// optimize around b ^ (2 * n) === (b * b) ^ n
		if (e % 2 == 0)
			return pow(b * b, e / 2);

		// recursive case
		return b * pow(b, e - 1);
	};

	// factorial function x!
	var fact = function(x) {
		// base case of 0! === 1
		if (x == 0)
			return 1;

		// recursivec ase
		return x * fact(x - 1);
	};

	// calculate pi
	var calcpi = function() {
		// term accumulator for summation
		var ret = 0;
		var i = PI_ITER;
		while (i--) {
			// terms are from the Bailey-Borwein-Plouffe forumla for PI
			ret += 1 / pow(16, i) * (
				4 / (8 * i + 1) - 2 / (8 * i + 4) - 
				1 / (8 * i + 5) - 1 / (8 * i + 6)
			)
		}
		return ret;
	};

	// calculate sine
	var sin = function(x) {
		var ret = 0;
		var i = TRIG_ITER;
		while (i--) {
			ret += pow(-1, i) * pow(x, 2 * i + 1) / fact(2 * i + 1);
		}
		return ret;
	};
	
	// calculate cosine
	var cos = function(x) {
		var ret = 0;
		var i = TRIG_ITER;
		while (i--) {
			ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i);
		}
		return ret;
	};

	// solve the zero for function f in the range of [l, h]
	var solve = function(eqn, l, h) {
		// find the mid point
		var m = (l + h) / 2;

		// if the rounding error causes m to match either l or h
		// this will not work with infinite precision
		if (m == l || m == h)
			return m;

		// sove f at two points
		var a = eqn(l);
		var b = eqn(m);

		// if the signs match, then the zero is not in that region
		// otherwise it is. Call again on the region with differing signs
		if (a < 0 == b < 0)
			return solve(f, m, h);
		else
			return solve(f, l, m);
	};

	// calulate pi
	var pi = calcpi();

	// function used to solve for a
	var f = function(a) {
		return a - sin(a) - pi / 2;
	};

	// call solve on f to get a
	var a = solve(f, 0, 2 * pi);

	// calculate l based on a
	var l = 2 * r * (1 - cos(a / 2));

	return l;
};

console.log(potum(1));
