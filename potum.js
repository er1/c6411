var potum = function(r) {

	var PI_ITER = 12;
	var TRIG_ITER = 16;

	var pow = function(b, e) {
		if (e == 0)
			return 1;
		if (e % 2 == 0)
			return pow(b * b, e / 2)
		return b * pow(b, e - 1);
	}

	var fact = function(x) {
		if (x == 0)
			return 1;
		return x * fact(x - 1);
	}

	var calcpi = function() {
		var ret = 0;
		for (var i = PI_ITER - 1; i >= 0; i--) {
			ret += 1 / pow(16, i) * (
				4 / (8 * i + 1) - 2 / (8 * i + 4) - 
				1 / (8 * i + 5) - 1 / (8 * i + 6)
			)
		}
		return ret;
	};

	var sin = function(x) {
		var ret = 0;
		for (var i = TRIG_ITER - 1; i >= 0; i--) {
			ret += pow(-1, i) * pow(x, 2 * i + 1) / fact(2 * i + 1);
		}
		return ret;
	};

	var cos = function(x) {
		var ret = 0;
		for (var i = TRIG_ITER - 1; i >= 0; i--) {
			ret += pow(-1, i) * pow(x, 2 * i) / fact(2 * i);
		}
		return ret;
	};

	var solve = function(f, l, h) {
		var m = (l + h) / 2;
		if (m == l || m == h)
			return m;
		var a = f(l);
		var b = f(m);
		var c = f(h);

		if (a < 0 == b < 0)
			return solve(f, m, h);
		else
			return solve(f, l, m);
	}

	var pi = calcpi();

	var f = function(a) {
		return a - sin(a) - pi / 2;
	}

	var a = solve(f, 0, 2 * pi);

	var l = 2 * r * (1 - cos(a / 2));

	return l;
};

console.log(potum(1));
