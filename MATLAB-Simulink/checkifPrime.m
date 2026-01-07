function y = checkPrime()
    x = input('Enter an integer to check whether it is a prime number or not: ');
    y = true;
% 1 is not a prime Number
    if x == 1
        y = false;
% 2 is a prime number
    elseif x == 2
        y = true;
% Checking prime numbers
    else
        for i = 2:x-1
            if mod(x,i) == 0
                y = false;
                break;
            end
        end
    end
% Output with formatting
    if y
        fprintf('%2i is a Prime Number!',x)
    else
        fprintf('%2i is not a Prime Number',x)
    end
end
% Results in the algorithm page
