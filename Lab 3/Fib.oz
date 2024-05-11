-- This file contains the implementation of the Fibonacci sequence in Oz programming language.

local FibAux in
    -- Helper function to calculate the Fibonacci sequence recursively.
    fun {FibAux N Acc1 Acc2}
        if N == 0 then Acc1
        else {FibAux (N-1) Acc2 (Acc1+Acc2)}
        end
    end

    -- Function to calculate the Fibonacci sequence up to a given number.
    fun {Fib N}
        {FibAux N 0 1}
    end
end

-- Print the 6th number in the Fibonacci sequence.
{Browse {Fib 6}}