% This code demonstrates the concept of scope in Oz programming language.

local X = 1 in
    % This local declaration of X creates a new scope.
    local X = 2 in
        % This local declaration of X creates another new scope.
        local X = 3 in
            {Browse X} % (1)
        end
    end
    {Browse X} % (2)
end