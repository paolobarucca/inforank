
function Pfull=Expansion(LengthMarginals,LengthMarginalsRed,M,P,i)

	PRedtemp=[P(1:i-1,:); zeros(1,LengthMarginalsRed); P(i:end,:)];
    Pfull=[PRedtemp(:,1:i-1), zeros(LengthMarginals,1), PRedtemp(:,i:end)];
    Pfull(i,:)=M(i,:);
    Pfull(:,i)=M(:,i);