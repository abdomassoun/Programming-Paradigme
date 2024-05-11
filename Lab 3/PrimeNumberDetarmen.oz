/**
 * Determines whether a given number is prime.
 *
 * @param N - The number to check for primality.
 * @returns {boolean} - Returns true if the number is prime, false otherwise.
 */
fun {Prime N}
    fun {IsDivisible N Divisor}
        if Divisor == 1 then true
        else N mod Divisor == 0 | false
        end
    end

    fun {PrimeAux N Divisor}
        if Divisor == 1 then true
        else N mod Divisor == 0 | false
            else {PrimeAux N (Divisor-1)}
        end
    end

    {PrimeAux N (N div 2)}
end

{Browse {Prime 7}}