function y = infNorm(A)

    % intialising
    x = abs(A);
    [rows, ~] = size(x);
    s = [];

    % creating array of the sum of absolute value for each row element
    for i = 1:rows
        s(end + 1) = sum(x(i,:));
    end

    % Choosing the maximum 
    y = max(s);

end