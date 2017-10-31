
function [G,J]=Solver_DBCM(h,KOut,KIn,LengthMarginals)

x=h(1:LengthMarginals);
y=h((LengthMarginals+1):(2*LengthMarginals));

g=zeros(LengthMarginals,1);
f=zeros(LengthMarginals,1);
         for i=1:LengthMarginals
            for j=1:LengthMarginals
                if i~=j
                   g(i)=g(i)+(x(i)*y(j))/(1+x(i)*y(j));
                   f(i)=f(i)+(x(j)*y(i))/(1+x(j)*y(i));
                end
            end
         end
Observed=[KOut;KIn];         
Expected=[g;f];
G=Observed-Expected;

jac=zeros(2*LengthMarginals);
         for i=1:LengthMarginals
             for j=1:LengthMarginals
                 if i ~= j
                    jac(i,i)=jac(i,i)+(y(j)/(1+x(i)*y(j))^2);
                 end
             end
         end
         for i=(LengthMarginals+1):(2*LengthMarginals)
             for j=(LengthMarginals+1):(2*LengthMarginals)
                 if i ~= j
                    jac(i,i)=jac(i,i)+(x(j-LengthMarginals)/(1+x(j-LengthMarginals)*y(i-LengthMarginals))^2);
                 end
             end
         end
         for i=1:LengthMarginals
             for j=(LengthMarginals+1):(2*LengthMarginals)
                 if i ~= (j-LengthMarginals)
                    jac(i,j)=(x(i)/(1+x(i)*y(j-LengthMarginals))^2);
                 end
             end
         end
         for i=(LengthMarginals+1):(2*LengthMarginals)
             for j=1:LengthMarginals
                 if (i-LengthMarginals) ~= j
                    jac(i,j)=(y(i-LengthMarginals)/(1+x(j)*y(i-LengthMarginals))^2);
                 end
             end
         end
J=-jac;