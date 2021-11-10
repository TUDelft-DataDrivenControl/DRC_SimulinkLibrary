function loadglobalconstants()

% LOADGLOBALCONSTANTS - Provides frequently used constants
% 
% LOADGLOBALCONSTANTS() - Loads frequently used constants in the base
% workspace. Constants include conversion factors, ... .
%
% S.P. Mulders (Sebastiaan)
% Delft Center for Systems and Control (DCSC)
% The Netherlands, 2021

deg2rad = pi/180; % Conversion factor [rad/deg]
assignin('base','deg2rad',deg2rad);

rad2deg = 180/pi; % Conversion factor [deg/rad]
assignin('base','rad2deg',rad2deg);

rpm2rads = pi/30; % Conversion factor [(rad/s)/rpm]
assignin('base','rpm2rads',rpm2rads);

rads2rpm = 30/pi; % Conversion factor [rpm/(rad/s)]
assignin('base','rads2rpm',rads2rpm);

end