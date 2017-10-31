
function [Kout,Kin,Link,LengthMarginals]=StatisticsCalculation(M)

    Kout=sum(M')';
    Kin=sum(M)';
    Link=sum(Kout);
    LengthMarginals=length(Kout);