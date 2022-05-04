clc 

clear all ;

Nt =150;

%55close all;

fname = 'Heatrelease';

wkdir = ['/work/home/anindya/Kanishque_Cases/LES_runs/SYmpara_ms450'];
% wkdir = '/mnt/lustre/ase3/aseanind/Kanishque_Cases/LES_meshchange_Sankaran13/0H2_Sens0.7_SYm0.425_ADT2_ms255' ;
[x0,t0] = get_fil_flame_field2(wkdir,fname,Nt);


X0 = x0(:,1);

T0 = t0(:,1);

Tmax = max(T0)

halfmax = Tmax/2

% X1 = unique(X0);
% T1 = unique(T0);


index1 = find(T0 == Tmax, 1, 'first');


index1


Ni=6;

for ii = 1:Ni
    X2(ii) = X0(index1 - Ni + ii -1);
    X2(2*Ni +2 -ii) = X0(index1 + Ni - ii +2);
    
    T2(ii) = T0(index1 - Ni + ii -1) -halfmax;
    T2(2*Ni +2 -ii) = T0(index1 + Ni - ii + 2) -halfmax;
    
    X2(Ni+1) = X0(index1);
    T2(Ni+1) = T0(index1) - halfmax;

   
end


 
   X2(5) = [];  
   T2(5) = [];
%   X2(11) = [];
%   T2(11) = [];
X2

T2 
 

% f = find(T1==max(T1)); 
% cp = X1(f);% ignore Matlabs suggestion to fix!!!
% y1= T1./Tmax;
% ydatawr(:,1) = y1;
% ydatawr(:,2) = X1;
% newFit1=find(X1>= cp);
% newFit2=find(X1 < cp);
% ydatawr2 = ydatawr(min(newFit1):max(newFit1),:);
% ydatawr3 = ydatawr(min(newFit2):max(newFit2),:);
% sp1 = spline(ydatawr2(:,1),ydatawr2(:,2),xx);
% sp2 = spline(ydatawr3(:,1),ydatawr3(:,2),xx);
% Fullw = sp1-sp2

T2halfmax = max(T2)/2

xx = linspace(0.0380, 0.0408, 250);

ss = spline(X2,T2)

s = spline(X2, T2, xx);

plot (X2,T2,'o',xx,s,'-')

 x = fnzeros(ss)
 
% 
%  index2 = find(s >= 0, 1, 'first');
%   index3 = find(s >= 0, 1, 'last');
%   
%   xx(index2)
%   xx(index3)
%   s(index2)
%   s(index3)

dR = x(2,2) - x(1,1)


