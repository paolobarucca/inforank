
function Shannon=ShannonCalculation(LengthMarginals,P)

Shannon=0;
for i=1:LengthMarginals
    for j=1:LengthMarginals
        if P(i,j)~=0 && P(i,j)~=1
           Shannon=Shannon-P(i,j)*log(P(i,j))-(1-P(i,j))*log(1-P(i,j));
        end
    end
end