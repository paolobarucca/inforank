% Barucca, P., Caldarelli, G., & Squartini, T. (2017). Tackling information asymmetry in networks: a new entropy-based ranking index. 
% arXiv preprint arXiv:1710.09656.

function [Rank,ACC]=InfoRank(M)

% --- Calculating the sufficient statistics --- %

A=sign(M);
[Kout,Kin,Link,LengthMarginals]=StatisticsCalculation(A);

% --- Calculating the benchmark information --- %

[P,fitness]=Solver(Kout,Kin,Link,LengthMarginals);
Shannon=ShannonCalculation(LengthMarginals,P);

% --- Reducing the original matrix --- %

Rank=zeros(LengthMarginals,1);
ACC=zeros(LengthMarginals,1);
    for i=1:LengthMarginals
        B=Reduction(A,i);
        
% --- Calculating the reduced, sufficient statistics --- %
    
        [KoutRed,KinRed,LinkRed,LengthMarginalsRed]=StatisticsCalculation(B);
    
% --- Calculating the reduced, benchmark information --- %
    
        [P,fitness]=Solver(KoutRed,KinRed,LinkRed,LengthMarginalsRed);
        ShannonRed=ShannonCalculation(LengthMarginalsRed,P);
        Rank(i)=1-ShannonRed/Shannon;

% --- Restoring the original matrix --- %

        Pfull=Expansion(LengthMarginals,LengthMarginalsRed,A,P,i);
        
% --- Calculating accuracy --- %

        [TP,FN,TN,FP]=IndexCalculation(LengthMarginals,A,Pfull);
        ACC(i)=(TP+TN)/(TP+FP+TN+FN);
    end
