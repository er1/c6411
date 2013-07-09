// define a function potum based on some input radius r, return length l
var potum = function(r) {

	// number of terms to use from the definition of PI
	var PI_ITER = 12;

	// number of terms to use for trig functions (sin, cos)
	var TRIG_ITER = 12;

	// power function b^e
	var pow = function(b, e) {
		var ret = 1;
		while (e > 0) {
			// optimize around b ^ (2 * n) === (b * b) ^ n
			if (e % 2 == 0) {
				e /= 2;
				b *= b;
			} else {
				e--;
				ret *= b;
			}
		}		
		return ret;
	};

	// factorial function x!
	var fact = function(x) {
		var ret = 1;
		while (x > 0) {
			ret *= x;
			x--;
		}
		return ret;
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
	var lsin = function(x) {
		var ret = 0;
		var i = TRIG_ITER;
		while (i-->1) {
			ret += pow(-1, i) * pow(x, 2 * i + 1) / fact(2 * i + 1);
		}
		return ret;
	};
	
	// calculate cosine
	var lcos = function(x) {
		var ret = 0;
		var i = TRIG_ITER;
		while (i-->1) {
			ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i);
		}
		return ret;
	};

	// solve the zero for function f in the range of [l, h]
	var solve = function(eqn, l, h) {
		while (true) {
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
			// otherwise it is.
			if (a < 0 == b < 0)
				l = m;
			else
				h = m;
		}
	};

	// calulate pi
	var pi = calcpi();

	// function used to solve for a
	var f = function(a) {
		return lsin(a) + pi / 2;
	};

	// call solve on f to get a
	var a = solve(f, 0, 2 * pi);

	// calculate l based on a
	var l = -2 * r * lcos(a / 2);

	return l;
};

function loop() {
	var stdin = process.stdin
	var stdout = process.stdout;

	stdin.resume();
	stdout.write("Enter a radius: ");

	stdin.once('data', function(data) {
		data = data.toString().trim();

		r = +data;
		if (!isNaN(r)) {
			var l = potum(r);
			stdout.write("Radius:  " + r + "\n");
			stdout.write("Overlap: " + l + "\n");
		}
		if (data.match(/exit|quit/i)) {
			process.exit(0);
		}
		loop();
	});
}

loop();
