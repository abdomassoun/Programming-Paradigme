% Function: SumAcc
% Description: Calculates the sum of the first N square numbers recursively.
% Parameters:
%   - N: The number of square numbers to sum.
%   - Acc: The accumulator to keep track of the sum.
% Returns:
%   - The sum of the first N square numbers.
declare
fun {SumAcc N Acc}
   if N==0 then Acc
   else {SumAcc N-1 Acc + N*N}
   end
end

% Function: Sum
% Description: Calculates the sum of the first N square numbers.
% Parameters:
%   - N: The number of square numbers to sum.
%   - Acc: The initial accumulator value.
% Returns:
%   - The sum of the first N square numbers.
fun {Sum N Acc}
   {SumAcc N 0}
end

% Print the sum of the first 4 square numbers
{Browse {Sum 4 0}}