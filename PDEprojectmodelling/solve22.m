% compute numerical solution 

function [sol] = solve(L, D, N, M, tMax, l_boun, r_boun, ini_cond)
tPhase=79;

dx = L / N;
x = 0:dx:0.6;
dt = tMax / M;

sol = zeros(N+1, M+1);
sol(:, 1) = [l_boun; ini_cond .* ones(N-1, 1); r_boun];
R = (D * dt) / (dx * dx);

for n=1:M
    if all(sol(:, n) < -3.5)
        fprintf('the time is %f', (n*dt))
    end
    
    for m=2:N
        H = col_cap((m-1) * dx);
        rhs(m) = (sol(m-1,n) + (-2 + 2/R) * sol(m,n) + sol(m+1,n)) - 2 * dt * H / R; 
    end
    rhs(1) = l_boun;
    rhs(N+1) = r_boun;
    Lar = [0, -1 .* ones(1, N-1), 0];
    Dar = [1, (2 + 2 / R) .* ones(1, N-1), 1];
    Rar = [0, -1 .* ones(1, N-1), 0]; 
    if sol(:,n)==0
         sol(:, n+1) = tdma(Lar, Dar, Rar, rhs, N+1)+tPhase;
    else
        sol(:, n+1) = tdma(Lar, Dar, Rar, rhs, N+1);
    end
end


plot(x, sol(:, 2), '-', 'Displayname', '20 minutes');
hold on
plot(x, sol(:, 5), '-', 'Displayname', '48 minutes');
hold on
plot(x, sol(:, 15), '-', 'Displayname', '2.5hrs');
hold on
plot(x, sol(:, 19), '-','Displayname', 'Tend');
hold on
legend('show')
xlabel('x')
ylabel('Temperature')



