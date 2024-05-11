% Function: MainMirror
% Description: This function takes an integer as input and returns its mirror image.
% Parameters:
% - Int: The integer to be mirrored
% Returns:
% - The mirror image of the input integer

fun {MainMirror Int}
    local Mirror in
        fun {Mirror Int Acc}
            if Int == 0 then Acc
            else {Mirror Int div 10 (Acc*10 + Int mod 10)}
            end
        end
        {Mirror Int 0}
    end
end

{Browse {MainMirror 1234}}