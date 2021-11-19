function [U, t] = steppedwindprofile(VMIN, VMAX, TS, TMAX)
% STEPPEDWINDPROFILE - Generates a time-series of a stepped wind profile
%
% [U, T]=STEPPEDWINDPROFILE(VMIN, VMAX, TS, TMAX)) - returns an equally 
% spaced wind speed vector U and corresponding time vector T, representing 
% a stepped wind signal starting from the minimum initial wind speed VMIN 
% and ending at VMAX. The constant TS defines the signal sampling time and 
% TMAX the total length of the signal.
%
% S.P. Mulders (Sebastiaan)
% Delft Center for Systems and Control (DCSC)
% The Netherlands, 2021

t = 0:TS:TMAX;
U = VMIN-1+ceil((VMAX-VMIN+1)*t/TMAX);
U(1) = VMIN;

end