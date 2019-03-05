clear; clc;

q = [90, 0, 0, 0, 0, 0, 0];
L = [16.535, 15.748, 4.961];
L_SB = 14.173;
n = size(q,2);

DH = [  0,      0,      0,      q(1);
        -90,    0,      0,      q(2);
        90,     0,      L(1),   q(3);
        -90,    0,      0,      q(4);
        90,     0,      L(2),   q(5);
        -90,    0,      0,      q(6);
        90,     0,      L(3),   q(7)];

T_SB = forKine([0,0,L_SB,0]);

T = zeros(n*4,4);
TT0 = T_SB;
for i=1:n
    TT = TT0*forKine(DH(i,:));
    T(((i-1)*4+1):(i*4),1:4) = TT;
    TT0 = TT;
end

P = zeros(3,n);
for j=1:n
    P(:,j) = T(((j-1)*4+1):((j-1)*4+3),4);
end

mx = 60;
disp(P)
plot3(P(1,:),P(2,:),P(3,:),'-o')
xlim([-mx mx])
ylim([-mx mx])
zlim([-mx mx])
xlabel('x')
ylabel('y')
zlabel('z')
grid on