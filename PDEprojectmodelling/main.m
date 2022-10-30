clear all
close all
clc
% ---------------------------------------
% The simplest case
% ---------------------------------------
L = 0.6; % length of the tank
D = 1.431e-7; % diffusion coefficient of water
% H = 0.15 / 60; % cooling capacity

N = 128; % the number of grid cells - distance
M = 100; % the number of grid cells - time
tMax = 16 * 3600;

l_boun = -15; % left boundary condition T(0, t) = -15
r_boun = -15; % right boundary condition T(L, t) = -15
ini_cond = 10; % initial condition T(x,0)=10

solve22(L, D, N, M, tMax, l_boun, r_boun, ini_cond);




