
function [TP,FN,TN,FP]=IndexCalculation(LengthMarginals,A,PRed)

	TP=sum(sum(PRed.*A));
	FN=sum(sum(A))-TP;
	TN=sum(sum((1-PRed).*(1-A)))-LengthMarginals;
	FP=((LengthMarginals*(LengthMarginals-1))-sum(sum(A)))-TN;