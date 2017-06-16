function b = sqerrorsoc(x,y,teams)

home = string(y.home);
away = string(y.away);
b = 0;
for i = 1:length(table2array(y(:,1)))
    o = find(teams == home(i));
    d = find(teams == away(i));
    b = b + (table2array(y(i,4)) - (x(33)*x(o)*x(d+16)))^2;
    b = b + (table2array(y(i,5)) - (x(34)*x(o+16)*x(d)))^2;
end
