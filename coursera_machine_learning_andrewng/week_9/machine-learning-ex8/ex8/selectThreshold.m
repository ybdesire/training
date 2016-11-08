function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;
    
    predict = zeros(size(pval,1),1);
    for j=1:size(pval,1)
        if(pval(j)<epsilon)
            predict(j)=1;
        end
        if(yval(j)==1 && predict(j)==1)
            TP = TP+1;
        elseif(yval(j)==0 && predict(j)==0)
            TN = TN +1;
        elseif(yval(j)==1 && predict(j)==0)
            FN = FN+1;
        elseif(yval(j)==0 && predict(j)==1)
            FP = FP+1;
        end
    end


    PREC = TP/(TP+FP);
    REC = TP/(TP+FN);
    F1 = 2*PREC*REC/(PREC+REC);



    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
