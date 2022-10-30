% return the cooling capacity H
function col_cap=col_cap(x)

if (x >= 0.18 && x <= 0.22) || (x >= 0.38 && x <= 0.42)
    col_cap = 0;
else
    col_cap = 0.15/ 60;
end