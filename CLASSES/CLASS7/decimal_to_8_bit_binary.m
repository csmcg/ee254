function [binary] = decimal_to_8_bit_binary(decimal)
    n = 8;
    
    decimal = mod(decimal / 256);
    
    for index = 1:1:n
        binary(n - index + 1) = mod(decimal, 2);
        decimal = floor(decimal / 2);
    end
    
end

