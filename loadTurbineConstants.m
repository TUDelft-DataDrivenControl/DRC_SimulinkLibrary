function P = loadturbineconstants(turbineName)
% loadturbineconstants - Returns a structure with constants for a
% reference wind turbine model.
%
% P = loadturbineconstants(TURBINENAME) - P is the structure containing
% all wind turbine constant parameteters and TURBINENAME is a string
% specifying the reference wind turbine model. Currently the following
% turbines are supported:
% - NREL5MW
%
% S.P. Mulders (Sebastiaan)
% Delft Center for Systems and Control (DCSC)
% The Netherlands, 2021

rpm2rads = pi/30;
rads2rpm = 30/pi;
deg2rad = pi/180;
rad2deg = 180/pi;

if strcmpi(turbineName, 'NREL5MW')
    P.H = 90;                               % Tower height [m]
    P.R = 63;                               % Rotor length [m]
    P.A = pi*P.R^2;                         % Rotor area [m^2]
    P.rho = 1.225;                          % Air density [kgm^-3]
    P.G = 97;                               % Gearbox ratio [-]
    P.Jb = 11776047;                        % Second mass moment of inertia of a single blade, at LSS [kg m^2]
    P.Jh = 115926;                          % Second mass moment of inertia of the hub, at LSS [kg m^2]
    P.Jg = 534.116;                         % Second mass moment of inertia of the generator, at HSS [kg m^2]
    P.Jlss = 3*P.Jb + P.Jh + P.Jg*P.G^2;    % Second mass moment of inertia of rotor, at LSS [kg m^2]
    P.Jhss = P.Jlss/P.G^2;                  % Second mass moment of inertia of rotor, casted to HSS [kg m^2]
    P.Prated = 5e6;                         % Rated power [W]
    P.etag = 0.944;                         % Generator efficiency [-]
    P.wgen_min = 0*rpm2rads;                % Minimum generator speed [rad/s]
    P.wgen_max = 1600*rpm2rads;             % Maximum generator speed [rad/s]
    P.wrot_min = P.wgen_min/P.G;            % Minimum generator speed [rad/s]
    P.wrot_max = P.wgen_max/P.G;            % Maximum generator speed [rad/s]
    P.pitchFine = 0*deg2rad;                % Fine pitch angle [rad]
else
    error('Invalid turbine name')
end

end