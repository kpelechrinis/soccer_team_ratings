function [w,l,d] = socpredict(ho,ao,hd,ad,hg,ag)
% ho, hd, hg: home team offensive rating, home team defensive rating,
% average home team expected goals scored
% ao, ad, ag: away team offensive rating, away team defensive rating,
% average away team expected goals scored

w = 0;
l = 0;
d = 0;
for i = 1:100000
    egh = poissrnd(hg*ho*ad);
    ega = poissrnd(ag*ao*hd);
    if (egh > ega)
        w = w+1;
    end
    if (egh < ega)
        l = l+1;
    end
    if (egh == ega)
        d = d+1;
    end
end
w = w/100000;
l = l/100000;
d = d/100000;
