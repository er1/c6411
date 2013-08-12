import math
import unittest
import potum

class Test(unittest.TestCase):
        
        def setUp(self):
                self.x = 0
                self.pi = potum.calcpi()
                self.y = self.pi / 3
                self.z = self.pi / 6
                self.a = self.pi / 9
                self.b = self.pi / 12
                
        def testFactPositive(self):
                expected = 120
                self.assertEqual(expected,potum.fact(5))
        def testFactNegative(self):
                expected = 1
                self.assertEqual(expected,potum.fact(-5))
        def testFactDouble(self):
                expected = 162.421875
                self.assertEqual(expected,potum.fact(5.5))
        
        def testFactNull(self):
                expected = 1
                self.assertEqual(expected,potum.fact(null))       
        def testFactString(self):
                expected = 1
                self.assertEqual(expected,potum.fact(""))        
        def testCosPositive(self):
                self.assertEqual(potum.lcos(self.x) + 1,math.cos(self.x))
        def testCosString(self):
                self.assertEqual(potum.lcos("") + 1,math.cos(""))                   
        def testCosPositive(self):
                self.assertEqual(potum.lcos(self.z) + 1,math.cos(self.z))
        def testCosPositive(self):
                self.assertEqual(potum.lcos(self.a) + 1,math.cos(self.a))
        def testCosNegative(self):
                self.assertEqual(potum.lcos(-self.b) + 1,math.cos(-self.b))
        def testCosString(self):
                self.assertEqual(potum.lcos("") + self.b,math.cos(""))
        def testSinePositive(self):
                self.assertEqual(potum.lsin(self.x) + self.x,math.sin(self.x))
        def testSinePositive(self):
                self.assertEqual(potum.lsin(self.y) + self.y,math.sin(self.y))
        def testSinePositive(self):
                self.assertEqual(potum.lsin(self.z) + self.z,math.sin(self.z))        
        def testSineNegative(self):
                self.assertEqual(potum.lsin(self.a) + self.a,math.sin(self.a))
        def testSineString(self):
                self.assertEqual(potum.lsin("") + self.b,math.sin(""))        
        def testPowerPositive(self):
                self.assertEqual(potum.pow(2,3),math.pow(2,3))        
        def testPowerNegative(self):
                self.assertEqual(potum.pow(5,-3),math.pow(5,-3))
        def testPowerAllNegative(self):
                self.assertEqual(potum.pow(-5,-3),math.pow(-5,-3))
        def testPowerOneNegative(self):
                self.assertEqual(potum.pow(5,-3),math.pow(5,-3))
        def testPowerString(self):
                self.assertEqual(potum.pow("",3),math.pow("",3))
        def testSolve(self):
                a = potum.solve(f, 0, 2 * pi)
                expected = 2.3098814600100575
                self.assertEqual(a, expected)
        

if __name__ == '__main__':
    unittest.main()
