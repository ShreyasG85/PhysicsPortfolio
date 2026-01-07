function result = TransDecOtherBase(l, b, m)
    % Negative number 
    isNegative = false;
    if l < 0
        isNegative = true;
        l = abs(l);
    end

    % array being used
    result = zeros(1, m);

    % integer part 
    integerPart = fix(l);

    % overflow
    if integerPart >= b^(m-1)
        error('Overflow');
        return;
    end

    % sign 
    result(1) = isNegative;

    % Conversion
    i = m;
    while integerPart > 0
        result(i) = mod(integerPart, b);
        integerPart = fix(integerPart / b);
        i = i - 1;
    end

    % zeros should be on the left
    for j = 1:i
        result(j) = 0;
    end

    % Display the result
    fprintf('%s',result);
end

% Output of above code from inputs used from Lecture Material being
% verified

%{ 
TransDecOtherBase(23, 2, 8)
    
 ans =

    0     0     0     1     0     1     1     1

TransDecOtherBase(23.45, 2, 8)
    
ans =

    0     0     0     1     0     1     1     1

TransDecOtherBase(39, 12, 3)
 
ans =

     0     3     3

TransDecOtherBase(39, 12, 4)
  
ans =

     0     0     3     3

TransDecOtherBase(39, 16, 4)
  
ans =

     0     0     2     7

TransDecOtherBase(39, 16, 3)
 
ans =

     0     2     7

TransDecOtherBase(39, 16, 2)
Error using TransDecOtherBase
Overflow
%}
