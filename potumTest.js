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

potumTest.prototype.testPowPositive = function() {
	var result = pow(2,3);
	var expected = Math.pow(2,3);
	assertEquals(expected, result);
};

potumTest.prototype.testPowNullFirst = function() {
	var result = pow(null,3);
	var expected = Math.pow(null,3);
	assertEquals(expected, result);
};

potumTest.prototype.testPowBothNull = function() {
	var result = pow(null,null);
	var expected = Math.pow(null,null);
	assertEquals(expected, result);
};

potumTest.prototype.testPowNullLast = function() {
	var result = pow(-2.2,null);
	var expected = Math.pow(-2.2, null);
	assertEquals(expected, result);
};

potumTest.prototype.testPowString = function() {
	var result = pow("hi","hi");
	var expected = Math.pow("hi","hi");
	assertEquals(expected, result);
};

potumTest.prototype.testPowNegative = function() {
	var result = pow(-2,-2);
	var expected = Math.pow(-2,-2);
	assertEquals(expected, result);
};

potumTest.prototype.testPowBaseNegative = function() {
	var result = pow(-2,2);
	var expected = Math.pow(-2,2);
	assertEquals(expected, result);
};
potumTest.prototype.testPowDouble = function() {
	var result = pow(2.5,2.3);
	var expected = Math.pow(2.5,2.3);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinPostive = function() {
	var x = 2;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinZero = function() {
	var x = 0;
	var result = lsin(x) + x;
	var expected = lsin(x) + x;
	assertEquals(expected, result);
};

potumTest.prototype.testLSinNull = function() {
	var x = null;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinString = function() {
	var x = "String";
	var result = lsin(x) + x;
	var expected = "NaNString";
	assertEquals(expected, result);
};

potumTest.prototype.testLSinDouble = function() {
	var x = 1.1;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLSinNegative = function() {
	var x = -1;
	var result = lsin(x) + x;
	var expected = Math.sin(x);
	assertEquals(expected, result);
};
potumTest.prototype.testLCosPostive = function() {
	var x = 1;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosZero = function() {
	var x = 0;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosNull = function() {
	var x = null;
	var result = lcos(x) + 1;
	var expected = Math.cos(x);
	assertEquals(expected, result);
};

potumTest.prototype.testLCosDouble = function() {
	var x = 3.3;
	var result = lcos(x) + 1;
	assertNotNull(result);
	assertNotUndefined(result);
};

potumTest.prototype.testLCosNegative = function() {
	var x = -3;
	var result = lcos(x) + 1;
	assertNotNull(result);
	assertNotUndefined(result);
};
potumTest.prototype.testSolve = function() {
	var a = solve(f, 0, 2 * pi);
	var expected = 2.3098814600100575;
	assertEquals(expected, a);
};

