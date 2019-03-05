function [T, R, P] = forKine(DH)
% Determines link transformation matrix given modified DH parameters
%
% Input:
% "DH(1)"       is the link twist in degrees
% "DH(2)"       is the link length
% "DH(3)"       is the link offset
% "DH(4)"       is the joint angle in degrees
%
% Output:
% "T"           is the link transformation matrix
% "R"           is the rotation matrix portion
% "P"           is the translation matrix portion

R = [   cosd(DH(4)),                -sind(DH(4)),               0;
        sind(DH(4))*cosd(DH(1)),    cosd(DH(4))*cosd(DH(1)),    -sind(DH(1));
        sind(DH(4))*sind(DH(1)),    cosd(DH(4))*sind(DH(1)),    cosd(DH(1))];

P = [DH(2); -sind(DH(1))*DH(3); cosd(DH(1))*DH(3)];

T = [R P];
T = [T; 0,0,0,1];

end