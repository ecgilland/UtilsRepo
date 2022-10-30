function T=T(x, n, D, H, L, t)
    B = -H / (2*D) * c2(n, L) + H*L / (2*D) * c1(n, L) + 27*c0(n);
    T = B * exp(-D * t * ((n*pi)/L)^2) * sin((n * pi * x) / L);
end