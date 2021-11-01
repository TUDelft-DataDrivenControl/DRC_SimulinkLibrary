function fastgeneratewndfile(time, windSpeed)
% Generates an OpenFAST compatible .wnd file according by providing a 
% 1-dimensional time and value (wind speed) array.
%
% fastgeneratewndfile(TIME, WINDSPEED) - Generates a .wnd file in the
% current folder according to a one-dimensional TIME vector, and a 
% one-dimensional WINDSPEED vector. No vertical speed, horizontal/vertical
% or wind directions are set (=0).
%
% S.P. Mulders (Sebastiaan)
% Delft Center for Systems and Control (DCSC)
% The Netherlands, 2021

    fid = fopen([pwd, '\wind.wnd'], 'wt');
    fprintf(fid, '!Wind file for trivial turbine. \n');
    fprintf(fid, '!Time  Wind     Wind		Vert.       Horiz.      Vert.       LinV        Gust \n');
    fprintf(fid, '!      Speed    Dir    Speed       Shear				Shear       Shear       Speed \n');
    for i = 1:length(time)
        fprintf(fid, '%2.4f			%2.6f		0		0		0		0		0		0\n', time(i), windSpeed(i));
    end
    fclose(fid);
end

