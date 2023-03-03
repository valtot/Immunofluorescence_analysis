function [P,offsetH,offsetV] = padImage(I,sz)
if sz>=size(I)
P = zeros(sz);
offsetH = floor((size(P,2)-size(I,2))/2);
offsetV = floor((size(P,1)-size(I,1))/2);

P(offsetV+1:offsetV+size(I,1),offsetH+1:offsetH+size(I,2)) = I;
offsetH = offsetH+1;
offsetV = offsetV+1;
else
    warning('Specified size is smaller than the original size. No padding')
end

end

