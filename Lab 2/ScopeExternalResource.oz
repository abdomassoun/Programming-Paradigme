-- This file demonstrates the concept of scope in Oz programming language.
-- It defines two functions, P and Q, which take parameters X and Z respectively.
-- The local variables X, Y, and Z are initialized with values 1, 2, and 3 respectively.
-- The function P multiplies X and Y, and adds Z to the result.
-- The function Q also multiplies X and Y, and adds Z to the result.
-- The expressions {P 42} and {Q 42} are evaluated and the results are printed using the Browse command.
-- The expected result for {P 42} is 555, and for {Q 42} is 777.
local P Q X = 1 Y = 2 Z = 3 in
fun {P X}
    X * Y + Z
end
fun {Q Z}
    X * Y + Z
end
{Browse {P 42} == 555}
{Browse {Q 42} == 777}
end