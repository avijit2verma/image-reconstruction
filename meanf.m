function m = meanf(x)
nans = isnan(x);
x(nans) = 0;
n = sum(~nans);
n(n==0) = NaN; % prevent divideByZero warnings
% Sum up non-NaNs, and divide by the number of non-NaNs.
m = sum(x) ./ n;