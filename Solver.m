
function [P,fitness]=Solver(Kout,Kin,Link,LengthMarginals)

x0=[Kout/sqrt(Link),Kin/sqrt(Link)];
options=optimset('Display','iter','Algorithm','levenberg-marquardt','Jacobian','on','DerivativeCheck','off','MaxFunEvals',10^3,'MaxIter',10^3,'TolX',10^(-10),'TolFun',10^(-10));
[fitness,fval,exitflag]=fsolve(@(x)Solver_DBCM(x,Kout,Kin,LengthMarginals),x0,options);

xfit=fitness(1:LengthMarginals);
yfit=fitness((LengthMarginals+1):(2*LengthMarginals));
P=zeros(LengthMarginals);
        for i=1:LengthMarginals
            for j=1:LengthMarginals
                if i~=j
                   P(i,j)=(xfit(i)*yfit(j))/(1+xfit(i)*yfit(j));
                end
            end
        end