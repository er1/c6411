var f = function(x) { return x - Math.sin(x) - Math.PI / 2; }

var low = 0;
var high = 2 * Math.PI;
var mid;

while (true) {
	mid = (low + high) / 2;
	if (mid == low || mid == high)
		break;

	var a = f(low);
	var b = f(mid);

	if (a < 0 == b < 0)
		low = mid;
	else
		high = mid;
}

var r = +process.argv.pop();
if (isNaN(r))
	r = 1;
var a = mid;
var l = 2 * (1 - Math.cos(a / 2));
var rl = r * l;

console.log({a:a,l:l,rl:rl});
