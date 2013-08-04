potumTest = TestCase("potumTest");

potumTest.prototype.testFactPostive = function() {
	var actual = fact(5);
	var expected = 120;
	assertEquals(expected, actual);
};

potumTest.prototype.testFactNegative = function() {
	var actual = fact(-5);
	var expected = 1;
	assertEquals(expected, actual);
};

potumTest.prototype.testFactDouble = function() {
	var actual = fact(5.5);
	var expected = 162.421875;
	assertEquals(expected, actual);
};

potumTest.prototype.testFactNull = function() {
	var actual = fact(null);
	var expected = 1;
	assertEquals(expected, actual);
};

potumTest.prototype.testFactUndefined = function() {
	var actual = fact(undefined);
	var expected = 1;
	assertEquals(expected, actual);
};

potumTest.prototype.testFactString = function() {
	var actual = fact("One");
	var expected = 1;
	assertEquals(expected, actual);
};

potumTest.prototype.testPi = function() {
	var actual = calcpi();
	var expected = Math.PI;
	assertEquals(expected, actual);
};

potumTest.prototype.testPowA = function() {
	var result = pow(2,3);
	var expected = 8;
	assertEquals(expected, result);
};

potumTest.prototype.testPowB = function() {
	var result = pow(null,3);
	var expected = 0;
	assertEquals(expected, result);
};

potumTest.prototype.testPowC = function() {
	var result = pow(null,null);
	var expected = 1;
	assertEquals(expected, result);
};

potumTest.prototype.testPowD = function() {
	var result = pow(-2.0,null);
	var expected = 1;
	assertEquals(expected, result);
};

potumTest.prototype.testPowE = function() {
	var result = pow(-2.0,null);
	var expected = 1;
	assertEquals(expected, result);
};

potumTest.prototype.testPowF = function() {
	var result = pow(2.5,-9.9);
	var expected = 1;
	assertEquals(expected, result);
};

potumTest.prototype.testPowG = function() {
	var result = pow(2.5,2.3);
	var expected = 15.625;
	assertEquals(expected, result);
};

potumTest.prototype.testPowG = function() {
	var result = pow("hi","hello");
	var expected = 1;
	assertEquals(expected, result);
};

potumTest.prototype.testLSinA = function() {
	var x = -2;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinB = function() {
	var x = 2;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinC = function() {
	var x = null;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinD = function() {
	var x = "String";
	var result = lsin(x) + x;
	var expected = "NaNString";
	assertEquals(expected, result);
};

potumTest.prototype.testLCosA = function() {
	var x = -1;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosB = function() {
	var x = 1;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosC = function() {
	var x = null;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosD = function() {
	var x = "String";
	var result = lcos(x) + 1;
	assertNotNull(result);
	assertNotUndefined(result);
};

potumTest.prototype.testSolve = function() {
	var a = solve(f, 0, 2 * pi);
	var expected = 2.3098814600100575;
	assertEquals(expected, a);
};

