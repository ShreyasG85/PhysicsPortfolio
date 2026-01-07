function convertToBin(n, p)
    % for number of arguments
    if nargin == 1
        p = 1;
    end

    % Check for range
    if (abs(n)<(2^(-100))) || (abs(n)>(2^100))
        error("Out of range");
        return;
    end

    % getting mantissa and exponent
    if abs(n)<1
        for i = (1:100)
            k = abs(n)/(2^(-i));
            if k>=1 && k<2
                exp = -i;
                break
            end
        end
    elseif abs(n)>1
        for i = (1:100)
            k = abs(n)/(2^i);
            if k>=1 && k<2
                exp = i;
                break
            end
        end
    elseif abs(n) == 1
        k = 1;
        exp = 0;
    end
    mantissa = k-1;

    % Sign bit
    if sign(n) == 1 || sign(n)==0
        signn = "0";
    else
        signn = "1";
    end

    % Mantissa bits
    x = mantissa;
    b = "";
    while true
        x = x * 2;
        if x > 1
            b = b + "1";
            x = x - 1;
        elseif x < 1
            b = b +"0";
        elseif x == 1
            b = b + "1";
            break
        end
    end
    
    if p == 1
        biased_exp = exp + 127;
        if length(b) ~= 23
            mnt = b;
            for i = 1:(23-length(b))
                mnt = [mnt, '0'];
            end
        else
            mnt = b;
        end
    elseif p == 2
        biased_exp = exp + 1023;
        if length(b) ~= 52
            mnt = b;
            for i = 1:(52-length(b))
                mnt = [mnt, '0'];
            end
        else
            mnt = b;
        end
    else
        error("Unknown Argument for precision");
    end
    
    % exponent bits
    B = "";
    y = biased_exp;
    while y ~= 0
        remainder = mod(y,2);
        if remainder == 0
            B = "0" + B;
            y = y/2;
        elseif remainder == 1
            B = "1" + B;
            y = (y-remainder)/2;
        end
    end
    
    if p == 1
        if length(B) ~= 8
            expn = '';
            for i = 1:(length(B)-1)
                expn = ['0', expn];
            end
            expn = [expn, B];
        else
            expn = B;
        end
    elseif p == 2
        if length(B) ~= 11
            expn = '';
            for i = 1:(length(B)-1)
                expn = ['0', expn];
            end
            expn = [expn, B];
        else
            expn = B;
        end
    else
        error("Unknown Precision")
    end
    
    % output
    fprintf(" Sign Binary: %s \n Exponent Binary: %s \n Mantissa Binary: %s",signn,expn,mnt);
end
        

