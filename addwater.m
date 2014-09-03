function y = addwater(L1,L2,y1,y2)
%ADDWATER Summary of this function goes here
%   Detailed explanation goes here
 y = (L1 * y1 + (L2-L1) * y2) / L2;

end

