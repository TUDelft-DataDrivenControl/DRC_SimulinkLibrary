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
    
    P.k_dt = 8.67637e08;                    % Drivetrain torsional spring constant, at LSS (N-m/rad)
    P.c_dt = 6.215e06;                      % Drivetrain torsional damper coefficient, at LSS (N-m/(rad/s))
    P.etag = 0.944;                         % Generator efficiency [-]
    
    P.wg_min = 0*rpm2rads;                  % Minimum generator speed [rad/s]
    P.wg_max = 1600*rpm2rads;               % Maximum generator speed [rad/s]
    P.wg_rated = 1173.7*rpm2rads;           % Rated generator speed [rad/s]
    P.wr_min = P.wg_min/P.G;                % Minimum generator speed [rad/s]
    P.wr_max = P.wg_max/P.G;                % Maximum generator speed [rad/s]
    P.wr_rated = P.wg_rated/P.G;            % Maximum generator speed [rad/s]
    P.beta_fine = deg2rad(0);                % Fine pitch angle [rad]
    P.Tg_rated = 43093.55;                  % Minimum generator torque (mechanical) [Nm]
    P.Tg_min = -100;                        % Minimum generator torque (mechanical)[Nm]
    P.Tg_max = P.Tg_rated*2;                % Minimum generator torque (mechanical) [Nm]
    P.Pg_rated = 5e6;                       % Rated power [W]
    P.Pg_min = -100;                        % Rated power [W]
else
    error('Invalid turbine name')
end

end