superleague1617 = readtable("superleague1617.csv");
teams = unique(superleague1617.home);
x0 = zeros((2*length(teams))+2,1);
Aeq = [(1/length(teams))*ones(1,length(teams)),zeros(1,2+length(teams));zeros(1,length(teams)),(1/length(teams))*ones(1,length(teams)),0,0];
beq = [1;1];
f = @(x)sqerrorsoc(x,superleague1617,teams);
options = optimoptions('fmincon');
options.MaxIterations = 1000;
options.Display = 'iter';
options.MaxFunctionEvaluations = 300000;
sol = fmincon(f,x0,[],[],Aeq,beq,[],[],[],options);


% Create a table with the offensive and defensive ratings of a team 
team_ratings = table();
team_ratings(1:16,1) = table(teams);
team_ratings(1:16,2) = table(sol(1:16));
team_ratings(1:16,3) = table(sol(17:32));
% the following two variables keep the adjuted expected number of goals for
% a home/away average team
home_mean_goal = sol(33);
away_mean_goal = sol(34);

% if you want to predict the probability of a home team win, loss or draw
% use the socpredict.m function that models the number of goals scored by a
% team with a Poisson distribution